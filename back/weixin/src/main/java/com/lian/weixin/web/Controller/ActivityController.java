package com.lian.weixin.web.Controller;

import com.lian.weixin.web.model.Activity;
import com.lian.weixin.web.model.AsignUser;
import com.lian.weixin.web.model.User;
import com.lian.weixin.web.service.ActivityService;
import com.lian.weixin.web.service.ActivityServiceImpl;
import com.lian.weixin.web.service.AsignUserService;
import com.lian.weixin.web.service.UserService;
import io.minio.MinioClient;

import io.minio.errors.*;
import org.omg.CORBA.OBJECT_NOT_EXIST;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.xmlpull.v1.XmlPullParserException;
import sun.nio.cs.ext.MacArabic;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.Thread.sleep;


/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/11:50
 * @Description:
 */
@RestController
public class ActivityController {

    @Autowired
    private AsignUserService asignUserService;
    @Autowired
    private UserService userService;
        private List timeListpool=new ArrayList();


    @Autowired
    private ActivityService activityService;
    private static String url = "http://106.13.204.79:9000";  //minio服务的IP端口
    private static String accessKey = "admin";
    private static String secretKey = "2906176715";
    private final static double EARTH_RADIUS = 6378.137;//地球半径



    //我参加的活动
@RequestMapping(value = "/searchAssignActivity",method = RequestMethod.GET)
    public List<Activity> searchAssignActivity(String openid){

    List activitylist ;//存储通过用户找到的活动的id，需要进行第二次查找
    //先通过assignuser中的用户信息查到一个openid下所有的活动id，再通过活动id去获取活动的信息
    activitylist = asignUserService.selectactivityByid(openid);

    List<Activity> activityList2=new ArrayList<>();//存储查找到的活动对象

    for (int i = 0; i <activitylist.size() ; i++) {
      int id = (int) activitylist.get(i);
        Activity activity = activityService.getActivityByID(id);
        activityList2.add(activity);
    }
    return activityList2;


}
@RequestMapping(value = "/postActivity",method = RequestMethod.POST)
//发布活动,当前参与的用户为0
public Map<String,Object>  postActivity(Activity activity){
    Map<String,Object> map=new HashMap<>();

    try{ activityService.postActivity(activity);}catch (Exception e ){
        map.put("error","发布失败，请重新尝试");
        e.printStackTrace();

        return map;
    }
    String head=activity.getHead();
    String place =activity.getPlace();
    String starttime=activity.getStarttime();

    int id  =activityService.getid(head,place,starttime);

    map.put("success","信息发布成功");
    map.put("id",id);
    return map;

}

//@RequestMapping("getid")
//public Integer getid(String head,String place,String starttime){
//    int a  =activityService.getid(head,place,starttime);
//    return a;
//
//
//}

    //TODO

@RequestMapping("getAllactivity")
    public List<Activity> addActivity(int page,int pagesize){
    //第几页，每页需要多少数量的数据
    return activityService.getActivityLimits(page*pagesize,pagesize);
}



// TODO 2022.5.5
    //根据队伍的id获取活动队伍的人员情况

    @RequestMapping("getTeamMemberNum")
    public Map<String,Object> getmember(int activityid ,  int teamNumber) throws InvalidPortException, InvalidEndpointException, IOException, InvalidKeyException, NoSuchAlgorithmException, InsufficientDataException, InvalidExpiresRangeException, InternalException, NoResponseException, InvalidBucketNameException, XmlPullParserException, ErrorResponseException {
    //判断该活动是否存在这个小队
        Map<String,Object> map=new HashMap<>();

        Activity ac = activityService.getActivityByID(activityid);
        if (ac==null){
            map.put("error","活动id不存在");
            return map;

        }
        int numof=ac.getNumofmate();
        int allnum = ac.getAllnum();

        if (teamNumber>numof||teamNumber<=0){
            map.put("error","该活动没有这个队伍");
            return map;

        }


        int a =asignUserService.selectTeamMemberNum(activityid,teamNumber);
        map.put("num:",a);
        //TODO 5.15 获取用户头像返回
        List<Map<String,Object>> list =asignUserService.selectMemberHeadPic(activityid,teamNumber);
        for (int i = 0; i <list.size() ; i++) {
            MinioClient minioClient = new MinioClient(url, accessKey, secretKey);
            String url = minioClient.presignedGetObject("userheadpic", list.get(i).get("openid")+".jpg");
            map.put((String) list.get(i).get("openid"),url);

        }

    return  map;
    }
@RequestMapping("asignforTeamMember")
    public Map<String,Object> asignfortemmember(String openid,int activityid,int teamNumber) throws ParseException {
    int isleader=0;

    Map<String,Object> hashmap=new HashMap<>();
            //判断是否具有添加的条件
    Activity ac2;
    String starttime = activityService.getStartTime(activityid);
    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    Date parse1 = f.parse(starttime);
    long starttim1 = parse1.getTime();
    Date today=new Date();
    String currenttime=f.format(today);
    Date parse2 = f.parse(currenttime);
    long current=parse2.getTime();
    if(starttim1-current<0){
        hashmap.put("error","已经超过活动报名时间");
        return hashmap;

    }

    try{   ac2= activityService.getActivityByID(activityid);}catch (Exception e ){hashmap.put("error","活动不存在");
        return hashmap;
    }
    if (ac2==null){
        hashmap.put("error","活动不存在");
        return hashmap;
    }
            Activity tempactivity=activityService.getteamnumandallnum(activityid);
          int teamnum= tempactivity.getNumofmate();
            int allnum=tempactivity.getAllnum();
            int oneteamnum=allnum/teamnum;


            //加入的队伍超出要求的队伍的编号
            if (teamNumber>teamnum||teamNumber<=0){
                hashmap.put("error","不存在该队伍");
                return hashmap;
            }
            //获取活动队伍目前已经有的人数量
    int a =asignUserService.selectTeamMemberNum(activityid,teamNumber);
    if (a==oneteamnum){
        hashmap.put("error","该队伍人数已经满了");
        return hashmap;
        //第一个进入的人就是队长
    }if (a==0){
        isleader=1;
    }
    //判断用户是否已经加入该活动
    Activity tempac2= asignUserService.selectUserInTeam(openid,activityid);
    if (tempac2!=null){
        hashmap.put("error","用户已经加入队伍，不要重复加入");
        return hashmap;
    }
        try{    asignUserService.insertmember(openid,activityid,teamNumber,isleader);}catch (Exception e ) {e.printStackTrace();
        hashmap.put("error","添加失败");
        return hashmap;
        }
              hashmap.put("success","添加成功") ;
    return hashmap;
}


//活动解散，解除小队
    //TODO 前端根据活动开始时间和结束时间判断用户是否能进行活动小队的注册
    @RequestMapping("/DisbandTeam")
    public Map<String,Object> disbandTeam(int activityid){
    Map<String,Object> hashmap=new HashMap<>();
  try{ asignUserService.deleteByactivityid(activityid);}catch (Exception e ){
      e.printStackTrace();
      hashmap.put("msg","小队解散失败");
      return hashmap;
  }
  hashmap.put("msg","小队解散成功");
    return hashmap;
    }
//TODO
    @RequestMapping("/uploadactivitypic")
    public String upload(HttpServletRequest request) throws Exception {
        //这样账号改了之后图片也要修改名字
        MultipartHttpServletRequest params= (MultipartHttpServletRequest) request;
        List<MultipartFile> filelist=((MultipartHttpServletRequest) request).getFiles("file");
        String tempid= params.getParameter("id");
        MultipartFile file=filelist.get(0);
        try {
           // int activityid= Integer.parseInt(tempid);
       // Activity ac=   activityService.getActivityByID(activityid);
                String a = file.getContentType();
                if (a.equals("image/jpeg") || a.equals("image/bmp")|| a.equals("image/jpg")|| a.equals("image/png")) {
                    MinioClient minioClient = new MinioClient(url, accessKey, secretKey);//创建客户端对象
                    InputStream is = file.getInputStream(); //得到文件流
                    String fileName = file.getOriginalFilename(); //文件名
                    String contentType = file.getContentType();  //类型

                    minioClient.putObject("activitypic", tempid+".jpg", is, contentType); //把文件放置Minio桶(文件夹)
                    return "上传成功";}else {
                    return "请上传bmp/jpg/png格式的图片";
                }

        } catch (Exception e) {
            return "上传失败";
        }
    }


    // 获取minio文件的下载地址
    @GetMapping("/getactivitipicurl")
    public Map<String,Object>  getheadpicaUrl(String id){
        Map<String,Object>map=new HashMap<>();
        try {
            MinioClient minioClient = new MinioClient(url, accessKey, secretKey);
            String url = minioClient.presignedGetObject("activitypic", id+".jpg");
         //   String wechatname =   userService.searchnickname(openid);
            map.put("url",url);
        //    map.put("nickname",wechatname);
            return map;
        }catch (Exception e){
            map.put("error","获取图片出错");
            return map;

        }
    }
    static double rad(double d) {
        return d * Math.PI / 180.0;
    }
    public static double GetDistance(double lat1, double lng1, double lat2, double lng2) {
        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lng1) - rad(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
                Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = new BigDecimal(s).setScale(3, BigDecimal.ROUND_HALF_UP).doubleValue();
        return s;
    }


    //TODO 5.15
    @RequestMapping("getorderactivity")
    public List<searchid> orderActivity(double latitude,double longtitude,String range ,int page,int limit,String classify){
    //这里的分页做法，先搜索所有符合的地方，然后排序完判断需要的数量返回
        List<Activity> activities = null;
        //选择数据源头。先判断是否有 classify
        if (classify.equals("no")) {

           activities = activityService.getorderActivityLimits(range);
        }else{
            activities=activityService.getorderActivityclassify(range,classify);

        }
        Activity[] orderactivity=new Activity[activities.size()];
        for (int i = 0; i <activities.size() ; i++) {
            //  String place = activities.get(i).getPlace();
            orderactivity[i]=activities.get(i);

        }
        searchid[] list=new searchid[activities.size()];


        for (int i = 0; i <orderactivity.length ; i++) {
            String place =  orderactivity[i].getPlace();
            System.out.println(place);
            String a []=place.split("-");
            String latitudeindb=a[3];
            double latitudeindb2=Double.parseDouble(latitudeindb);

            String longtitudeindb=a[a.length-1];
            double longtitudeindb2 = Double.parseDouble(longtitudeindb);
         // double distance= Math.sqrt( Math.pow(Math.abs(longtitude-longtitudeindb2),2)+ Math.pow(Math.abs(latitude-latitudeindb2),2));
        searchid object=new searchid();
           ActivityController ac=new ActivityController();
          double distance = ac.GetDistance(latitude,longtitude,latitudeindb2,longtitudeindb2);
           object.setDistance(distance);
        //    object.setDistance(distance);
            int id =orderactivity[i].getId();

            object.setId(id);
          list[i]=object;


           // System.out.println("latitude="+latitude+"   longtitude="+longtitude);
        }
        for (int i = 0; i <list.length ; i++) {
            for (int j = i+1; j <list.length ; j++) {
                if (list[i].distance>list[j].distance){
                    //交换位置
                    searchid object=list[i];
                    list[i]=list[j];
                    list[j]=object;

                }
            }
        }
        System.out.println("------------------------------------------");
        //检验
        for (int i = 0; i <list.length ; i++) {
            System.out.println(list[i]);
        }
            List<searchid> resultList =new ArrayList<>();

        for (int i = page*limit; i <page*limit+limit ; i++) {
            //判断是否越界
            if (i>list.length){
                return resultList;

            }
           try{ resultList.add(list[i]);}catch (Exception e ){
               return resultList;

           }
        }

        return resultList;
    }


    //TODO 5.18 通过标题搜索活动
    @RequestMapping("getActivityByHead")
    public List<Map<String,Object>> searchByHead(String head){
    List<Map<String,Object>> list = null;
   try{  list = activityService.getActivityByHead(head);}catch (Exception e ){

   }
    return list;


    }

    //TODO 5.18 通过活动内容搜索相应的活动





    class searchid{
    private int id;
    private double distance ;

        public searchid() {
        }

        public searchid(int id, double distance) {
            this.id = id;
            this.distance = distance;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public double getDistance() {
            return distance;
        }

        @Override
        public String toString() {
            return "searchid{" +
                    "id=" + id +
                    ", distance=" + distance +
                    '}';
        }

        public void setDistance(double distance) {
            this.distance = distance;
        }




    }

    //TODO 5.15 根据活动id获取活动详情
    @RequestMapping("getactivityByid")
    public Activity getActivityid(int id){
        Activity activity;

        activity=activityService.getActivityByID(id);

        return activity;


    }

    //TODO 5.15 通过活动id获取小队id
    @RequestMapping("getteamidByacid")
    public List<Integer> getteamid(int activityid){
    List<Integer> list ;
    list=asignUserService.getteamid(activityid);

    return list;

    }
        //TODO 5.15 通过队伍id获取队伍详细情况
    @RequestMapping("getteamByid")
    public AsignUser getasignUser(int id){
    AsignUser asignUser=asignUserService.getmsgByid(id);
    return asignUser;
    }



    //TODO 5.17通过活动id和小队编号获得小队内成员的openid

    @RequestMapping("/getTeamMemberMsg")
    public Map<String,Object> getTeamMemberOpenid(int activityid,int teamNumber){

    Map<String, Object> map=new HashMap<>();
    List<String> list ;

    list =asignUserService.getTeamMember(activityid,teamNumber);
        for (int i = 0; i <list.size() ; i++) {
            String openid =list.get(i);
            User user = userService.getUserInfo(openid);

            map.put(openid,user);

        }

    return map;

    }

    //TODO 查看我参加的活动
    @RequestMapping("getMyactivity")
    public Map<String,Object> getMyActivity(String openid){
    Map<String,Object> map=new HashMap<>();
        List<Map<String,Object>> list = null;
    try{list = asignUserService.getMyActivity(openid);}catch (Exception e ){
        map.put("error","出错了，请重新再尝试");
        return map;
    }
    map.put("list",list);

    return map;

    }


    //TODO 5.19设置定时提醒任务
    @RequestMapping("sendsubScribMessageToUser")
    public void sendMessageToUser(String touser,int activityid) throws ParseException {
    String starttime = activityService.getStartTime(activityid);

        Activity activity = activityService.getActivityByID(activityid);
        String time16=activity.getEndtime();

              String s[]=  activity.getPlace().split("-");
                String thing6=s[0];
        String thing4=activity.getContent();
        String template_id="Mq-b6Yz5H76RViYPsfqP5iAN40Yf3e-TseCXoD6MVgs";
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date parse1 = f.parse(starttime);
        long starttim1 = parse1.getTime();
        Date today=new Date();
        String currenttime=f.format(today);
        Date parse2 = f.parse(currenttime);
        long current=parse2.getTime();

                //时间在两小时之内不提醒，报名直接参加
                //目前测试，先设置成5s
        long timertime=starttim1-current-2*1000*60*60;
      //  if (timertime<0){}else {
            timer timer = new timer();
            timer.setTime(1000*5);
            timer.setTouser(touser);
            timer.setTemplate_id(template_id);
            timer.setDate3(starttime);
            timer.setTime16(time16);
            timer.setThing6(thing6);
            timer.setThing4(thing4);
            timeListpool.add(timer);
            timer.run();
       // }

    }

    @RequestMapping("getTimePoolList")
    public List getpool(){
    return timeListpool;

    }


    class timer extends TimerTask{
        private long time ;
        private String touser;
        private String template_id;
        private String date3;
        private  String time16;
        private String thing6;
        private String thing4;


        public long getTime() {
            return time;
        }

        public void setTime(long time) {
            this.time = time;
        }

        public String getTouser() {
            return touser;
        }

        public void setTouser(String touser) {
            this.touser = touser;
        }

        public String getTemplate_id() {
            return template_id;
        }

        public void setTemplate_id(String template_id) {
            this.template_id = template_id;
        }

        public String getDate3() {
            return date3;
        }

        public void setDate3(String date3) {
            this.date3 = date3;
        }

        public String getTime16() {
            return time16;
        }

        public void setTime16(String time16) {
            this.time16 = time16;
        }

        public String getThing6() {
            return thing6;
        }

        public void setThing6(String thing6) {
            this.thing6 = thing6;
        }

        public String getThing4() {
            return thing4;
        }

        public void setThing4(String thing4) {
            this.thing4 = thing4;
        }

        @Override
        public void run() {

            try {
                sleep(time);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            RestTemplate restTemplate=new RestTemplate();
            ResponseEntity<Object> result = restTemplate.getForEntity("http://localhost:8080/sendSubscriptMessage?touser="+touser+"&template_id="+template_id+"&date3="+date3+"&time16="+time16+"&thing6="+thing6+"&thing4="+thing4, Object.class);
            System.out.println(result.getBody());

        }
    }

    @RequestMapping("checkAllAsign")
    public Map<String,Object> checkAllAsign(int activityid){
    Map<String,Object> map=new HashMap<>();
   int number =  asignUserService.checkasignNumber(activityid);
        map.put("asginNumber",number);
        int allnumber=activityService.getActivityByID(activityid).getAllnum() ;
        map.put("allnum",allnumber);


        return map;


    }



    //TODO 5.28 查看我发起的活动
    @RequestMapping("getMypostActivity")
    public List getMyPostActivity(String openid){
    List list ;
    list =activityService.selectMyPostActivity(openid);


    return list;

    }


}

package com.lian.weixin.web.Controller;

import com.lian.weixin.utils.DateUtil;
import com.lian.weixin.web.model.Message;
import com.lian.weixin.web.model.User;
import com.lian.weixin.web.server.WebSocket;
import com.lian.weixin.web.service.MessageService;
import com.lian.weixin.web.service.UserService;

import io.minio.MinioClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.*;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/23/13:36
 * @Description:
 */
@RestController
public class ChatController {
    @Autowired
    private MessageService messageService;
    @Autowired
    private Message messageobject ;

    @Autowired
    WebSocket webSocket;

    private RestTemplate restTemplate;
    @Autowired
    private UserService userService;
    private static String url = "http://106.13.204.79:9000";  //minio服务的IP端口
    private static String accessKey = "admin";
    private static String secretKey = "2906176715";



@RequestMapping("sendmessage")
    public void SendMessage(String myname,String name,String message) throws Exception {
    //消息发送成功之后存入数据库
    webSocket.sendMessageToId(myname,name,message);
    messageobject.setMessage(message);
    messageobject.setMsgstatus(1);
    messageobject.setName1(myname);
    messageobject.setName2(name);
    String nowtime =DateUtil.getnowtime();

    messageobject.setTime(nowtime);
   try {
       messageService.insertmessage(messageobject);
   }catch (Exception e ){
       e.printStackTrace();
   }

   }


@RequestMapping("sendofflineMsg")
public void SendofflineMsg(String myname,String name,String message){

    messageobject.setMessage(message);
    //标记信息未读取
    messageobject.setMsgstatus(0);
    messageobject.setName1(myname);
    messageobject.setName2(name);
    TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
    String nowtime =DateUtil.getnowtime();
    messageobject.setTime(nowtime);
    try {
        messageService.insertmessage(messageobject);
    }catch (Exception e ){
        e.printStackTrace();
    }
}

//@RequestMapping("/getMessage")
//public Map<String,Object> getMessage(String myname,String name,int page,int pagesize){
//    List mysend ;
//    List yousend;
//    Map<String,Object> map=new HashMap<>();
//
//   mysend= messageService.selectMessage(myname,name);
//    yousend=messageService.selectMessage(name,myname);
//
//    map.put("Isendmsg",mysend);
//    map.put("yousendmsg",yousend);
//    //修改消息的状态值为已读状态,还没有写，方便测试数据
//    return map;
//}

    @RequestMapping(value = "/getMessage",method = RequestMethod.GET)
    public List getMessage(String myname,String name,int page,int pagesize){
        List mysend ;

        Map<String,Object> map=new HashMap<>();

        mysend= messageService.selectMessage(myname,name,page*pagesize,pagesize);


        map.put("msg",mysend);




        for (int i = 0; i <mysend.size() ; i++) {
            HashMap<String,Object> hashmap= (HashMap<String, Object>) mysend.get(i);

           // System.out.println(map);
            try{  messageService.updatemessage((int)hashmap.get("id"));}catch (Exception e ){}
        }


        return mysend;
    }




//   @RequestMapping("test")
//   public void test(){
//       List list = messageService.selectMessage("lql", "lql", 4, 3);
//       for (int i = 0; i <list.size() ; i++) {
//           HashMap<String,Object> map= (HashMap<String, Object>) list.get(i);
//
//           System.out.println(map);
//         try{  messageService.updatemessage((int)map.get("id"));}catch (Exception e ){}
//       }
//   }

@RequestMapping("sendMessageToall")
    public void sendtoall(String message) throws IOException {
    webSocket.sendMessageToAll(message);
}



//TODO 5.11
    //获取未读消息个数
    @RequestMapping("getunreadmessage")
    public Map<String,Object> getmessage(String openid){
    Map<String,Object> map=new HashMap<>();
    List list;

   try{  list = messageService.selectunreadMessage(openid);}catch (Exception e){
       e.printStackTrace();
       map.put("error","出错了");
       return map;

   }
        map.put("unreadmsgnum",list.size());
    map.put("unreadmessage",list);

    //获取最新一条的时间和消息内容
    Map hashmap= (Map) list.get(0);
        String onetime = (String) hashmap.get("time");
        String onecontent= (String) hashmap.get("message");
        map.put("newMsgtime",onetime);
        map.put("newMsgcontent",onecontent);
      //  ResponseEntity<String> result = restTemplate.getForEntity("http://localhost:8080/updateMsg?list=" + list, String.class);

//        System.out.println(result);

        return map;
    }


        //点进消息之后将所有消息设置成已读
       @RequestMapping("updateMsg")
   public Map<String,Object> test(String myopenid,String youropenid ){
      // List list = messageService.selectMessage("lql", "lql", 4, 3);
          Map<String ,Object> map=new HashMap<>();

           try{ int  a= messageService.updateMessage2(myopenid,youropenid);
               int  b= messageService.updateMessage2(youropenid,myopenid);
           }catch (Exception e ){
           map.put("error","更新失败");
           e.printStackTrace();
    return map;

           }
           map.put("success","更新成功");


return map;


}

@RequestMapping("getnickname")
    public Map<String,Object> getnickname(String openid){
       Map<String,Object> map=new HashMap<>();

        String nickname = userService.getNickName(openid);
       map.put("nickname",nickname);
       return map;
}

@RequestMapping("/getAllChatWithMe")
        public Map<String,Object> getchatMap(String openid){
    Map<String,Object> map=new HashMap<>();
    List<Map<String,Object>> list = messageService.selectChatUser(openid);
    //map.put("allOpenid",list);
    List<Map<String,Object>> list2= messageService.selectChatUser2(openid);
    Map<String,Object> map2=new HashMap<>();
    //没有重复的可以加入集合中
    boolean flag =true;

    for (int i = 0; i <list.size() ; i++) {
        for (int j = 0; j <list2.size() ; j++) {
                if (list.get(i).get("name1").equals(list2.get(j).get("name2"))){
                   flag=false;
                   break;
                }
        }
        if (flag){
            list2.add(list.get(i));

        }else{
            flag=true;

        }
    }
    map.put("allOpenid",list2);

    return map;

}




    @RequestMapping("/uploadchatpic")
    public String upload(HttpServletRequest request) throws Exception {
        //这样账号改了之后图片也要修改名字
        MultipartHttpServletRequest params= (MultipartHttpServletRequest) request;
        List<MultipartFile> filelist=((MultipartHttpServletRequest) request).getFiles("file");

        MultipartFile file=filelist.get(0);
        try {
           Random r=new Random(10000);

            String s = DateUtil.getnowtime();
            String nowtime=s+r;


                String a = file.getContentType();
                if (a.equals("image/jpeg") || a.equals("image/bmp")|| a.equals("image/jpg")|| a.equals("image/png")) {
                    MinioClient minioClient = new MinioClient(url, accessKey, secretKey);//创建客户端对象
                    InputStream is = file.getInputStream(); //得到文件流
                    String fileName = file.getOriginalFilename(); //文件名
                    String contentType = file.getContentType();  //类型

                    minioClient.putObject("chatpic", nowtime+".jpg", is, contentType); //把文件放置Minio桶(文件夹)
                    return nowtime+".jpg";}else {
                    return "请上传bmp/jpg/png格式的图片";
                }

        } catch (Exception e) {
            return "上传失败";
        }
    }


    // 获取minio文件的下载地址
    @GetMapping("/getchatpic")
    public Map<String,Object>  getheadpicaUrl(String filename){
        Map<String,Object>map=new HashMap<>();


        try {

            MinioClient minioClient = new MinioClient(url, accessKey, secretKey);
            String url = minioClient.presignedGetObject("chatpic", filename);


          map.put("url",url);

            return map;

        }catch (Exception e){
            map.put("error","获取出错");
            return map;

        }
    }

}

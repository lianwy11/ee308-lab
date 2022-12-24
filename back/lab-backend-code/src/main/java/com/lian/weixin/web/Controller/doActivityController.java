package com.lian.weixin.web.Controller;

import com.lian.weixin.utils.DateUtil;
import com.lian.weixin.web.model.Activity;
import com.lian.weixin.web.service.ActivityService;
import com.lian.weixin.web.service.ActivityStartService;
import com.lian.weixin.web.service.AsignUserService;
import com.lian.weixin.web.service.UserService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.lian.weixin.web.Controller.ActivityController.rad;
import static java.lang.Thread.sleep;


/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/05/17/17:42
 * @Description:
 */

@RestController
public class doActivityController {
@Autowired
    UserService userService;
@Autowired
    ActivityService activityService;
@Autowired
    AsignUserService asignUserService;

@Autowired
ActivityStartService activityStartService;

    private final static double EARTH_RADIUS = 6378.137;//地球半径
            //TODO 5.18 完成签到功能，记录时间，并在签退的时候获取另一个表格中的数据

    @RequestMapping("activityStart")
    public Map<String,Object> activityStart(String openid,int activityid,double lat1, double lng1, double lat2, double lng2) throws ParseException {
        Map<String,Object> map=new HashMap<>();
        //判断用户是否在小队内，如果没在小队内无法进行签到
      try{ int id  = asignUserService.checkUser(openid,activityid);}catch (Exception e ){
          map.put("cannot find user","你还没加入小队，无法进行签到");
      }
        //判断距离是否在要求的范围之内，如果超过range的范围不允许签到
        //判断openid是否存在
        double range =  activityService.getqiandao(activityid);

        String name=userService.getNickName(openid);
        if (name==null){
            map.put("error","该用户不存在");
            return map;
        }else {
            double distance = GetDistance2(lat1, lng1, lat2, lng2);
            if (distance * 1000 > range) {

                //超出签到范围
                map.put("error", "超出签到范围，请在活动范围内进行签到");
                return map;

            } else {
                //判断互动是否开始了
                String activityStarttime = activityService.getStartTime(activityid);
                Date today=new Date();
                SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm");
              //  String currenttime = DateUtil.getnowtime();
                String currenttime = f.format(today);
                Date parse3 = f.parse(currenttime);
                long nowtime = parse3.getTime();
               // String acstart = f.format(activityStarttime);
                Date parsem = f.parse(activityStarttime);
                long acstarttime = parsem.getTime();

                String activityEndTime = activityService.getEndTime(activityid);
              //  String acend = f.format(activityEndTime);
                Date parse2 = f.parse(activityEndTime);
                long acendtime = parse2.getTime();

              //  String currenttime = DateUtil.getnowtime();



                if (nowtime >= acstarttime && nowtime < acendtime) {


                    //正常的逻辑判断，进行用户签到的登记操作

                    try {
                        int a = activityStartService.qiandao(openid, activityid, currenttime);
                    } catch (Exception e) {
                        map.put("error", "登记用户签到信息错误,你是不是已经进行过签到");
                        return map;
                    }
                    map.put("success", "签到成功");
                }else if (nowtime<acstarttime){
                    map.put("error","活动还没开始，无法进行签到");
                    return map;

                }else{
                    map.put("error","活动已经结束,无法进行签到");
                    return map;

                }
            }
            }





        return map;

    }



@RequestMapping("teststart")
public void test() throws ParseException {
   int coin = userService.getCoin("test");
    System.out.println(coin);
}



       //TODO 5.17 活动截至，记录时长，签退

    /**
     *
     * @param openid 用户的openid

     * @param lat1 我的纬度
     * @param lng1  我的经度
     * @param lat2 活动地点的纬度
     * @param lng2  活动地点的经度
     * @return
     */
    @RequestMapping("/activityEnd")
    public Map<String,Object> endActivity(String openid,double lat1, double lng1, double lat2, double lng2,int activityid) throws ParseException {
        Map<String,Object> map=new HashMap<>();
        //判断是否签到完成，如果完成，拒绝让他对这个活动签到
        int isover = activityStartService.getisover(openid,activityid);
        if (isover==1){
            map.put("errormessage","你已经完成签到，请不要继续签退");
            return map;

        }
        String starttime = activityStartService.getStarttime(openid,activityid);
        if (starttime==null){
            map.put("error","你还没进行签到，不能进行签退");
            return map;
        }
        double range =  activityService.getqiandao(activityid);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        //判断当前时间是不是在活动结束之前
       String activityEndTime= activityService.getEndTime(activityid);
        Date today=new Date();
        SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String nowtime=f.format(today);
        Date parsem = df.parse(nowtime);
        long nowtimem=parsem.getTime();
         // String acendtime=  f.format(activityEndTime) ;
        Date acpars = df.parse(activityEndTime);
        long acendtime2 = acpars.getTime();
        if (acendtime2<nowtimem){
            //说明过了活动时间，不能进行签到累加时长
            map.put("error","活动时间已经超过，不能进行签到");
            return map;
            
        }
        //判断是否活动已经开始能进行签到了
        String activitystartTime= activityService.getStartTime(activityid);
        Date acstart = df.parse(activitystartTime);
        long acstart2 = acstart.getTime();
            if (nowtimem<acstart2){
                map.put("error","活动还没开始，不能进行签退");
                return map;


            }
        //判断openid是否存在
        String name=userService.getNickName(openid);
        if (name==null){
            map.put("error","该用户不存在");
            return map;
        }else {
            double distance = GetDistance2(lat1, lng1, lat2, lng2);
            if (distance * 1000 > range) {

                //超出签到范围
                map.put("error", "超出签到范围，请在活动范围内进行签到");
                return map;

            } else {
               // String nowtime = DateUtil.getnowtime();
                Date parse1 = df.parse(nowtime);
                long nowtime1 = parse1.getTime();
                Date parse2 = df.parse(starttime);
                long nowtime2 = parse2.getTime();
                String s = formatTime(nowtime1 - nowtime2);
                map.put("success", "签到成功");

                map.put("时长", s);
                //换算本次时长时间，更新用户时长

                String[] s1 = s.split(" ");
                double result = 0;
            if (s1.length==1){
                if (s1[0].length() == 3) {
                    Double minNum = Double.parseDouble(s1[0].substring(0, 2));
                    result += minNum / 60;

                } else {
                    Double minNum = Double.parseDouble(s1[0].substring(0, 1));
                    result += minNum / 60;
                }
            }
            else if(s1.length==2){
                if (s1[0].length() == 4) {
                    result = Double.parseDouble(s1[0].substring(0, 2));

                } else if (s1[0].length() == 3){
                    result = Double.parseDouble(s1[0].substring(0,1));
                }
                if (s1[1].length() == 3) {
                    Double minNum = Double.parseDouble(s1[1].substring(0, 2));
                    result += minNum / 60;

                } else {
                    Double minNum = Double.parseDouble(s1[1].substring(0, 1));
                    result += minNum / 60;
                }

            }
            else{
                map.put("error","时长超过一天");
                return map;
            }
            //将签到状态设置为已经签到
                activityStartService.setisover();

//                if (s1[0].length() == 4) {
//                    result = Double.parseDouble(s1[0].substring(0, 2));
//
//                } else if (s1[0].length() == 3){
//                    result = Double.parseDouble(s1[0].substring(0,1));
//                }
//                if (s1[1].length() == 3) {
//                    Double minNum = Double.parseDouble(s1[1].substring(0, 2));
//                    result += minNum / 60;
//
//                } else {
//                    Double minNum = Double.parseDouble(s1[1].substring(0, 1));
//                    result += minNum / 60;
//                }

                //更新用户的时长
                Double a = userService.getTimeLong(openid);
                result += a;
                userService.updateTimeLong(openid, result);
                //获取用户等级得到获取率
                int level = userService.getLevel(openid);
                //更新志愿币的数量
                double rate = 0;

                if (level == 1) {
                    rate = 1;

                } else if (level == 2) {
                    rate = 1.05;


                } else if (level == 3) {
                    rate = 1.1;
                } else if (level == 4) {
                    rate = 1.15;
                } else {
                    rate = 1.25;

                }
                double countCoin = 0;
                countCoin = rate * 100 * result;
                //更新用户的币数量
                int coin1 = userService.getCoin(openid);
                coin1 = (int) countCoin;
                int updateCoin = userService.updateCoin(openid, coin1);

                //更新用户等级
                Double time2 = userService.getTimeLong(openid);
                if (time2 >= 30 && time2 < 50 && level <= 1) {
                    userService.setLevel(2, openid);
                } else if (time2 > 50 && time2 < 120 && level <= 2) {
                    userService.setLevel(3, openid);
                } else if (time2 > 120 && time2 < 300 && level <= 3) {
                    userService.setLevel(4, openid);

                } else if (time2 > 300 && level <= 4) {
                    userService.setLevel(5, openid);
                } else {

                }


                return map;


            }
        }

    }

    @RequestMapping("buyThing")
    public Map<String,Object> buySomething(String openid,int coin){
        Map<String,Object> map=new HashMap<>();
        int coinNum = userService.getCoin(openid);
        if (coinNum<coin){
            map.put("cannotafford","你没有足够多的志愿币");
            return map;
        }else{
            int result = coinNum-coin;
            userService.updateCoin(openid,result);
        }
        map.put("success","请联系邮箱进行地址填写");

return map;

    }





    public static String formatTime(Long ms) {
        Integer ss = 1000;
        Integer mi = ss * 60;
        Integer hh = mi * 60;
        Integer dd = hh * 24;

        Long day = ms / dd;
        Long hour = (ms - day * dd) / hh;
        Long minute = (ms - day * dd - hour * hh) / mi;
        Long second = (ms - day * dd - hour * hh - minute * mi) / ss;
        Long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;

        StringBuffer sb = new StringBuffer();
        if(day > 0) {
            sb.append(day+"天 ");
        }
        if(hour > 0) {
            sb.append(hour+"小时 ");
        }
        if(minute > 0) {
            sb.append(minute+"分 ");
        }
        if(second > 0) {
            sb.append(second+"秒 ");
        }
        if(milliSecond > 0) {
            sb.append(milliSecond+"毫秒 ");
        }
        return sb.toString();
    }

    public static double GetDistance2(double lat1, double lng1, double lat2, double lng2) {
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

}

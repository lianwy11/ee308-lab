package com.lian.weixin.web.service;

import com.lian.weixin.web.model.Activity;

import java.util.List;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/19:28
 * @Description:
 */

public interface ActivityService
{


    Activity getActivityByID(int id);

    void postActivity(Activity activity);

    List getActivityLimits(int page, int pagesize);

    Activity getteamnumandallnum(int activityid);

    int  searchid(int activityid);

    int getid(String head, String place,String starttime);

    List<Activity> getorderActivityLimits(String range);

    List<Activity> getorderActivityclassify(String range, String classify);

    String getEndTime(int activityid);

    String getStartTime(int activityid);

    double getqiandao(int activityid);

    List getActivityByHead(String head);

    List<Map<String,Object>> selectMyPostActivity(String openid);
}

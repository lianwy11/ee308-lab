package com.lian.weixin.web.service;

import com.lian.weixin.web.mapper.ActivityMapper;
import com.lian.weixin.web.model.Activity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/19:34
 * @Description:
 */
@Service
public class ActivityServiceImpl implements ActivityService {

    @Resource
    private ActivityMapper activityMapper;

    @Override
    public Activity getActivityByID(int id) {
        return activityMapper.selectByPrimaryKey(id);
    }

    @Override
    public void postActivity(Activity activity) {
        activityMapper.insert(activity);

    }

    @Override
    public List getActivityLimits(int page, int pagesize) {
        return activityMapper.selectLimits(page,pagesize);
    }

    @Override
    public Activity getteamnumandallnum(int activityid) {
        return activityMapper.getteamNumandallnum(activityid);
    }

    @Override
    public int searchid(int activityid) {
        return activityMapper.search(activityid);
    }

    @Override
    public int getid(String head, String place,String starttime) {
        return activityMapper.getid(head,place,starttime);
    }

    @Override
    public List<Activity> getorderActivityLimits(String s) {
        return activityMapper.getorderActivityLimits(s);
    }

    @Override
    public List<Activity> getorderActivityclassify(String range, String classify) {
        return activityMapper.getorderActivityclassify(range,classify);
    }

    @Override
    public String getEndTime(int activityid) {
        return activityMapper.getEndTime(activityid);
    }

    @Override
    public String getStartTime(int activityid) {
        return activityMapper.getStartTime(activityid);
    }

    @Override
    public double getqiandao(int activityid) {
        return activityMapper.getqiandao(activityid);
    }

    @Override
    public List getActivityByHead(String head) {
        return activityMapper.getByHead(head);
    }

    @Override
    public List<Map<String, Object>> selectMyPostActivity(String openid) {
        return activityMapper.selectMyPostActivity(openid);
    }
}

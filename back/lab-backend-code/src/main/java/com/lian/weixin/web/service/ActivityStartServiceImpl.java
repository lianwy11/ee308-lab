package com.lian.weixin.web.service;

import com.lian.weixin.web.mapper.ActivityStartMapper;
import com.lian.weixin.web.model.ActivityStart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/05/18/19:10
 * @Description:
 */
@Service
public class ActivityStartServiceImpl implements ActivityStartService {
    @Resource
    ActivityStartMapper activityStartMapper;

    @Override
    public int qiandao(String openid, int activityid, String currenttime) {
        ActivityStart activityStart=new ActivityStart();
        activityStart.setOpenid(openid);
        activityStart.setActivityid(activityid);
        activityStart.setCurrenttime(currenttime);
        activityStart.setIsover(0);

        return activityStartMapper.insert(activityStart);
    }

    @Override
    public String getStarttime(String openid, int activityid) {
        return activityStartMapper.getStartTime(openid,activityid);
    }

    @Override
    public void setisover() {
        activityStartMapper.setisOver();
    }

    @Override
    public int getisover(String openid, int activityid) {
        return activityStartMapper.getIsOver(openid,activityid);
    }


}

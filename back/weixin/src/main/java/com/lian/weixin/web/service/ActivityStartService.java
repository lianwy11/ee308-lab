package com.lian.weixin.web.service;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/05/18/19:07
 * @Description:
 */
public interface ActivityStartService

{
    int qiandao(String openid, int activityid, String currenttime);

    String getStarttime(String openid, int activityid);

    void setisover();


    int getisover(String openid, int activityid);
}

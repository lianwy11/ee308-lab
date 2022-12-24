package com.lian.weixin.web.service;

import com.lian.weixin.web.model.User;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/11:19
 * @Description:
 */
public interface UserService
{
    User getUserInfo(String openid);

    int updateInfo(User user);

    int addUser(User user);

    String searchnickname(String openid);

    String getNickName(String openid);

    String searchurl(String openid);

    Double getTimeLong(String openid);

    int updateTimeLong(String openid,double result);

    int getLevel(String openid);

    int getCoin(String openid);

    int updateCoin(String openid, int coin1);

    void setLevel(int i,String openid);
}

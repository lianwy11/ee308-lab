package com.lian.weixin.web.service;

import com.lian.weixin.web.mapper.UserMapper;
import com.lian.weixin.web.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/11:20
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
   private UserMapper userMapper;


    @Override
    public User getUserInfo(String openid) {
        return userMapper.selectByOpenID(openid);
    }

    @Override
    public int updateInfo(User user) {
        return userMapper.updateByopenid(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public String searchnickname(String openid) {
        return userMapper.selectnicknameByOpenid(openid);
    }

    @Override
    public String getNickName(String openid) {
        return userMapper.getnickname(openid);
    }

    @Override
    public String searchurl(String openid) {
        return userMapper.geturl(openid);
    }

    @Override
    public Double getTimeLong(String openid) {
        return userMapper.getTimeLong(openid);
    }

    @Override
    public int updateTimeLong(String openid,double result) {
        return userMapper.updateTimeLong(openid,result);
    }

    @Override
    public int getLevel(String openid) {
        return userMapper.getlevel(openid);
    }

    @Override
    public int getCoin(String openid) {
        return userMapper.getCoin(openid);
    }

    @Override
    public int updateCoin(String openid, int coin1) {
        return userMapper.updateCoin(openid,coin1);
    }

    @Override
    public void setLevel(int i,String openid) {
        userMapper.setLevel(i,openid);
    }
}

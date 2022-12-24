package com.lian.weixin.web.mapper;

import com.lian.weixin.web.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByOpenID(String openid);

    int updateByopenid(User user);

    int addUser(User user);

    String selectnicknameByOpenid(String openid);

    String getnickname(String openid);

    String geturl(String openid);

    Double getTimeLong(String openid);

    int updateTimeLong(String openid, double result);

    int getlevel(String openid);

    int getCoin(String openid);

    int updateCoin(String openid, int coin1);

    void setLevel(int i,String openid);
}
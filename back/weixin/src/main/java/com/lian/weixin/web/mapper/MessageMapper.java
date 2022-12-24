package com.lian.weixin.web.mapper;

import com.lian.weixin.web.model.Message;
import org.apache.ibatis.annotations.Mapper;

import java.util.*;

@Mapper
public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(int id );

    List<Map<String,Object>> getMessage(String myname, String name,int page,int pagesize);

    List<Map<String, Object>> selectrunreadMessage(String openid);

    List<Map<String, Object>> selectChatUser(String openid);

    List<Map<String, Object>> selectChatUser2(String openid);

    int updateMessage2(String myopenid, String youropenid);
}
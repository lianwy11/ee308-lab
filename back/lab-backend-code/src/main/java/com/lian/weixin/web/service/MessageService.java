package com.lian.weixin.web.service;

import com.lian.weixin.web.model.Message;
import java.util.*;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/23/15:32
 * @Description:
 */
public interface MessageService
{
    int insertmessage(Message messageobject);

    List selectMessage(String myname, String name,int page,int pagesize);


    void updatemessage(int id);

    List<Map<String,Object>> selectunreadMessage(String openid);

    List<Map<String, Object>> selectChatUser(String openid);

    List<Map<String, Object>> selectChatUser2(String openid);

    int updateMessage2(String myopenid, String youropenid);
}

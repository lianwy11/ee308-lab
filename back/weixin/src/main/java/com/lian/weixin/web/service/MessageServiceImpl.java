package com.lian.weixin.web.service;

import com.lian.weixin.web.mapper.MessageMapper;
import com.lian.weixin.web.model.Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/23/15:32
 * @Description:
 */
@Service
@Slf4j
public class MessageServiceImpl implements MessageService {
    @Resource
    private MessageMapper messageMapper;


    @Override
    public int insertmessage(Message messageobject) {
        return messageMapper.insert(messageobject);
    }

    @Override
    public List selectMessage(String myname, String name,int page,int pagesize) {
        return messageMapper.getMessage(myname,name,page,pagesize);
    }

    @Override
    public void updatemessage(int id ) {
        messageMapper.updateByPrimaryKey(id);

    }

    @Override
    public List<Map<String, Object>> selectunreadMessage(String openid) {
        return messageMapper.selectrunreadMessage(openid);
    }

    @Override
    public List<Map<String, Object>> selectChatUser(String openid) {
        return messageMapper.selectChatUser(openid);
    }

    @Override
    public List<Map<String, Object>> selectChatUser2(String openid) {
        return messageMapper.selectChatUser2(openid);
    }

    @Override
    public int updateMessage2(String myopenid, String youropenid) {
        return messageMapper.updateMessage2(myopenid,youropenid);
    }
}

package com.lian.weixin.web.server;



import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.*;

import com.lian.weixin.utils.DateUtil;
import com.lian.weixin.web.model.Message;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sun.security.util.ManifestEntryVerifier;


@ServerEndpoint("/WebSocket/{id}")
@RestController
public class WebSocket {

    // 存储会话
    private static ConcurrentHashMap<String, WebSocket> webSocket = new ConcurrentHashMap<String, WebSocket>();
    private String name;
    private Session session;


    @RequestMapping("/getConnectUser")
    public List getUser(){
        List UserList=new ArrayList();
        
        ConcurrentHashMap.KeySetView<String, WebSocket> strings = webSocket.keySet();
        Iterator<String> iterator = strings.iterator();
        while(iterator.hasNext()){
            String next = iterator.next();

            UserList.add(next);
            System.out.println(next);
        }
        return UserList;

    }


    /**
     * 接入连接回调
     *
     * @param session 会话对象
     * @param name      会话ID
     * @throws Exception 异常
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("id") String name) throws Exception {
        this.name = name;
        this.session = session;
        webSocket.put(name, this);
        // 检验后端能否正常给前端发送信息
    //    sendMessageToAll("发送给所有人的消息");

        sendMessageToId("系统测试",this.name, "onopen调用，连接成功");
        System.out.println(name + "接入连接");
    }

    /**
     * 关闭连接回调
     */
    @OnClose
    public void onClose() {
        webSocket.remove(this.name);
        System.out.println(this.name + "关闭连接");
    }

    /**
     * 收到客户端发来消息回调
     *
     * @param message
     */
    @OnMessage
    public void onMessage(String message) {
        System.out.println(this.name + "发来消息：" + message);
      //return  this.name + "发来消息：" + message;

    }

    /**
     * 会话出现错误回调
     *
     * @param error   错误信息
     */
    @OnError
    public void onError(Throwable error) {
        System.out.println(error);

    }

    /**
     * 发送消息给客户端
     *
     * @param message 消息
     * @throws IOException 异常
     */
    public void sendMessage(String name,String message) {
        Message message1=new Message();
       message1.setName2(name);
       message1.setMessage(message);
        String nowtime =DateUtil.getnowtime();
        message1.setTime(nowtime);
        message1.setMsgstatus(1);

       try {
           this.session.getBasicRemote().sendText(message1.toString());
       }catch (Exception e ){
           System.out.println("名字不存在，请重新尝试");

       }
       }

    /**
     * 给指定的会话发送消息
     *
     * @param name      会话ID
     * @param message 消息
     * @throws Exception 异常
     */
    public void sendMessageToId(String myname,String name, String message) throws Exception{

        webSocket.get(name).sendMessage(myname,message);


    }


    public void sendMessageToAll(String message)  {
        for (String key : webSocket.keySet()) {
            try {
                webSocket.get(key).sendMessage("系统推送消息",message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}


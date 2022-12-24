package com.lian.weixin.web.model;

import org.springframework.stereotype.Component;

@Component
public class Message {
    private Integer id;

    private String name1;

    private String name2;

    private String message;

    private Integer msgstatus;

    private String time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public String getName2() {
        return name2;
    }

    public void setName2(String name2) {
        this.name2 = name2;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getMsgstatus() {
        return msgstatus;
    }

    public void setMsgstatus(Integer msgstatus) {
        this.msgstatus = msgstatus;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", name1='" + name1 + '\'' +
                ", name2='" + name2 + '\'' +
                ", message='" + message + '\'' +
                ", msgstatus=" + msgstatus +
                ", time='" + time + '\'' +
                '}';
    }
}
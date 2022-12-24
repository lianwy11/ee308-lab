package com.lian.weixin.web.model;

import org.springframework.stereotype.Component;

@Component
public class AsignUser {
    private Integer id;

    private Integer activityid;

    private String realname;

    private String openid;

    private Integer teamnumber;

    private Integer isleader;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getActivityid() {
        return activityid;
    }

    public void setActivityid(Integer activityid) {
        this.activityid = activityid;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public Integer getTeamnumber() {
        return teamnumber;
    }

    public void setTeamnumber(Integer teamnumber) {
        this.teamnumber = teamnumber;
    }

    public Integer getIsleader() {
        return isleader;
    }

    public void setIsleader(Integer isleader) {
        this.isleader = isleader;
    }
}
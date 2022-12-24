package com.lian.weixin.web.model;


import org.springframework.stereotype.Component;

@Component
public class Activity {
    private Integer id;
private int allnum;

    private String imgurl;

    private String category;

    private String head;

    private String place;

    private String starttime;

    private String endtime;

    private String registstart;

    private String registend;

    private String sponsor;

    private String content;

    private String assignuser;

    private String mode;

    private int numofmate;

    private String leader;

    private String mechanism;

    private double qiandao;
    private String classify1;
    private String classify2;
    private  int teamswitch;
    private int checkswitch;


    public double getQiandao() {
        return qiandao;
    }

    public void setQiandao(double qiandao) {
        this.qiandao = qiandao;
    }

    public String getClassify1() {
        return classify1;
    }

    public void setClassify1(String classify1) {
        this.classify1 = classify1;
    }

    public String getClassify2() {
        return classify2;
    }

    public void setClassify2(String classify2) {
        this.classify2 = classify2;
    }

    public int getTeamswitch() {
        return teamswitch;
    }

    public void setTeamswitch(int teamswitch) {
        this.teamswitch = teamswitch;
    }

    public int getCheckswitch() {
        return checkswitch;
    }

    public void setCheckswitch(int checkswitch) {
        this.checkswitch = checkswitch;
    }

    public int getAllnum() {
        return allnum;
    }

    public int getNumofmate() {
        return numofmate;
    }

    public void setNumofmate(int numofmate) {
        this.numofmate = numofmate;
    }

    public void setAllnum(int allnum) {
        this.allnum = allnum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getRegiststart() {
        return registstart;
    }

    public void setRegiststart(String registstart) {
        this.registstart = registstart;
    }

    public String getRegistend() {
        return registend;
    }

    public void setRegistend(String registend) {
        this.registend = registend;
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAssignuser() {
        return assignuser;
    }

    public void setAssignuser(String assignuser) {
        this.assignuser = assignuser;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }





    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getMechanism() {
        return mechanism;
    }

    public void setMechanism(String mechanism) {
        this.mechanism = mechanism;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", allnum=" + allnum +
                ", imgurl='" + imgurl + '\'' +
                ", category='" + category + '\'' +
                ", head='" + head + '\'' +
                ", place='" + place + '\'' +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", registstart='" + registstart + '\'' +
                ", registend='" + registend + '\'' +
                ", sponsor='" + sponsor + '\'' +
                ", content='" + content + '\'' +
                ", assignuser='" + assignuser + '\'' +
                ", mode='" + mode + '\'' +
                ", numofmate=" + numofmate +
                ", leader='" + leader + '\'' +
                ", mechanism='" + mechanism + '\'' +
                ", qiandao=" + qiandao +
                ", classify1='" + classify1 + '\'' +
                ", classify2='" + classify2 + '\'' +
                ", teamswitch=" + teamswitch +
                ", checkswitch=" + checkswitch +
                '}';
    }
}
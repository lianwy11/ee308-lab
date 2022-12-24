package com.lian.weixin.web.model;

import org.springframework.stereotype.Component;

@Component
public class User {
    private Integer id;

    private String headpic;

    private String nickname;

    private String openid;

    private String realname;

    private Integer sex;

    private String birth;

    private Integer age;

    private String poutlook;

    private String phonenum;

    private String mail;

    private String work;

    private String highgrade;

    private String workplace;

    private Integer level;

    private Integer coin;

    private String address;
    private double timelong;

    public double getTimelong() {
        return timelong;
    }

    public void setTimelong(double timelong) {
        this.timelong = timelong;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHeadpic() {
        return headpic;
    }

    public void setHeadpic(String headpic) {
        this.headpic = headpic;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPoutlook() {
        return poutlook;
    }

    public void setPoutlook(String poutlook) {
        this.poutlook = poutlook;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getHighgrade() {
        return highgrade;
    }

    public void setHighgrade(String highgrade) {
        this.highgrade = highgrade;
    }

    public String getWorkplace() {
        return workplace;
    }

    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getCoin() {
        return coin;
    }

    public void setCoin(Integer coin) {
        this.coin = coin;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", headpic='" + headpic + '\'' +
                ", nickname='" + nickname + '\'' +
                ", openid='" + openid + '\'' +
                ", realname='" + realname + '\'' +
                ", sex=" + sex +
                ", birth='" + birth + '\'' +
                ", age=" + age +
                ", poutlook='" + poutlook + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", mail='" + mail + '\'' +
                ", work='" + work + '\'' +
                ", highgrade='" + highgrade + '\'' +
                ", workplace='" + workplace + '\'' +
                ", level=" + level +
                ", coin=" + coin +
                ", address='" + address + '\'' +
                ", timelong=" + timelong +
                '}';
    }
}
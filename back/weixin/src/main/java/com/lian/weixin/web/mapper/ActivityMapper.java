package com.lian.weixin.web.mapper;

import com.lian.weixin.web.model.Activity;

import org.apache.ibatis.annotations.Mapper;

import java.util.*;

@Mapper
public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);

    List<Map<String,Object>> selectLimits(int page, int pagesize);
    Activity getteamNumandallnum(int id);

    int search(int activityid);

    int getid(String head, String place,String starttime);

    List<Activity> getorderActivityLimits(String range);

    List<Activity> getorderActivityclassify(String range, String classify);

    String getEndTime(int activityid);

    String getStartTime(int activityid);

    double getqiandao(int activityid);

    List<Map<String,Object>> getByHead(String head);

    List<Map<String, Object>> selectMyPostActivity(String openid);
}
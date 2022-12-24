package com.lian.weixin.web.mapper;
import com.lian.weixin.web.model.Activity;
import org.apache.ibatis.annotations.Mapper;

import  java.util.*;


import com.lian.weixin.web.model.AsignUser;
@Mapper
public interface AsignUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AsignUser record);

    int insertSelective(AsignUser record);

    AsignUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AsignUser record);

    int updateByPrimaryKey(AsignUser record);
    List<Integer> selectactivityid(String openid);
    int getTeammateNum(int activityid,int teamNumber);


    Activity getUserInTeam(String openid,int activityid);

    int deleteByActivityid(int activityid);

    List<Map<String, Object>> selectMemberHeadpic(int activityid, int teamNumber);

    List<Integer> getTeamid(int activityid);

    List<String> getTeamMemberOpenid(int activityid, int teamNumber);

    int checkUser(String openid, int activityid);

    List<Map<String, Object>> getMyActivity(String openid);

    int getNumber(int activityid);
}
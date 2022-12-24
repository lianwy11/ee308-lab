package com.lian.weixin.web.service;

import com.lian.weixin.web.model.Activity;
import com.lian.weixin.web.model.AsignUser;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/19:11
 * @Description:
 */
public interface AsignUserService
{
    List selectactivityByid(String openid);

    int selectTeamMemberNum(int activityid, int teamNumber);

    int insertmember(String openid, int activityid, int teamNumber, int isleader);

    Activity selectUserInTeam(String openid,int activityid);

    int deleteByactivityid(int activityid);

    List<Map<String, Object>> selectMemberHeadPic(int activityid, int teamNumber);

    List<Integer> getteamid(int activityid);

    AsignUser getmsgByid(int id);

    List<String> getTeamMember(int activityid, int teamNumber);

    int checkUser(String openid, int activityid);

    List<Map<String, Object>> getMyActivity(String openid);

    int checkasignNumber(int activityid);
}

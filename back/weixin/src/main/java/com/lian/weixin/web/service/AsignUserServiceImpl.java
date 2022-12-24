package com.lian.weixin.web.service;

import com.lian.weixin.web.mapper.AsignUserMapper;
import com.lian.weixin.web.model.Activity;
import com.lian.weixin.web.model.AsignUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/19:11
 * @Description:
 */
@Service
public class AsignUserServiceImpl implements AsignUserService {
    @Resource
    private AsignUserMapper asignUserMapper;


    @Override
    public List selectactivityByid(String openid) {
        return asignUserMapper.selectactivityid(openid);
    }

    @Override
    public int selectTeamMemberNum(int activityid, int teamNumber) {
        return asignUserMapper.getTeammateNum(activityid,teamNumber);
    }

    @Override
    public int insertmember(String openid, int activityid, int teamNumber, int isleader) {
        AsignUser asignUser=new AsignUser();
        asignUser.setOpenid(openid);
        asignUser.setActivityid(activityid);
        asignUser.setTeamnumber(teamNumber);
        asignUser.setIsleader(isleader);
        return asignUserMapper.insert(asignUser);
    }

    @Override
    public Activity selectUserInTeam(String openid,int activityid) {
        return asignUserMapper.getUserInTeam(openid,activityid);
    }

    @Override
    public int deleteByactivityid(int activityid) {
        return asignUserMapper.deleteByActivityid(activityid);
    }

    @Override
    public List<Map<String, Object>> selectMemberHeadPic(int activityid, int teamNumber) {
        return asignUserMapper.selectMemberHeadpic(activityid,teamNumber);
    }

    @Override
    public List<Integer> getteamid(int activityid) {
        return asignUserMapper.getTeamid(activityid);
    }

    @Override
    public AsignUser getmsgByid(int id) {
        return asignUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<String> getTeamMember(int activityid, int teamNumber) {
        return asignUserMapper.getTeamMemberOpenid(activityid,teamNumber);
    }

    @Override
    public int checkUser(String openid, int activityid) {
        return asignUserMapper.checkUser(openid,activityid);
    }

    @Override
    public List<Map<String, Object>> getMyActivity(String openid) {
        return asignUserMapper.getMyActivity(openid);
    }

    @Override
    public int checkasignNumber(int activityid) {
        return asignUserMapper.getNumber(activityid);
    }
}

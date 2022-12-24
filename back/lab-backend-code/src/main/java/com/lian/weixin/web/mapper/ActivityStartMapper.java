package com.lian.weixin.web.mapper;

import com.lian.weixin.web.model.ActivityStart;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ActivityStartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActivityStart record);

    int insertSelective(ActivityStart record);

    ActivityStart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ActivityStart record);

    int updateByPrimaryKey(ActivityStart record);

    String getStartTime(String openid, int activityid);

    void setisOver();

    int getIsOver(String openid, int activityid);
}
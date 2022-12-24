package com.lian.weixin.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Calendar;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/02/25/21:03
 * @Description:
 */
public class JWTUtil {
    //tocken格式：header.payload.sing
    private static final String SING="wenyong";


    public static  String getTOCKEN(Map<String,String> map){
        Calendar instance =Calendar.getInstance();
        instance.add(Calendar.DATE,7);
        //创建jwt builder
        JWTCreator.Builder builder= JWT.create();
        map.forEach((k,v)->{
            builder.withClaim(k,v);


        });


        String tocken=builder.withExpiresAt(instance.getTime()).sign(Algorithm.HMAC256(SING));//指定令牌过期时间
        return tocken;

    }
    //验证tocken合法性
    public static void verify(String token){
            DecodedJWT a =JWT.require(Algorithm.HMAC256(SING)).build().verify(token);
    }

    //获取tocken信息方法
    public static DecodedJWT getTokenInfo(String token){
        DecodedJWT decodedJWT=JWT.require(Algorithm.HMAC256(SING)).build().verify(token);
        return decodedJWT;
    }

}


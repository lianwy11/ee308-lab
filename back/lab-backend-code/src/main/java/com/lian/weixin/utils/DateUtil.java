package com.lian.weixin.utils;

import com.rabbitmq.tools.json.JSONUtil;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/03/09/14:34
 * @Description:
 */
public class DateUtil {



    public static String getnowtime(){
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        String nowtime = dateFormat.format(date);
        return nowtime;

    }
}

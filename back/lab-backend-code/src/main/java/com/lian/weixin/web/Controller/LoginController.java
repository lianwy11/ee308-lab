package com.lian.weixin.web.Controller;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import java.net.URI;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/19/15:26
 * @Description:
 */
@RestController
public class LoginController {

    private String session_key;
    private String openid;


@RequestMapping("login")
    public String testmessage(String code){

            Map hashmap=new HashMap();

    // 创建Httpclient对象
    CloseableHttpClient httpclient = HttpClients.createDefault();
    String resultString = "";
    CloseableHttpResponse response = null;
    String url="https://api.weixin.qq.com/sns/jscode2session?appid=wx5ce06c1fd7f1305d&secret=7ef3fa51d1bef3caf88d1b660b0af734&js_code="+code+"&grant_type=authorization_code";
    try {
        // 创建uri
        URIBuilder builder = new URIBuilder(url);
        URI uri = builder.build();

        // 创建http GET请求
        HttpGet httpGet = new HttpGet(uri);

        // 执行请求
        response = httpclient.execute(httpGet);
        // 判断返回状态是否为200
        if (response.getStatusLine().getStatusCode() == 200) {
            resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    // 解析json
    JSONObject jsonObject = (JSONObject) JSONObject.parse(resultString);
    session_key = jsonObject.get("session_key")+"";
    openid = jsonObject.get("openid")+"";

    System.out.println("session_key=="+session_key);
    System.out.println("openid=="+openid);

    return resultString;
}





}

package com.lian.weixin.web.Controller;

import com.alibaba.fastjson.JSONObject;
import com.google.api.client.json.JsonObjectParser;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URI;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/05/18/12:56
 * @Description:
 */
import java.util.*;

import static java.lang.Thread.sleep;

@RestController
public class sendMessageController {
        //@RequestMapping("/sendSubscriptMessage")
//  //  String touser,String template_id,String page,Object data,
//    public Object sendMessage(  String touser,String template_id) throws UnsupportedEncodingException {
//                Map<String,Object>map=new HashMap<>();
//
//            CloseableHttpClient httpclient1 = HttpClients.createDefault();
//            String resultString1 = "";
//            CloseableHttpResponse response1 = null;
//            String url1="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx5ce06c1fd7f1305d&secret=7ef3fa51d1bef3caf88d1b660b0af734";
//
//
//
//            try {
//                // 创建uri
//                URIBuilder builder = new URIBuilder(url1);
//                URI uri = builder.build();
//
//                // 创建http GET请求
//                HttpGet httpGet = new HttpGet(uri);
//
//                // 执行请求
//                response1 = httpclient1.execute(httpGet);
//                // 判断返回状态是否为200
//                if (response1.getStatusLine().getStatusCode() == 200) {
//                    resultString1 = EntityUtils.toString(response1.getEntity(), "UTF-8");
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//
//            JSONObject jsonObject1 = (JSONObject) JSONObject.parse(resultString1);
//
//            String access_token= (String) jsonObject1.get("access_token");
//
//
//
//
//            CloseableHttpClient httpclient = HttpClients.createDefault();
//            String resultString = "";
//            CloseableHttpResponse response = null;
//            String url="https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" +access_token+"&touser="+touser+"&tempid="+template_id;
//            //String url="https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" +access_token;
//
//            List params = new ArrayList<>();
//
//           // Set paramsNames = paramsMap.keySet();
//
//           // for (Object paramsName : paramsNames) {
//
//             //   NameValuePair param = new BasicNameValuePair((String) paramsName, String.valueOf(paramsMap.get(paramsName)));
////               data data = new data();
////                data.setThing4("a");
////                data.setDate3("b");
////                data.setDate5("c");
////                data.setName1("hello");
////                data.setThing2("a");
//            //params.add(param);
//            Map<String ,Object> parammap=new HashMap<>();
//            parammap.put("touser",touser);
//            parammap.put("template_id",template_id);
//           // parammap.put("page",page);
//           // parammap.put("data",data);
//         //   RestTemplate restTemplate=new RestTemplate();
//        //   String s =  "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" +access_token+"&touser="+touser+"&tempid="+template_id+"&data="+data;
//           // restTemplate.postForEntity(s,);
//           // }
//
//            HttpEntity httpEntity = new UrlEncodedFormEntity(params, "UTF-8");
//            String body = null;
//
//            try {
//                // 创建uri
//                URIBuilder builder = new URIBuilder(url);
//                URI uri = builder.build();
//
//                // 创建http Post请求
//                HttpPost httpPost = new HttpPost();
//
//                httpPost.setURI(new URI(url));
//
//                httpPost.setEntity(httpEntity);
//
//             //    body= restTemplate.postForEntity(url, data, String.class).getBody();
//              //  System.out.println(body);
//             //   System.out.println(data);
//                // 执行请求
//                response = httpclient.execute(httpPost);
//                // 判断返回状态是否为200
//                if (response.getStatusLine().getStatusCode() == 200) {
//                    resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//            JSONObject jsonObject = (JSONObject) JSONObject.parse(resultString);
//
//            return body;
//
//}



    @RequestMapping("/getAccessToken")
    public String getAccessToken(){
        Map<String,Object> map=new HashMap<>();

        String secret = null;
        String appid="wx5ce06c1fd7f1305d&secret=7ef3fa51d1bef3caf88d1b660b0af734";
        String grant_type="client_credential";

        CloseableHttpClient httpclient = HttpClients.createDefault();
        String resultString = "";
        CloseableHttpResponse response = null;
        String url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx5ce06c1fd7f1305d&secret=7ef3fa51d1bef3caf88d1b660b0af734";


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

        JSONObject jsonObject = (JSONObject) JSONObject.parse(resultString);

       String access_token= (String) jsonObject.get("access_token");
        return access_token;

    }

    @RequestMapping("sendSubscriptMessage")
    public String testpost(String touser,String template_id,String date3,String time16,String thing6,String thing4){
        CloseableHttpClient httpclient1 = HttpClients.createDefault();
        String resultString1 = "";
        CloseableHttpResponse response1 = null;
        String url1="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx5ce06c1fd7f1305d&secret=7ef3fa51d1bef3caf88d1b660b0af734";
        try {
            // 创建uri
            URIBuilder builder = new URIBuilder(url1);
            URI uri = builder.build();

            // 创建http GET请求
            HttpGet httpGet = new HttpGet(uri);

            // 执行请求
            response1 = httpclient1.execute(httpGet);
            // 判断返回状态是否为200
            if (response1.getStatusLine().getStatusCode() == 200) {
                resultString1 = EntityUtils.toString(response1.getEntity(), "UTF-8");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        JSONObject jsonObject1 = (JSONObject) JSONObject.parse(resultString1);

        String access_token= (String) jsonObject1.get("access_token");
            String url ="https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token="+access_token ;

               ReturnVO result=new ReturnVO();

                data data1=new data();
                Map date3map1=new HashMap();
                date3map1.put("value",date3);
        Map time16map2=new HashMap();
        time16map2.put("value",time16);
        Map thing6map3=new HashMap();
        thing6map3.put("value",thing6);
        Map thing4map4=new HashMap();
        thing4map4.put("value",thing4);

                data1.setTime16(time16map2);
                data1.setThing6(thing6map3);
                data1.setThing4(thing4map4);
                data1.setDate3(date3map1);
                result.setData(data1);
                result.setTemplate_id(template_id);
                result.setTouser(touser);

            RestTemplate restTemplate = new RestTemplate();
       String body= restTemplate.postForEntity(url, result, String.class).getBody();


        return body;

    }




    @RequestMapping("testTime")
    public void testTime(){
        timer timer=new timer();
        timer.setTime(10000);
        timer.run();



    }
}

class timer extends TimerTask{
    private long time ;

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    @Override
    public void run() {

        try {
            sleep(time);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
     RestTemplate restTemplate=new RestTemplate();
        ResponseEntity<Object> result = restTemplate.getForEntity("http://localhost:8080/sendSubscriptMessage?touser=okb8W5F0X8tcY5uIhb_3Jhduw_gk&template_id=Mq-b6Yz5H76RViYPsfqP5iAN40Yf3e-TseCXoD6MVgs&date3=2022-05-17 08:00&time16=2022-05-17 08:00&thing6=测试&thing4=测试", Object.class);
        System.out.println(result.getBody());

    }
}





@Data
@NoArgsConstructor
@AllArgsConstructor
class data {

   private Map date3;
   private Map time16;
   private Map thing6;

    private Map thing4;

    public Map getDate3() {
        return date3;
    }

    public void setDate3(Map date3) {
        this.date3 = date3;
    }

    public Map getTime16() {
        return time16;
    }

    public void setTime16(Map time16) {
        this.time16 = time16;
    }

    public Map getThing6() {
        return thing6;
    }

    public void setThing6(Map thing6) {
        this.thing6 = thing6;
    }

    public Map getThing4() {
        return thing4;
    }

    public void setThing4(Map thing4) {
        this.thing4 = thing4;
    }
}

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
     class ReturnVO {
        private String touser;
        private String template_id;
        private data data;
}
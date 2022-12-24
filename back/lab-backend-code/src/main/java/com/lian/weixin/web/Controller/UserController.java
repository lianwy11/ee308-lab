package com.lian.weixin.web.Controller;

import com.lian.weixin.web.model.User;
import com.lian.weixin.web.service.UserService;
import com.sun.org.apache.xpath.internal.objects.XObject;
import io.minio.MinioClient;
import javafx.scene.chart.ValueAxis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.management.JMRuntimeException;
import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 *
 * @Author: SORA
 * @Date: 2022/04/27/11:17
 * @Description:
 */
@RestController
public class UserController {
    private static String url = "http://106.13.204.79:9000";  //minio服务的IP端口
    private static String accessKey = "admin";
    private static String secretKey = "2906176715";
@Autowired
private UserService userService;
@RequestMapping(value = "/getUserInfo",method = RequestMethod.GET )
    public User getUserInfo(String openid){
    User user =userService.getUserInfo(openid);
    return user;
}
//openid 和realname必须要，每次修改需要传递一整个user对象，每次少了属性会直接设置为空
@RequestMapping(value = "/updateUserInfo",method = RequestMethod.POST)
    public Map<String, Object> updateInfo(User user){

    Map<String,Object> map=new HashMap<>();
    try{int  a  = userService.updateInfo(user);}catch (Exception e ){e.printStackTrace();
    map.put("error","信息修改失败");
    return map;
    }
    map.put("success","信息修改成功");
    return map;
}

@RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public Map<String,Object> addUser(User user){
    Map<String,Object> map=new HashMap<>();
    user.setLevel(1);
    user.setCoin(0);
    user.setTimelong(0);
    try{int a =userService.addUser(user);
    }catch (Exception e ){
        e.printStackTrace();
        map.put("error","添加信息失败，已经存在相同的用户(openid)或请传入至少两个参数:1、opennid2、realname");
    }
    map.put("success","添加信息成功");
    return map;


}


    @RequestMapping("/uploaduserheadpic")
    public String upload(HttpServletRequest request) throws Exception {
        //这样账号改了之后图片也要修改名字
        MultipartHttpServletRequest params= (MultipartHttpServletRequest) request;
        List<MultipartFile> filelist=((MultipartHttpServletRequest) request).getFiles("file");
        String openid= params.getParameter("openid");
        MultipartFile file=filelist.get(0);
        try {
            String username=openid;
            User userInfo = userService.getUserInfo(openid);

            if (userInfo!=null){

                String a = file.getContentType();
                if (a.equals("image/jpeg") || a.equals("image/bmp")|| a.equals("image/jpg")|| a.equals("image/png")) {
                    MinioClient minioClient = new MinioClient(url, accessKey, secretKey);//创建客户端对象
                    InputStream is = file.getInputStream(); //得到文件流
                    String fileName = file.getOriginalFilename(); //文件名
                    String contentType = file.getContentType();  //类型

                    minioClient.putObject("userheadpic", username+".jpg", is, contentType); //把文件放置Minio桶(文件夹)
                    return "上传成功";}else {
                    return "请上传bmp/jpg/png格式的图片";
                }
            }else return "查不到该用户，上传失败";
        } catch (Exception e) {
            return "上传失败";
        }
    }


    // 获取minio文件的下载地址
    @GetMapping("/getHeadurlandOpenid")
    public Map<String,Object>  getheadpicaUrl(String openid){
        Map<String,Object>map=new HashMap<>();


    try {

            MinioClient minioClient = new MinioClient(url, accessKey, secretKey);
            String url = minioClient.presignedGetObject("userheadpic", openid+".jpg");
        String wechatname =   userService.searchnickname(openid);
        String imgurl=userService.searchurl(openid);

        map.put("url",url);
        map.put("nickname",wechatname);

        return map;

        }catch (Exception e){
            map.put("error","上传出错");
            return map;

        }
    }







}

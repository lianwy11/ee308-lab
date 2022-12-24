package com.lian.weixin.web.Controller;

import java.util.*;


import org.springframework.web.bind.annotation.RestController;

import io.minio.MinioClient;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;

@RestController
public class MinioController {
    private static String url = "http://106.13.204.79:9000";  //minio服务的IP端口
    private static String accessKey = "admin";
    private static String secretKey = "2906176715";


    @RequestMapping("/uploadheadpic")
    public String upload(MultipartFile file) throws Exception {
        try {

            String a = file.getContentType();
           // if (a.equals("jpg") || a.equals("JPG")) {
                MinioClient minioClient = new MinioClient(url, accessKey, secretKey);//创建客户端对象
                InputStream is = file.getInputStream(); //得到文件流
                String fileName = file.getOriginalFilename(); //文件名
                String contentType = file.getContentType();  //类型

                minioClient.putObject("pic", fileName, is, contentType); //把文件放置Minio桶(文件夹)


                return "上传成功";//}

        } catch (Exception e) {
            return "上传失败";
        }
    }

//    @RequestMapping("/uploaduserheadpic")
//    public String upload(HttpServletRequest request) throws Exception {
//        //这样账号改了之后图片也要修改名字
//        MultipartHttpServletRequest params= (MultipartHttpServletRequest) request;
//        List<MultipartFile> filelist=((MultipartHttpServletRequest) request).getFiles("file");
//        String account= params.getParameter("account");
//        MultipartFile file=filelist.get(0);
//
//
//
//
//        try {
//            String username=account;
//            String s =  "username";
//
//            if (s!=null){
//                //  String username = (String) session.getAttribute("username");
//                String a = file.getContentType();
//                if (a.equals("image/jpeg") || a.equals("image/bmp")|| a.equals("image/jpg")|| a.equals("image/png")) {
//                    MinioClient minioClient = new MinioClient(url, accessKey, secretKey);//创建客户端对象
//                    InputStream is = file.getInputStream(); //得到文件流
//                    String fileName = file.getOriginalFilename(); //文件名
//                    String contentType = file.getContentType();  //类型
//
//                    minioClient.putObject("userheadpic", username, is, contentType); //把文件放置Minio桶(文件夹)
//                    return "上传成功";}else {
//                    return "请上传bmp/jpg/png格式的图片";
//                }
//            }else return "查不到该用户，上传失败";
//
//
//        } catch (Exception e) {
//            return "上传失败";
//        }
//    }



//    //下载minio服务的文件
//    @GetMapping("/downloadpic")
//    public String download(HttpServletResponse response,String filename,HttpSession session,HttpServletRequest request) {
//
//        try {
//            MinioClient minioClient = new MinioClient(url, accessKey, secretKey);
//          //  String objectName="证件.jpg";
//
//            InputStream fileInputStream = minioClient.getObject("pic", filename);
//            response.setHeader("Content-Disposition", "attachment;filename=" + filename+".jpg");
//            response.setContentType("application/force-download");
//            response.setCharacterEncoding("UTF-8");
//            IOUtils.copy(fileInputStream, response.getOutputStream());
//
//            return "下载完成";
//        } catch (Exception e) {
//            return "没有这张照片";
//        }
//    }

//   // 获取minio文件的下载地址
//   @GetMapping("/getheadpicurl")
//   public String  getheadpicaUrl(String openid){
//       try {
//
//
//
//           MinioClient minioClient = new MinioClient(url, accessKey, secretKey);
//           String url = minioClient.presignedGetObject("userheadpic", openid);
//
//           return url;
//       }catch (Exception e){
//           return "返回结果出错";
//       }
//   }



}
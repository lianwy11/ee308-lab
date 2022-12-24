package com.lian.weixin.utils;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

public class RabbitMQUtils {
    //定义提供连接对象的方法
    public static Connection getConnection() {

        try {
            ConnectionFactory factory = new ConnectionFactory();
            factory.setHost("120.26.15.178");
            factory.setUsername("admin");
            factory.setPassword("123");
            factory.setPort(5672);
            return factory.newConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    //关闭通道和关闭连接的方法
    public static void closeConnection(Channel channel, Connection connection) {
        try {
            if (channel!=null)
            channel.close();
            if (connection!=null)connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
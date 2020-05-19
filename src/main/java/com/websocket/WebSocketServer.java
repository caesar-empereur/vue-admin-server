package com.websocket;

import com.alibaba.fastjson.JSON;
import com.controller.EchartDataController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.*;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/12.
 */
@ServerEndpoint(value = "/wss")
@Component
public class WebSocketServer {

    private static Logger log = LoggerFactory.getLogger(WebSocketServer.class);

    private ExecutorService executorService = Executors.newFixedThreadPool(2);

    private static final ConcurrentMap<Session, Boolean> CURRENT_SESSION = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session) {
        log.info("建立连接");
        CURRENT_SESSION.put(session, true);

        executorService.execute(()-> {
            while (CURRENT_SESSION.get(session) != null){
                String message = JSON.toJSONString(EchartDataController.newResponse(System.currentTimeMillis()));
                sendMessage(session, message);
                log.info("发送消息成功，当前时间：" + System.currentTimeMillis()/1000 + " 消息内容: " + message);
                try {
                    Thread.sleep(1000);
                }
                catch (InterruptedException e) {
                    log.error(e.getMessage());
                }
            }
            log.info("发送消息线程结束");
        });
    }

    @OnClose
    public void onClose(Session session) {
        CURRENT_SESSION.remove(session);

        log.info("连接关闭");
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("收到消息，消息内容："+message);
        sendMessage(session, "收到消息，消息内容："+message);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }

    private void sendMessage(Session session, String message) {
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

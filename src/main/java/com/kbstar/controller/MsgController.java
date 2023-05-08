package com.kbstar.controller;

import com.kbstar.dto.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class MsgController {
    @Autowired
    SimpMessagingTemplate template;

    @MessageMapping("/receiveall") // 모두에게 전송
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        System.out.println(msg);
         /*
            msg 객체를 다시 /send를 통해서 밖으로 보내고 있음.
            brower <=> admin(ws, receiveall) receiveall 로 보내면 /send로 다시 보냄
            서버에서 /send로부터 받은 메시지를 jsp에서 화면에 뿌려줌
         */
        template.convertAndSend("/send",msg);
    }
    @MessageMapping("/receiveme") // 나에게만 전송 ex)Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        System.out.println(msg);

        String id = msg.getSendid();
        template.convertAndSend("/send/"+id,msg);
    }
    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        template.convertAndSend("/send/to/"+target,msg);
    }
}
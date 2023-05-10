package com.kbstar.controller;

import com.kbstar.dto.Cart;
import com.kbstar.dto.MsgAdm;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Random;

@Component
@Slf4j
public class SchedulerController {

    @Autowired
    private SimpMessageSendingOperations messagingTemplate;
    @Autowired
    private CartService cartService;

    //15초에 한번씩 진행해라
    @Scheduled(cron = "*/7 * * * * *")
    public void cronJobDailyUpdate() {

        Random r = new Random();
        int content1 = r.nextInt(100) + 1;
        int content2 = r.nextInt(1000) + 1;
        int content3 = r.nextInt(500) + 1;
        int content4 = r.nextInt(10) + 1;

        MsgAdm msg = new MsgAdm();
        msg.setContent1(content1);
        msg.setContent2(content2);
        msg.setContent3(content3);
        msg.setContent4(content4);

        messagingTemplate.convertAndSend("/sendadm", msg);
    }

    //8초마다 한번씩 로그를 찍자.
    @Scheduled(cron = "* * * 1 * *")
    public void cronJobWeeklyUpdate(){
        Random r = new Random();
        int num = r.nextInt(100)+1;
        log.info(num + "");
        //string 이여야 하므로 "" 붙여줌

    }

//    @Scheduled(cron = "* * * * * *")
//    public void cronJobWeeklyUpdate() throws Exception {
//        List<Cart> list = cartService.get();
//        int total = 0;
//        for (Cart obj: list){
//            total += obj.getItem_price() * obj.getCnt();
//        }
//        log.info(total+"");
//    }

}
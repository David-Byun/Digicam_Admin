package com.kbstar;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class StomWebSocketConfig implements WebSocketMessageBrokerConfigurer{

    @Value("${serviceserver}")
    String serviceService;

    @Value("${adminserver}")
    String adminserver;
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        /*
             http://127.0.0.1:8080 어드민 - http://127.0.0.1 고객 : 2개 주소 허용해주겠다.
             사용자 브라우저 접속한 사람이 어드민 주소에도 접속할 수 있게 해줄게라는 의미
             서버에서 웹소켓 여러개 만들면, 어드민 서버 접속하면 브라우저 켜놓으면 데이터 계속 쏴줌
             스케줄러랑 연결하여 관리자 서버에서 반복해서 받을 수 있음
             ws 웹소켓은 관리자, 사용자가 연결하고 있음
         */

        registry.addEndpoint("/ws").setAllowedOrigins("http://127.0.0.1", serviceService).withSockJS();
        registry.addEndpoint("/chbot").setAllowedOrigins("http://127.0.0.1").withSockJS();
        //관리자를 위한 웹소켓 서버(관리자로 접속하면 sendadm으로 내보내본다. wss는 사용자하고만 연결되어 있음
        registry.addEndpoint("/wss").setAllowedOrigins("http://127.0.0.1").withSockJS();
    }


    //어플리케이션 내부에서 사용할 path를 지정할 수 있음. 받으면 send로 내보내겠다. broadcast로 내보내겠다. 관문 역활

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send","/sendadm");
    }
}
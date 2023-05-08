package com.kbstar;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class StomWebSocketConfig implements WebSocketMessageBrokerConfigurer{

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // http://127.0.0.1:8080 어드민 - http://127.0.0.1 고객 : 2개 주소 허용해주겠다.
        registry.addEndpoint("/ws").setAllowedOrigins("http://127.0.0.1:8083").withSockJS();
        registry.addEndpoint("/chbot").setAllowedOrigins("http://localhost").withSockJS();
        registry.addEndpoint("/wss").setAllowedOrigins("http://localhost").withSockJS();
    }

    /*
        어플리케이션 내부에서 사용할 path를 지정할 수 있음. 받으면 send로 내보내겠다. broadcast로 내보내겠다.
        관문 역활
     */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send","/broadcast");
    }
}
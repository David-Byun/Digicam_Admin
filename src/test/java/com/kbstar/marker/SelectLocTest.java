package com.kbstar.marker;

import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectLocTest {
    @Autowired
    MarkerService service;
    @Test
    void contextLoads() {
        try {
            // 대소문자 구분 필요
            service.getLoc("s");
        } catch (Exception e) {
                log.info("시스템 장애입니다...------------------------------------------");
                e.printStackTrace();
        }
    }

}

package com.kbstar.service;

import com.kbstar.dto.Chart;
import com.kbstar.mapper.ChartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartService {

    /*
        시스템 간의 데이터를 주고 받을 때 restful
        browser(admin1) <=> browser(admin2)
        json을 파싱해서 자바객체로 만들어서 해당 DB에 입력할 수 있음
        자바를 JSON으로 JSON을 자바로

        아래 두가지 방법 할 줄 알아야함

        1. JSON > 파싱 > Browser 보여주는 방식
        2. JSON > Browser 에서 데이터 추출해서 보여주는 방식
     */

    @Autowired
    ChartMapper chartMapper;
    public List<Chart> getMonthlyTotal() throws Exception {
        return chartMapper.getMonthlyTotal();
    }
}
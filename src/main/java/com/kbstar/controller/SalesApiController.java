package com.kbstar.controller;

import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
public class SalesApiController {

    private final SalesService service;

    @RequestMapping("/salesimpl")
    public Object getSales() {
        List<Sales> monthly = service.getMonthly();
        JSONArray jaMale = new JSONArray();
        JSONArray jaFemale = new JSONArray();
        JSONObject jo = new JSONObject();
        for (Sales obj : monthly) {
            if (obj.getGender() == "여성" || obj.getGender().equals("여성")) {
                jaMale.add(obj.getSum());
            } else {
                jaFemale.add(obj.getSum());
            }
        }
        jo.put("male", jaMale);
        jo.put("female", jaFemale);
        return jo;
    }

}

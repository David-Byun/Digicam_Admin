package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    @Value("${adminserver}")
    String adminserver;

    private final SalesService service;

    @RequestMapping("/")
    public String index(Model model) {
        List<Sales> monthly = service.getMonthly();
        JSONArray jaMale = new JSONArray();
        JSONArray jaFemale = new JSONArray();
        for (Sales obj : monthly) {
            JSONObject joMale = new JSONObject();
            JSONObject joFemale = new JSONObject();
            if (obj.getGender() == "여성" || obj.getGender().equals("여성")) {
                joFemale.put("female", obj.getGender());
                joFemale.put("monthly", obj.getMonthly());
                joFemale.put("sum", obj.getSum());
                jaFemale.add(joFemale);

            } else {
                joMale.put("male", obj.getGender());
                joMale.put("monthly", obj.getMonthly());
                joMale.put("sum", obj.getSum());
                jaMale.add(joMale);

            }
        }
        model.addAttribute("dataMale", jaMale);
        model.addAttribute("dataFemale", jaFemale);
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/card")
    public String card(Model model) {
        model.addAttribute("center", "card");
        return "index";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model) {
        model.addAttribute("center", "websocket");
        model.addAttribute("adminserver", adminserver);
        return "index";
    }

    @RequestMapping("/chart")
    public String chart(Model model) {
        model.addAttribute("center", "chart");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/livechart")
    public String liveChart(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "livechart");
        return "index";
    }

}

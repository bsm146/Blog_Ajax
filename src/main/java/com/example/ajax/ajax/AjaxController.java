package com.example.ajax.ajax;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class AjaxController {

    private final AjaxService ajaxService;

    @GetMapping("/home")
    public String home() {

        return "home";
    }

    @PostMapping("/ajaxTest")
    @ResponseBody
    public String login(@RequestParam String color) {

        String returnColor = "";

        if (color.equals("red")) {
            returnColor = "빨강";

        } else if (color.equals("yellow")) {
            returnColor = "노랑";

        } else if (color.equals("green")) {
            returnColor = "초록";
        }

        return returnColor;
    }



}

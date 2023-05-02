package com.example.ajax.ajax;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AjaxController {

    private final AjaxService ajaxService;

    @GetMapping("/home")
    public String home() {

        return "home";
    }

    @PostMapping("/color")
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

    @PostMapping("/join")
    @ResponseBody
    public List<AjaxUser> join(@ModelAttribute AjaxUser ajaxUser) {

        System.out.println(ajaxUser.getId());
        System.out.println(ajaxUser.getPassword());

        List<AjaxUser> userList = new ArrayList<>();
        userList.add(ajaxUser);

        return userList;
    }


}

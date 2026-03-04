package com.study.Ex13VMDB;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HtmlController {
    @GetMapping("/")
    private String index(){
        return "index";
    }
}

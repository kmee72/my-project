package com.study.Ex11RealDBCRUD.controller;

import com.study.Ex11RealDBCRUD.entity.MemberEntity;
import com.study.Ex11RealDBCRUD.entity.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    @Autowired
    private  final MemberRepository memberRepository;

    @GetMapping("/")
    public String main(Model model){
        List<MemberEntity>list=memberRepository.findAll();
        model.addAttribute("list",list);
        return "index";
    }
}

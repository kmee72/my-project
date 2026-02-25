package com.study.Ex09Model;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


//Java코드에서 UI템플릿(타임리프, JSP,머스테치)로 데이터 전달 방법
//1. Request객체, Session객체
//2.GET,POST파라미터
//3.Model객체
//4.ModelANdView객체

//스프링(JSP)내장 객체별 수명주기
//application:웹브라우저 닫을 때까지
//session: 로그아웃할 때까지
//request: 요청에 대한 응답하기까지
//model:request와 동일한 수명주기

@Controller
public class MainController {
    //application
    @Autowired
    private ServletContext application;

    @GetMapping("/")
    public String main() {
        if(application==null){
            System.out.println("null");
            return "index";
        }
        //데이터 저장
        application.setAttribute("globalCount", 100);
        //데이터 읽기
        Integer count = (Integer) application.getAttribute("globalCount");
        System.out.println("count = " + count);

        return "index";
    }

    @GetMapping("/session")
    public String session(HttpSession session){
        session.setAttribute("isLogin", true);
        //session.invalidate():로그아웃시 세션 데이터 소멸시키기
        return "index";
    }
    @GetMapping("/request")
    public String request(HttpServletRequest request){
        request.setAttribute("name","홍길동");
        request.setAttribute("age","30");
        return "index";

    }

    //request와 model객체의 차이점
    //request:Java Servet APT기반, 서블릿 표준 인터페이스(로우레벨)
    //      클라의 요청 전체에 대한 정보 관리
    //model:Spring F/W 기반, 스프링 프레임어크 전용 인터페이스(하이레벨)
    //      오직 뷰에 전달한 데이터를 담는 역할,스프링 MVC의 표준 방식
    @GetMapping("/model1")

   public String model1(Model model){
        model.addText ("name");
      model.addText("age");
        return "index";
    }


    @GetMapping("/post-from")
    public String postForm(){
        return "postForm";
    }
//    @PostMapping("/model2")
//    public String model2(HttpServletRequest request){
//        //form태그의 입려값으 받아오자.
//        String paramName=request.getParameter("name");
//        String paramAge=request.getParameter("age");
//        model.addAttribute("name", paramName);
//        model.addAttribute("age", paramName);
//
//        return "index";
//    }
    //GET방식은 주소줄에 파라미터를 넣어서 보낸다.
    //예)http://localhost:8080/model3?name=hong&age=30
//    @GetMapping("/model3")
//    public String model3(HttpServletRequest request){
//        String paramName=request.getParameter("name");
//        String paramAge=request.getParameter("age");
//        model.addAttribute("name", paramName);
//        model.addAttribute("age", paramName);
//        return "index";
//    }
    //ModelAndView:모델(데이터)와 View(html)을 동시에 저장하는 객체
    @RequestMapping("/model4") //기본은 GET방식
    public ModelAndView model4(ModelAndView mv){
        mv.addObject("name", "춘향이");
        mv.addObject("age", "17");
        mv.setViewName("index");;
        return mv;
    }


}//class


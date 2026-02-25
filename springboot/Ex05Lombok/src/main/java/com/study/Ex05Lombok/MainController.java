package com.study.Ex05Lombok;
//MainController.java : 이 파일이 요청을 처리하는 핵심

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller //웹 요청을 처리하는 클래스
public class MainController {
    //필드 주입: 스프링이 Member 객체를 자동으로 넣어
    @Autowired
    private Member member; //기본생성자로 생성된 객체가 주입된다.

    @GetMapping("/") //http://localhost:8080/allArgs
    @ResponseBody
    public String main(){
        //member.setName("Hong");
        System.out.println(member.getName());
        System.out.println(member.getAge());

        return "롬복 예제 서버입니다."+member.getName()+","+member.getAge();
    }
    @GetMapping("/allArgs")
    @ResponseBody
    public String allArgs(){//  스프링 Bean이 아니라 new로 직접 생성한 객체 사용
        Member member = new Member("변사또", 30, "123","");
        return member.getName();
    }

    //생성자 주입
    private final Member member1;
    @Autowired
    public MainController(Member member){ //기본생성자로 생성된 객체가 주입된다.
        this.member1=member;
    }
    @GetMapping("/reqArgs") // 주입받은 Bean 객체 사용, 값 변경, 반환
    @ResponseBody
    public String reqArgs(){
        member1.setPhone("3456");
        return"reqArgs()"+this.member1.getPhone();
    }
}//class

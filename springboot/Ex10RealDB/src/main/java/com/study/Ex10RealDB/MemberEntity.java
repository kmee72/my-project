package com.study.Ex10RealDB;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

//@Entity:엔티티 클래스임을 알려줌, DB테이블과 1:1매핑되는 클래스.
@Entity
@Table(name = "member") //entity클래스이름(MemberEntity)과 다르기에 넣어주었음
@Getter
//@Setter : 넣지 않는다. 개발자의 실수나 자동으로 호출되는 경우를 제거.
@AllArgsConstructor //편의성위해 넣었음 없어도 됨
@NoArgsConstructor //기본생성자 필수, @ModelAttribute @RequestBody에 필요!
public class MemberEntity {
    //@Id:기본키 id열로 사용한다는 의미
    //@GeneratedValue : id값을 어떻게 생성할지 전략을 선택
    //1. IDENTITY : MySQL, MariaDB, PostgreSQL(완전무료), H2DB
    //2. SEQUENCE : Oracle, PrestreSQL
    //3. AUTO:자동으로 선택

    //아래는매핑하는 방법임
    @Id //기본키
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    private String userId; //DB((대소문자안가림)는 Snake Case선호, Java(대소문자가림)는 Camel Case선호
    private String userPw;
    private String userName;
    private String userRole;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate joinDate;
}
// MySQL            JAVA엔티티
// BIGINT           Long
// INT              Integer
// Varchar(n)       String
// Text             String
// DATE             LocalDate
// DATETIME         LocalDateTime
// BLOB             byte[]
// TinyInt(1)       Boolean



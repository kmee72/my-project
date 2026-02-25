package com.study.Ex05Lombok;
//Member 클래스는 데이터 저장용, Bean 등록, Lombok으로 코드 자동 생성
//롬복이 지원하는 어노테이션 목록
//@Getter : getter 자동생성
//@Setter : setter 자동생성
//@NoArgsConstructor : 매개변수 없는 기본생성자 자동생성
//@AllArgsConstructor : 모든 필드를 파라미터로 받는 생성자 자동생성
//@RequiredArgsConstructor : final이나 @NonNull인 필드만
//                           매개변수로 받는 생성자 자동생성
//                         : 생성자 주입에 사용
//용도 : 1. 생성자 주입 -> MainController(많이 쓰이는 용도)
//      2. final필드 생성자 함수 생성 ->Member

//@NonNull : null을 허용하지 않는 객체 Bean 자동생성
//@Nullable : null을 허용하는 객체 Bean 자동생성,
//          jakarta.annotation.Nullable
//          javax -> jakarta  java이름의 라이센스 때문에
//@Data : @Getter, @Setter,@RequiredArgsConstructor,
//        @ToString, @EqualsAndHashCode을 한꺼번에 설정해주는 어노테이션
//@ToString : toString 메소드 자동생성
//@EqualsAndHashCode : equals, hashCode 메서드 생성


//jakarta : 예전에는 javax패키지를 Rename한 것.자바 기능 향상 패키지. 스프링에있는것 아님
import jakarta.annotation.Nullable;
import lombok.*;
import org.springframework.stereotype.Component;

@Component //Bean으로 설정하기 위해서는
            //기본생성자, 필드생성자, Getter/Setter를 넣어야 됨.
            //Lombok을 이용하면, 자동생성됨.
//@Getter   //인텔리제이 보기>도구>창 구조 화면에서 확인한다.
//@Setter
//force = true : final 필드가 존재할 때, 강제로 초기화 해주는 설정.
@NoArgsConstructor(force = true) // this.name = null; this.age = null; 강제로 null 초기화 생성자를 만들어줍니다.
@AllArgsConstructor
//@RequiredArgsConstructor //생성자 주입에 주로 사용
@Data //Lombok : 즉 getter 자동 생성, setter 자동 생성, toString 자동 생성, equals / hashCode 자동 생성
public class Member {
    private final String name;
    private final Integer age; //final필드는 반드시 초기화해서 사용해야함
    @NonNull //null을 혀용하지 않는 필드에 설정한다.롬복에 있는것
    private String phone;
    @Nullable //null을 허용하는 필드에 설정한다.자카르타에 있는것
    private String email;
}

package com.study.Ex05Lombok;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication 이 안에는 3가지가 합쳐져 있습니다
//	@Configuration (스프링 설정 파일 역할),
//	@ComponentScan(@Controller, @Component 자동 찾기),
//	@EnableAutoConfiguration(필요한 라이브러리 자동 설정)
@SpringBootApplication
public class Ex05LombokApplication {

	public static void main(String[] args) {
// main 메서드
//	내장 톰캣 서버 실행
//	스프링 컨테이너 생성
//	Bean 등록 시작
		SpringApplication.run(Ex05LombokApplication.class, args);
	}

}

package com.study.Ex12LoginJoinDb.entity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

//@Repository:@Component가 들어간 DB제어 클래스
    @Repository //bean으로 등록
    public interface MemberRepository
            extends JpaRepository<MemberEntity,Long>{
        //사용자 함수 정의
        //쿼리 자동 생성 : select * from T where userId=userId변수값
        Optional<MemberEntity>findByUserId(String userId);//Optional 안써도 됨

        //JPA 커스텀 쿼리 메소드 생성하는 규칙: 단점-모든 검색을 함수호출로 불가능!
        //https://velog.io/@633jinn/JPARepository-%EB%A9%94%EC%86%8C%EB%9

        //JPA에서 네이티브 SQL,JPQ을 사용하는 방법


        //JpaRepository의 기본함수
        //1. findAll(값):select * from table - SQL문 실행
        //2. findBy열이름():select * from Table where 컬럼명=값 - SQL을 실행
        //      예)findById((Long)2) :  select * from Table where id=2
        //        findByUserName("홍길동") : select * from T where username="홍길동"
        //3. save(Entity Class):insert와 update SQL을 실행, id값을 보고 있으면 update, 없으면 insert
        //4. delete(E): delete SQL을 실행
    }



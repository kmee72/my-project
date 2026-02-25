package com.study.Ex10RealDB;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



    //@Repository:@Component가 들어간 DB제어 클래스
    @Repository //bean으로 등록
    public interface MemberRepository
            extends JpaRepository<MemberEntity,Long>{ //CrudRepository(여러기능이 들어있음)만 쓰는경우도 있음
        //JpaRepository의 기본함수
        //1. findAll(값):select * from table - SQL문 실행
        //2. findBy열이름():select * from Table where 컬럼명=값 - SQL을 실행
        //      예)findById((Long)2) :  select * from Table where id=2
        //        findByUserName("홍길동") : select * from Table where username= "홍길동"
        //3. save(Entity Class):insert와 update SQL을 실행, id값을 보고 있으면 update, 없으면 insert
        //4. delete(E): delete SQL을 실행
    }



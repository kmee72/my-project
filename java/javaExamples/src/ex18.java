// 객체지향프로그래밍(OOP, Objective Oriented Programming)
//      : Java언어의 설계철학이 곧 OOP 이다.
//      : 객체(사물, 물건, 것) 지향(추구한다) 프로그래밍
//      : 모든 사물을 객체로 추상화(모델링)하여 프로그래밍하는 기법.
//      : new 클래스 = 객체 = 함수 + 변수  = 행동 + 속성
//      예) 자동차를 클래스로 만들어 보자
//          속성과 행동으로 구분한다.
//          변수(필드) 함수(메소드)
//          가격=1000원   행동=달린다

/* 1세대 언어: C언어(리눅스,유닉스OS 설계기반언어)
             Basin, Fortran, Cobal
             대규모 프로젝트 -> 유지/관리(코드 중복)
   C언어 -> 코드와 코드가 접착제처럼 밀접함.
   C++클래스 지원 -> C/C++ 혼용한다.
   C언어 main()함수안에 1000줄이 되는 코드 - 유지보수어렵다 */

// 클래스 선언(클래스 이름의 첫글자 대문자)
class Car {
    //속성(변수, 필드)
    int price = 1000;
    //행동(함수, 메소드)
    void run(){
        System.out.println("달린다.");
    }
}
public class ex18 {
    public static void main(String[] args) {
        //클래스로부터 객체를 생성한다.
        //클래스이름(타입) 객체이름 = new 클래스이름=생성자함수();
        Car myCar = new Car();
        //객체(클래스)안의 변수(멤버변수)에 접근하려면, 점을 찍는다.
        System.out.println(myCar.price); //system 안에도 out 안에도 여러함수가있다.
//        System.out.println(myCar.run()); // void 타입의 리턴값을 출력불가
//        int i = 10;
        myCar.run();
    }
}

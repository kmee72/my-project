// 클래스를 또 선언하려면, 클래스 밖에서 선언한다.
public class ex17 {
    //함수를 또 선언하려면, 함수 밖에서 선언한다.
    public static void main(String[] args) {
        // 함수(Function, Method(클래스안의 함수, Java))
        // JS와 거의 문법이 유사함.

        myFunc1();
//        void SecondFunc(){ }; // 함수안에서 재선언하면 안됨//
        myFunc2(10);
        int result = myFunc3();
        System.out.println("result = "+result);
        String resultStr = myFunc4("대한", "민국");
        System.out.println("resultStr = " + resultStr);
    }
    // static함수에서 함수호출시 static을 사용해야 됨
    // 매개변수 x, 반환값 x (void 타입 사용)
     static void myFunc1(){
//        return; 아래코드가 dead 코드가되버림
        System.out.println("myFunc1 호출됨");
//        return; //반환값이 없을대(void) return 생략 가능.
    }
    // 매개변수 o, 반환값 x
    static void myFunc2( int param ){
        //함수의 매개변수와 지역변수는 함수 안에서만 작동한다.
        int localVar = 20;
        System.out.println("myFunc2:" + param);
    }
    // 매개변수 x, 반환값 o
    static int myFunc3(){
        //반환타입과 값을 일치시켜야 됨.
        // return "문자열"; //오류
        System.out.println("myFunc3 호출됨.");
        return 30;
    }
    // 매개변수 x, 반환값 x
    static  String myFunc4(String param1, String param2){
        return param1 + param2;
    }
}
class Other{
    //클래스 밖에서 선언됨
}

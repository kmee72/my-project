//다형성 : 폴리모피즘
//      : 자식클래스 객체가 자기클래스 또는 부모클래스의 타입을 모두 가질수 있는것.스프링 설계 철학 깉이 관여됨.
//사용이유: 타입의 유연성을 갖기 위해
//      : 타입을 정확하게 지정하지 않더라도 객체를 매개변수로 전달이 가능하다.
//      : 프로그램 기능을 확장할 때, 기존 코드 유지한 채로 새로운 코드를 추가하기 쉽다.
//      예) USB C타입 호환 :  어떤 USB C타입 기기도 사용가능


//class lass MonoClass{
//    int mono(int price){
//        return  price * 2;
//    }
//}
class Parent{
    String name = "Parent";
    void parentMethod(){
        System.out.println("Parent 내 이름은 " + this.name);
    }
}
class Child extends  Parent{
    String name = "Child";
    void childMethod(){
        System.out.println("Parent 내 이름은 " + this.name);
    }
}

public class ex34 {
    public static void main(String[] args) {
        Parent p1 = new Parent();
        System.out.println(p1.name);
        Child c1 = new Child();
        System.out.println(c1.name);

//        Parent p10 = new Parent();
//        Child c10 = (Child)p10; //Parent타입에서 Child타입으로 안됨.

        //1. 업캐스팅(Up Casting) : 자식객체가 부모클래스의 타입을 갖는 것
        //  1)대입연산자를 통해서(암묵적 형변환)
        Parent p2 = new Child();
        System.out.println(p2.name);

        //  2)강제형변환 연산자를 통해서(명시적)
        Parent p3 = (Parent) c1;
        System.out.println(p3.name);

        //2. 다운캐스팅(Down Casting) : 부모클래스를 가르키는 자식객체가(즉, 자식객체가 업캐스팅 되었다가) 다시 자식클래스의 타입을 갖는 것
        Child c2 =  (Child)p2;
        System.out.println(c2.name); // Child타입

        //4가지 패턴
        Parent a = new Parent();
        Child b = new Child();
        Parent c = new Child(); // UpCasting
        Child d = (Child)c; // DownCasting

//      // Child e = new Parent(); //불가하다.






    }
}


import java.util.Scanner;

public class pr01 {
    public static void main(String[] args) {

        // 문제1
        // 이클립스 콘솔에 println 또는 print 문을 이용하여 다음 문장을 출력해보자. (대소문자에 주의한다.)
        //       입력예시
        //       없음
        //       출력예시
        //       Hello
        System.out.println("HEllo");

        // 문제2
        // 이클립스 콘솔에 println 또는 print 문을 이용하여 다음 문장을 출력해보자.
        System.out.println("Hello World");

        // 문제3
        // 이번에는 줄을 바꿔 문장을 출력하는 출력을 연습해보자.
        // 다음과 같이 줄을 바꿔 출력해야 한다.
        // 두 줄에 걸쳐서 줄을 바꿔 출력한다.
        System.out.println("Hello");
        System.out.println();
        System.out.println("World");
        System.out.println();
        System.out.println("도움말");

        // 문제4
        // 이번에는 작은(단) 따옴표(') (Single Quotation mark)를 문장에 넣어 출력해야 한다.
        // 다음과 같은 문장을 출력하시오.
        System.out.println(" \'Hello\' ");

        // 문제5
        // 이번에는 큰 따옴표(') (Single Quotation mark)를 문장에 넣어 출력해야 한다.
        // 다음과 같은 문장을 출력하시오.
        // "Hello World"
        // (주의 : 큰 따옴표(")도 함께 출력되어야 한다.)
        System.out.println("\"Hello world\"");

//  escape | 의미  |
//| ------ | -------------|
//| `\"`   | 큰따옴표 출력  |
//| `\'`   | 작은따옴표 출력 |
//| `\\`   | 역슬래시 출력  |
//| `\n`   | 줄바꿈  |
//| `\t`   | 탭 |

        // 문제6
        // 이번에는 여러 가지 문자들이 포함된 문장을 출력해보자.
        // 다음과 같은 파일 경로를 그대로 출력하시오.
        // C:\Download\hello.java
        System.out.println("c:\\Download\\hello\\hello.java");

        // 문제7
        // 키보드로 입력한 정수값을 그대로  출력하는 프로그램을 작성해보자.
        // 입력
        //   정수값 한 개가 입력된다.
        // 출력
        //   입력된 정수를 그대로 출력한다.
        // 입력 예시
        //   15
        // 출력 예시
        //   15

    //  클래스 | 변수(객체명) | 객체생성키워드 | 생성자  | 표준 입력 스트림(키보드) --> 키보드로부터 입력을 받을 수 있는 객체 생성
        Scanner scan = new Scanner(System.in);
    //  클래스 |객체명| 메서트
        System.out.println("숫자입력:");
    //  정수형자료형|변수명|Scanner객체|정수입력메서드 --> 키보드에서 입력한 정수값을 읽어서 변수 i에 저장
        int i = scan.nextInt();
        System.out.println("i = " + i);



// 변수명 규칙 : 문자로 시작, 예약어 사용 불가, 특수문자는 _ 와 $만 가능, 공백 불가, 대소문자 구분, 의미전달 변수명사용
// 생성자 규칙 : 생성자이름은 클래스 이름과 반드시 같아야 함, 반환형은 절대 쓰면 안 됨
        // 생성자를 안 만들면? => 기본 생성자가 자동으로 만들어짐
// 생성자 내부 코드도 임의로 가능
// 매개변수는 임의로 가능 : 개수, 타입, 변수명 전부 자유
//| 메서드          | 입력  |
//| -------------- | ---  |
//| `nextInt()`    | 정수  |
//| `nextDouble()` | 실수  |
//| `next()`       | 단어  |
//| `nextLine()`   | 한 줄 |
// 객체가 필요한 이유 3가지
//   ① 실제로 사용하려고 : 메서드 호출, 값 저장//
//   ② 독립된 상태를 가지려고
//   ③ 현실 세계 표현 : 학생 여러 명, 계좌 여러 개, 사용자 여러 명

//  객체 생성하면?
//        Scanner → 설계도//
//        scan → 실제 물건//
//        new → 만들어라//
//        System.in → 키보드 연결

        // 문제8
        // 키보드로 입력한 문자를 그대로 출력하는 프로그램을 작성해보자.
        //    scan.next(); //초기화
                scan.next(); //초기화

        System.out.println("문자열입력:");
        String str =  scan.next();
        System.out.println("str = " + str);

        //문제 9
        //키보드로 입력한 실수(소수점이 있는 수)를 그대로 출력하는 프로그램을 작성해보자.
        float myFloat = 1.414f;
        System.out.println("실수:" + myFloat);


        // 문제 10
        // 정수(integer) 두 개를 입력받아 그대로 출력해보자.
        System.out.println("정수2개입력:");
        int a =  scan.nextInt();
        int b =  scan.nextInt();
        System.out.println(a+ " " + b);

        // 문제 11
        // 두 개의 문자를 입력받은 후 순서를 바꿔 출력해보자.
        System.out.println("두개의 문자 입력:");
        String myStr1 = scan.next();
        String myStr2 = scan.next();
        System.out.println(myStr2+myStr1);

        // 문제 12
        // 하나의 단어를 입력받아 그대로 출력해보자.
        scan.nextLine();
        System.out.println("단어 한개 입력:");
        String word = scan.nextLine();
        System.out.println("word = " + word);

        // 문제 13
        // 실수(float) 한 개를 입력받아 소수점 이하 3째 자리에서 반올림 하여 2째 자리까지 출력하시오.
        System.out.println("실수 한개를 입력:");
        float myFloat2 = scan.nextFloat();
        System.out.printf("%.2f\n",myFloat2);

        // 문제 14
        // 시간이 특정 형식에 맞추어 입력될 때 그대로 출력하는 프로그램을 작성 해보자.
        // 입력
        // 시(hour)와 분(minute)이 구분되어 입력된다.
        // 시와 분은 두 개의 정수로 입력받는다.
        // 출력
        // 입력받은 시간을 "시:분"으로 출력한다.
        // 입력 예시
        // 3
        // 16
        // 출력 예시
        // 3:16

    }
    }
}

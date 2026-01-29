import java.util.Arrays;

public class ex05 {
    public static void main(String[] args) {
// 문자열 관련 함수들
        // JS는 let사용
        String str1 = "Hello Java!"; // 11자
        String str2 = "안녕하세요! 반갑습니다."; // 13자
// 문자열 길이
        System.out.println(str1.length());
        System.out.println(str2.length());// JS는 length
// 문자 하나 가져오기
        char c1 = str1.charAt(0); // 0은 맨 첫문자 의미
        System.out.println("c1 = " + c1);
        char c2 = str2.charAt(0);
        System.out.println("c2 = " + c2);
// 문자열의 위치(인덱스) 가져오기
        //"Hello Java!"
        System.out.println(str1.indexOf("Java"));
// 마지막 문자열의 위치 가져오기
        System.out.println(str1.lastIndexOf("a"));

// 대문자
        String str3 = " Java Study";
        System.out.println(str3.toUpperCase());
// 소문자
        System.out.println(str3.toLowerCase());
// 문자열 검색시 소문자로 바꿔서 검색한다.
        System.out.println(str3.toLowerCase().indexOf("java"));
// 문자열 치환하기
        System.out.println(str3.replace("Study","공부"));
// 문자열 일부 가져오기
        System.out.println(str3. substring(0,4)); //시작인덱스 끝인덱스(+1)
// 문자열을 분리해서 문자열 배열로 가져오기
        String[] strArray = "abc/def-ghi jkl".split("/|-|");
        System.out.println("strArrays = " + strArray);
        System.out.println("strArrays = " + Arrays.toString(strArray)); //실행결과로 타입과 주소가 나옴
// 양쪽 공백제거
        System.out.println(" abc ".trim());
        System.out.println(" abc def".trim());
// 모든 공백제거
        System.out.println(" abc def".replaceAll("", ""));
// 문자열 연결함수
        System.out.println("abc".concat("123"));
// 문자열을 포함하는지 true/false 로 반환하는 함수
        System.out.println("abc123".contains("123"));

// 문자열 비교할 때 Java만의 특징
        String str4 = "Java";
        String str5 = "java";
        //주소값을 가진 정수를 비교하므로 안됨.
        System.out.println( str4 == str5);
        // 그래서 자바에서 문자열 내용 비교시 equals를 꼭 써준다.
        System.out.println(str4.equals(str5));
        // 즉, 대부분의 언어들이 문자열을 비교할 떄 ==를 쓴다.
        // JS, C#, Python 등에서.

        String str6 = "abc";
        String str7 = new String("abc");
        System.out.println(str6 == str7); // false나옴 리터럴 타입으로 초기화됬는지 객체타입으로 초기화 됬는지 알기위해 equals를 써줌
        System.out.println(str6.equals(str7)); // 실행결과 true나옴


    }
}

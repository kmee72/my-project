import java.util.ArrayList;
import java.util.Collections;

public class ex50 {
    public static void main(String[] args) {
//데이터 구조 : 데이터를 담는 그릇(매우 중요함 특히 1,2,3,4 그리고 클래스)
//1.변수 : 단 하나의 값(숫자, 문자열(문자), 논리)
//2.배열 : 인덱스가 있는 연속된 공간에 담음(Java배열은 동일한 타입)
//3.리스트 : 인덱스가 있는 연속된 공간. 추가/삭제/교체가 간단
//4.맵 :Key-Value(JSON) 형태의 데이터 구조, 인덱스(순서)가 없음.
//5.세트 : 집합구조의 데이터 구조(중복없음). 인덱스 (순서)가 없음.
//6.스택/큐 : Stack/Queue 데이터구조.
//          FILP/FOFO(First Input Last Out/First Input First Out)
//*클래스 : 변수와 함수의 모음. 객체,

//콜렉션 프레임워크 : List(=Array), Map(=KV객체), Set(집합)
//기존 데이터구조에 없는 데이터구조를 새로 추가해 놓은 것.
//1.리스트
//  List 인터페이스를 구현해서 ArrayList(일반), LinkedList(알고리즘기반)
//  클래스가 있다.
//  ArrayList : 순차적을 데이터가 나열되어 있다.. 순차적인 데이터 접근에
//              빠르다.
//  LinkedList : 다음 요소의 주소값을 이전 요소가 가지고 있다. 흩어져 있는
//              데이터에 대한 접근이 빠르다.
// 제네릭(타입을 확정해준다.)
       ArrayList<String> fruits =  new ArrayList<String>(); //여기서는 길이가 0, ArrayList<String> 한세트로 보면 되고 배열의타입을 정해준다, <String>생략가능
        System.out.println(fruits); //[}
        //add()맨 뒤에 요소 추가
        fruits.add("수박");
        System.out.println(fruits);
        fruits.add("망고");
        System.out.println(fruits);
        fruits.add("딸기");
        System.out.println(fruits);

        //리스트 길이
        System.out.println(fruits.size());
        //맨 앞에 추가
        fruits.add(0, "레몬");
        System.out.println(fruits);
        //중간에 추가
        fruits.add(1,"사과");
        System.out.println(fruits);
        //삭제
        fruits.remove(1);
        System.out.println(fruits);
        //오른차순 정렬
        Collections.sort(fruits);
        System.out.println(fruits); // 가나다 123 ABC abc
        //내림차순 정렬
        Collections.sort(fruits,Collections.reverseOrder());
        System.out.println(fruits);
        //요소의 변경/치환
        fruits.set(1,"복숭아");
        System.out.println(fruits);
        //전체지우기
        fruits.clear();
        System.out.println(fruits);

    }
}

import java.util.ArrayList; // 1. ArrayList 임포트 필요
import java.util.Scanner;

class Student {
    String name;
    int kor, eng, math;

    public Student(String name, int kor, int eng, int math) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.math = math;
    }

    @Override
    public String toString() {
        return "이름: " + name + " 국어: " + kor + " 영어: " + eng + " 수학: " + math;
    }
}

public class ex52 {
    //연습문제 - 성적 관리 프로그램
    // ArrayList 클래스 객체 배열을 사용해보자.
    //입력 및 출력 예시
    //-----------성적 관리 프로그램-------------
    //1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 : 1
    //이름 입력 : 홍길동
    //국어점수 입력 : 70
    //영어점수 입력 : 80
    //수학점수 입력 : 90
    //-----------성적 관리 프로그램-------------
    //1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 : 2
    //이름: 홍길동 국어: 70 영어: 80 수학: 90 총점: 240 평균: 80.0
    //-----------성적 관리 프로그램-------------
    //1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 : 3
    //이름 입력 :홍길동
    //이름: 홍길동 국어: 70 영어: 80 수학: 90 총점: 240 평균: 80.0
    //-----------성적 관리 프로그램-------------
    //1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 : 4
    //이름 입력 :홍길동
    //국어점수 입력 : 70
    //영어점수 입력 : 80
    //수학점수 입력 : 90
    //-----------성적 관리 프로그램-------------
    //1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 :5
    //이름 입력 :홍길동
    //홍길동 삭제됨.
    //-----------성적 관리 프로그램-------------
    //1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 :6
    //프로그램이 종료되었습니다.
    public static ArrayList<Student> scoreList = new ArrayList<>();
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("\n-----------성적 관리 프로그램-------------");
            System.out.print("1.입력 2.전체출력 3.검색 4.수정 5.삭제 6.종료 : ");

            int menu = scanner.nextInt();
            if (menu == 1) {
                System.out.print("이름 입력 : ");
                String name = scanner.next();
                System.out.print("국어점수 입력 : ");
                int kor = scanner.nextInt();
                System.out.print("영어점수 입력 : ");
                int eng = scanner.nextInt();
                System.out.print("수학점수 입력 : ");
                int math = scanner.nextInt();
                scoreList.add(new Student(name, kor, eng, math));
            } else if (menu == 2) {
                for (Student s : scoreList) {
                    System.out.println(s);
                }
            } else if (menu == 3) {
                System.out.print("이름 입력 : ");
                String searchName = scanner.next();
                for (Student s : scoreList) {
                    if (s.name.equals(searchName)) {
                        System.out.println(s);
                    }
                }
            } else if (menu == 4) {
                System.out.print("이름 입력 : ");
                String updateName = scanner.next();
                for (Student s : scoreList) {
                    if (s.name.equals(updateName)) {
                        System.out.print("국어점수 입력 : ");
                        s.kor = scanner.nextInt();
                        System.out.print("영어점수 입력 : ");
                        s.eng = scanner.nextInt();
                        System.out.print("수학점수 입력 : ");
                        s.math = scanner.nextInt();
                    }
                }
            } else if (menu == 5) {
                System.out.print("이름 입력 : ");
                String deleteName = scanner.next();
                for (int i = 0; i < scoreList.size(); i++) {
                    if (scoreList.get(i).name.equals(deleteName)) {
                        scoreList.remove(i);
                        System.out.println(deleteName + " 삭제됨.");
                        break;
                    }
                }
            } else if (menu == 6) {
                System.out.println("프로그램이 종료되었습니다.");
                break; // 이 break가 while(true) 무한루프를 탈출하게 합니다.
            }
        }
    }
}
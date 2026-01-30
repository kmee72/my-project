public class ex099 {
    public static void main(String[] args) {
        //연습문제
        //1. 철수와 영희가 주사위 놀이를 하고 있다.
        // 주사위 2개를 던져서,
        // 두개 다 짝수가 나오면 철수 승!
        // 두개 다 홀수가 나오면, 영희 승!
        // 그외의 경우는 무승부! 이다.
        // 게임의 결과를 출력하시오.
        int num1= (int) (Math.random() * 6 + 1);
        int num2= (int) (Math.random() * 6 + 1);
        System.out.println("첫번째:");
        System.out.println("두번째:");

        if (num1 % 2 == 0 && num1 % 2 == 0) {
            System.out.println("철수 승");
        } else if
        (num1 % 2 == 1 && num1 % 2 == 1){
            System.out.println("영희 승");
        }else{
            System.out.println("무승부");
        }
        //2.
        //철수와 영희을 주사위게임을 하고 있다.
        //주사위 2개를 철수가 던지고,
        //주사위 2개를 영희도 던진다.
        //게임룰 : 첫번째 주사위는 십의 자릿수로하고,
        //        두번째 주사위는 일의 자릿수로 해서,
        // 더 높은 점수를 가진 사람이 승리한다.
        //출력값 예시 :
        //        철수 주사위1 수 : 1
        //        철수 주사위2 수 : 3
        //        철수의 점수는 13
        //        영희 주사위1 수 : 3
        //        영희 주사위2 수 : 4
        //        영희의 점수는 34
        //        영희 승!

    }
}

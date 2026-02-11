public class ex44 {
    public static void main(String[] args) {
//throws문
//  :자신을 호출한 메소드에 예외처리를 떠넘기는 것.
//  :예외처리가 귀찮을때, 그러면 코드가 간결해짐
        try{
            myFunc();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
        static void myFunc() throws Exception{
            System.out.println(10/0);
        }
    }


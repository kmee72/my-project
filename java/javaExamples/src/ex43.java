
public class ex43 {
    public static void main(String[] args) {
//예외 처리(Exception Handling)
//  예외 - 에러(error)
//

//1. try catch문, try catch finally문
//2. throws문

//패턴
//try { 예외가 발생할 만한 실행문 }
//catch (예외클래스 객체){예외발생시 처리하는 실행문 (예)에러내용출력}
//finally{예외가 발생하든지 안하든지 무조건 수행}
//  :수행하던 코드(자원-메모리)를 정리하는 코드.

//null Exception(널 처리 오류)
    String name = null;
        System.out.println(name);

        System.out.println(name.toLowerCase()); //오류 뜸 NullPointerException,  Cannot invoke "STring.toLowerCase()" because "name" is null

        System.out.println("I am Live still~"); //바로 위 코딩줄에서 끝나기에  이줄은 실행 안됨
        //이 것을 해결하기위해 try~ catch~
        try{
            System.out.println(name. toLowerCase());
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace(); //예외발생경로 출력
        }

//배열 인덱싱 예외
//0으로 나누기
        try {
            int[] nums = {10,20,30};
            //System.out.println(nums[3]); //3이 없기에 에러뜸 , ArrayIndexOutOfBoundsException
            System.out.println(10/0);
        }
        catch (ArrayIndexOutOfBoundsException e){
            System.out.println("ArrayIndexOutOfBoundsException");
        }

        catch (ArithmeticException e){
            System.out.println("ArithmeticException");
            //System.out.println(e.getMessage());
        }

        //모든 Exception으 Exception클래스를 상속받는다.
        catch (Exception e){
            System.out.println("Exception");
            //System.out.println(e.getMessage());
            //e.printStackTrace();
        }
        finally {
            System.out.println("정리하는 코드");
            //예) scan.close();
        }
        System.out.println("I am Live still~");


    }
}

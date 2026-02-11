import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ex47 {
    public static void main(String[] args) {
        //연습문제
        //철수는 초등학교 교사이다.
        //학생 영희, 수만, 순신의 성적관리 프로그램을 작성하고자 한다.
        //scor.txt에 저장하고, 읽어 오는 프로그램을 작성해 보자.
        //파일 형식
        //이름 영어 수학 국어 \n
        //영희 100  80  70\n
        //수만 100  80  70\n
        //순신 100  80  70\n

        // 그 다음 학생이름과 과목을 Scanner로 입력받고,
        //점수를 출력하는 프로그램을 작성하시오.
        //입력예) 영의 영어
        //출력예) 100



                // 1. 파일에 성적 데이터 쓰기
                try (FileWriter file = new FileWriter("score.txt")) {
                    file.write("이름 영어 수학 국어\n");
                    file.write("영희 100 80 70\n");
                    file.write("수만 90 85 95\n");
                    file.write("순신 88 92 78\n");
                    System.out.println("score.txt 파일 생성 완료!");
                } catch (IOException e) {
                    e.printStackTrace();
                }

                // 2. 파일에서 성적 데이터 읽어오기
                Map<String, Map<String, Integer>> scoreData = new HashMap<>();

                try (BufferedReader br = new BufferedReader(new FileReader("score.txt"))) {
                    br.readLine(); // 첫 줄(헤더) 건너뛰기

                    String line;
                    while ((line = br.readLine()) != null) {
                        String[] parts = line.split(" ");
                        String name = parts[0];
                        int english = Integer.parseInt(parts[1]);
                        int math = Integer.parseInt(parts[2]);
                        int korean = Integer.parseInt(parts[3]);

                        Map<String, Integer> scores = new HashMap<>();
                        scores.put("영어", english);
                        scores.put("수학", math);
                        scores.put("국어", korean);

                        scoreData.put(name, scores);
                    }
                    System.out.println("파일 읽기 완료!\n");
                } catch (IOException e) {
                    e.printStackTrace();
                    return;
                }

                // 3. 사용자 입력받아 점수 출력
                Scanner scanner = new Scanner(System.in);

                while (true) {
                    System.out.print("학생 이름과 과목을 입력하세요 (예: 영희 영어) [종료: q]: ");
                    String input = scanner.nextLine().trim();

                    if (input.equalsIgnoreCase("q")) {
                        System.out.println("프로그램을 종료합니다.");
                        break;
                    }

                    String[] inputParts = input.split(" ");

                    if (inputParts.length != 2) {
                        System.out.println("올바른 형식으로 입력하세요. (예: 영희 영어)\n");
                        continue;
                    }

                    String studentName = inputParts[0];
                    String subject = inputParts[1];

                    if (!scoreData.containsKey(studentName)) {
                        System.out.println("해당 학생을 찾을 수 없습니다.\n");
                        continue;
                    }

                    if (!scoreData.get(studentName).containsKey(subject)) {
                        System.out.println("해당 과목을 찾을 수 없습니다. (영어, 수학, 국어 중 입력)\n");
                        continue;
                    }

                    int score = scoreData.get(studentName).get(subject);
                    System.out.println(score + "\n");
                }

                scanner.close();
            }
        }


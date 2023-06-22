package day0621;

import java.util.Scanner;

public class QuizWhileTrue_13 {

	public static void main(String[] args) {
		/*
		 점수를 반복해서 입력하다가 q나 Q를 입력하면 
		 while문을 빠져나온뒤 총갯수,총점,평균을 출력하시오
		 평균은 소숫점1자리
		 */
		Scanner sc=new Scanner(System.in);
		
		String score;
		int sum=0,cnt=0;
		double avg;
		
		while(true)
		{
			System.out.println("점수입력(q or Q 종료)");
			score=sc.nextLine();
			
			//종료
			//if(score.equals("q") || score.equals("Q"))
			//if(score.equalsIgnoreCase("q"))
			if(score.charAt(0)=='q' || score.charAt(0)=='Q')
				break;
			
			cnt++;
			sum+=Integer.parseInt(score); //정수로 변환후 합계변수에 누적
			
		}
		
		avg=(double)sum/cnt; //둘다정수이므로 double로 형변환
		
		System.out.println("***결과출력***");
		System.out.println("점수 개수: "+cnt);
		System.out.println("점수 총점: "+sum+"점");
		System.out.printf("평균: %.1f",avg);
	}

}

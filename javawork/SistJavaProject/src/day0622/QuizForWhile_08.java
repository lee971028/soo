package day0622;

import java.util.Scanner;

public class QuizForWhile_08 {

	public static void quiz1()
	{
		/*
		 나이를 반복해서 입력받는다
		 0이되면 빠져나와서 출력한다
		 나이가 50이상일경우 a변수 증가
		 나이가 30이상일경우 b변수 증가
		 그나머지는 c변수 증가
		 
		 ===============
		 50세이상: 3명
		 30세이상: 2명
		 그이외: 1명
		 */
		
		Scanner sc=new Scanner(System.in);
		int age;
		int a=0,b=0,c=0;
		
		while(true)
		{
			System.out.print("나이입력: ");
			age=sc.nextInt();
			
			//break
			if(age==0)
			{
				System.out.println("프로그램종료");
				break;
			}
				
			
			//조건..인원증가
			if(age>=50)
				a++;
			else if(age>=30)
				b++;
			else
				c++;
			
		}
		
		System.out.println("50세이상: "+a+"명");
		System.out.println("30세이상: "+b+"명");
		System.out.println("그이외: "+c+"명");
		
		
	}
	public static void quiz2()
	{
		//Q.총 10개의 다양한 숫자(양수,음수)를 입력받아 양수의 갯수와 음수의 갯수를 구하시오
		/*
		 1 : 45
		 2: -23
		 3: 0
		 
		 ===========
		 양수갯수: 6
		 음수갯수: 3
		 * */
		//1.import
		Scanner sc=new Scanner(System.in);
		
		//2.변수
		int num; //입력할수
		int pcnt=0,ncnt=0; //양수,음수 갯수변수
		
		
		for(int i=1;i<=10;i++)
		{
			System.out.print(i+": ");
			num=sc.nextInt();
			
			//양수조건
			if(num>0)
				pcnt++;
			else if(num<0)
				ncnt++;
		}
		System.out.println("----------------------------");
		System.out.println("양수의 갯수: "+pcnt);
		System.out.println("음수의 갯수: "+ncnt);
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz1();
		quiz2();
	}

}

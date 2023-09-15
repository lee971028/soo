package day0620;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerReview_01 {

	public static void main(String[] args) {
		/*
		 * 태어난연도: 1997
		 * 이름: 홍길동
		 * 핸드폰번호: 010-1234-5678
		 * 주소: 서울시 동작구
		 * ============================
		 *     [개인정보]
		 * 이름: 홍길동
		 * 나이: 26세
		 * 연락처: 010-1234-5678
		 * 주소: 서울시 동작구
		 */
		
		//import
		Scanner sc=new Scanner(System.in);
		Calendar cal=Calendar.getInstance();
		
		//변수선언
		String name,addr,hp;
		int birthYear,age;
		
		//입력
		System.out.print("태어난 연도는: ");
		//birthYear=sc.nextInt();
		birthYear=Integer.parseInt(sc.nextLine());
		//Integer.parseInt("1997")=>1997  String==>int
		
		System.out.print("이름은: ");
		name=sc.nextLine();
		
		System.out.print("핸드폰번호: ");
		hp=sc.nextLine();
		
		System.out.print("주소: ");
		addr=sc.nextLine();

		
		//나이계산
		age=cal.get(cal.YEAR)-birthYear;
		
		//결과출력
		System.out.println("=======================");
		System.out.println("이름: "+name);
		System.out.println("나이: "+age+"세");
		System.out.println("연락처: "+hp);
		System.out.println("주소: "+addr);
	}

}

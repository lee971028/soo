package day0620;

import java.util.Scanner;

public class QuizIfOper_05 {

	public static void main(String[] args) {
		/*
		 상품명?  아이패드
		 수량?  3
		 가격?  500000
		 =====================
		 아이패드 3개는 총 1500000 원 입니다
		 조건: 3개이상은 10프로 DC가 됩니다
		 DC된 총금액: 1350000원
		 */

		Scanner sc=new Scanner(System.in);
		
		String sangName;
		int su,dan;
		int total;
		
		//입력
		System.out.print("상품명? ");
		sangName=sc.nextLine();
		System.out.print("수량? ");
		su=sc.nextInt();
		System.out.print("가격? ");
		dan=sc.nextInt();
		
		//총금액계산
		total=su*dan;
		
		//출력
		System.out.println(sangName+" "+su+" 개는 총"+total+"원 입니다");
		
		//수량이 3개 이상이면 10%DC
		if(su>=3)
		{
			int dc=(int)(total*0.9);
			System.out.println("조건: 3개이상이면 10프로 DC됨");
			System.out.println("DC된 금액: "+dc+"원");
		}
		
	}

}

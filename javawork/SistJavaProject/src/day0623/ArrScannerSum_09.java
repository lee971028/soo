package day0623;

import java.util.Scanner;

public class ArrScannerSum_09 {

	public static void main(String[] args) {
		/*
		 0번지 값: 55
		 1번지 값: 77
		 2번지 값: 88
		 3번지 값: 49
		 4번지 값: 29
		 =================
		 [입력값 확인]
		 1번째값: 55
		 2번째값: 77
		 3번째값: 88
		 4번째값: 49
		 5번째값값: 29
		 ==================
		 총합계:  298
		 */

		Scanner sc=new Scanner(System.in);
		
		int [] data;
		data=new int[5];
		
		int sum=0;
		
		//값입력
		for(int i=0;i<data.length;i++)
		{
			System.out.print(i+"번지 값: ");
			data[i]=sc.nextInt();
			sum+=data[i];
		}
		
		//값출력
		System.out.println("====================");
		System.out.println("[입력값 확인]");
		
		for(int i=0;i<data.length;i++)
		{
			System.out.println((i+1)+"==>"+data[i]);
		}
		System.out.println("====================");
		System.out.println("총합계: "+sum);
	}

}

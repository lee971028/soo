package day0622;

import java.util.Scanner;

public class ScanGugu_05 {

	public static void main(String[] args) {
		// 단을 입력해서 해당단 출력하기_Scanner
		//0을 입력시 종료

		Scanner sc=new Scanner(System.in);
		int dan;
		
		while(true)
		{
			System.out.print("단을 입력하세요(종료:0)");
			dan=sc.nextInt();
			
			//종료
			if(dan==0)
			{
				System.out.println("종료합니다");
				break;
			}
			
			//2~9단까지만 입력가능
			if(dan<2 || dan>9)
			{
				System.out.println("2~9단까지만 입력가능");
				continue;
			}
			
			//구구단출력
			System.out.println("["+dan+"단]");
			for(int j=1;j<=9;j++)
			{
				//System.out.println(dan+"X"+j+"="+dan*j);
				System.out.printf("%d X %d = %2d\n",dan,j,dan*j);
			}
			System.out.println();
		}
				
	}

}

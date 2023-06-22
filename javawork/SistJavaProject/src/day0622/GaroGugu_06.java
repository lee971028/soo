package day0622;

public class GaroGugu_06 {

	public static void main(String[] args) {
		// 가로방향으로 구구단을 출력하세요
		//[2단]  [3단]   [4단].............[9단]
		System.out.println("\t**가로방향 구구단**");
		
		//제목[]
		for(int dan=2;dan<=9;dan++)
		{
			System.out.print("["+dan+"단]\t");
		}
		
		System.out.println();
		System.out.println();
		
		for(int j=1;j<=9;j++)
		{
			for(int dan=2;dan<=9;dan++) //단
			{
				System.out.print(dan+"X"+j+"="+dan*j+"\t");
			}
			System.out.println();
		}
	}

}

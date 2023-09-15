package day0626;

import java.util.Scanner;


public class QuizFind_05 {

	public static void main(String[] args) {
		/* 숫자를 입력 받아서 배열의 몇번째에 있는지 출력하고 없을경우 없습니다 라고 출력하세요
		 * (0 이면 종료)
		 * 입력값: 11
		 *      11은 2번째에 있어요!
		 * 입력값: 100
		 *      100은 없습니다
		 * 입력값: 0
		 *       종료합니다(프로그램종료)*/

		int [] arrNums= {23,11,55,88,99,77,54,21,32,2,6};
		
		Scanner sc=new Scanner(System.in);
		int inpuntNum;
		
		while(true)
		{
			System.out.print("입력값: ");
			inpuntNum=sc.nextInt();
			
			//break
			if(inpuntNum==0)
			{
				System.out.println("종료합니다");
				break; //while문을 빠져나가면서 종료
			}
			
			boolean find=false; //반복문안에서 찾았을경우 true로 변경해줄것
			
			//배열개수만큼 반복해서 입력한 숫자 찾기
			for(int i=0;i<arrNums.length;i++)
			{
				if(inpuntNum==arrNums[i])
				{
					find=true;
					System.out.println("\t"+(i+1)+"번째에 있어요!");
				}
			}
			
			//배열에 없는경우 find는 여전히 false
			if(!find)
			{
				System.out.println("\t"+inpuntNum+"는 배열에 없습니다");
			}
		}
	}

}












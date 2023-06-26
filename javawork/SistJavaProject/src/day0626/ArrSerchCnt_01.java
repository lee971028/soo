package day0626;

import java.util.Scanner;

public class ArrSerchCnt_01 {

	public static void main(String[] args) {
		/* Q.반복문안에서 실행....성을 입력시 그성씨를 가진사람과 총 인원수 출력..
		 * 종료 라고 하면 프로그램 종료 */

		String [] names= {"김선호","나나","이효리","엄정화","김완선","보아","유재석",
				"하하","김연진","이진"};
		
		Scanner sc=new Scanner(System.in);
		int cnt;
		String serch; //입력할 성
		
		while(true)
		{
			System.out.println("검색할 성을 입력해주세요");
			serch=sc.nextLine();
			
			//종료
			if(serch.equals("종료"))
			{
				System.out.println("종료합니다");
				break;
			}
			
			boolean find=false;
			
			cnt=0;  //검색할때마다 0으로 초기화가 필요함
			
			for(int i=0;i<names.length;i++)
			{
				if(names[i].startsWith(serch))
				{
					cnt++;
					System.out.println(i+":"+names[i]);
					find=true;
				}
			}
			
			if(find)//find==true
				System.out.println("\t총"+cnt+"명 검색");
			else  //!find
				System.out.println(serch+"씨 성을 가진사람은 없습니다");
			
			
		}
		
		
		
		
		
	}

}

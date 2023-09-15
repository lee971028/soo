package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

//score.txt를 읽고 몇개인지 구하고 총점,평균까지 구해서 출력
public class FileExcep_06 {

	public static void scoreRead()
	{
		//변수선언
		String fileName="C:\\sist0615\\file\\score.txt";
		FileReader fr=null;
		BufferedReader br=null;
		int cnt=0; //총갯수
		int total=0;//총합계
		double avg=0; //평균
		
		//파일읽기
		try {
			fr=new FileReader(fileName);
			System.out.println("**파일정상적으로 읽음**");
			
			br=new BufferedReader(fr);
			
			while(true)
			{
				String s=br.readLine();
				//더이상 값이 없으면 종료
				if(s==null)
					break;
				
				cnt++;//읽은갯수
				total+=Integer.parseInt(s); //합계
				System.out.println(s);
				
			}
			System.out.println("----------------------------");
			//평균구하기
			avg=(double)total/cnt;
			System.out.println("총갯수: "+cnt);
			System.out.println("총점: "+total);
			System.out.printf("평균: %.2f\n ",avg);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO: handle exception
		}finally {
			//자원은 오픈한 반대순서로 닫기
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		scoreRead();
		System.out.println("**정상종료**");
	}

}

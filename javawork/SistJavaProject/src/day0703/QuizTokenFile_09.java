package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class QuizTokenFile_09 {

	public static void fileRead()
	{
		String fName="C:\\sist0615\\file\\fruit.txt";
		FileReader fr=null;
		BufferedReader br=null;
		
		
		try {
			fr=new FileReader(fName);
			br=new BufferedReader(fr);
			
			System.out.println("***과일목록 출력***");
			System.out.println("상품\t수량\t가격\t총금액");
			System.out.println("===================================");
			
			while(true)
			{
				String s=br.readLine();
				
				if(s==null)
					break;
				
				/*분리1
				StringTokenizer st=new StringTokenizer(s, ",");
				
				8배열개수만큼 반복출력
				
				String sang=st.nextToken();
				int su=Integer.parseInt(st.nextToken());
				int dan=Integer.parseInt(st.nextToken());
				int total=su*dan;  */
				
				//분리2
				String [] data=s.split(",");
				
				String sang=data[0];
				int su=Integer.parseInt(data[1]);
				int dan=Integer.parseInt(data[2]);
				int total=su*dan;
				
				System.out.println(sang+"\t"+su+"개\t"+dan+"원\t"+total+"원");
			}
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO: handle exception
		}
		
	}
	
	public static void main(String[] args) {
		/* 
		 ***과일목록***
		 상품   수량   단가   총금액
		 -----------------------------
		 바나나  10	5000	50000원
		 */

		fileRead();
		
	}

}

package day0620;

public class ForTest_16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //1.1~5까지 출력하시오
		for(int i=1;i<=5;i++)
		{
			System.out.print(i+"   ");
		}
		
		System.out.println();
		//5,4,3,2,1
		for(int i=5;i>=1;i--)
		{
			System.out.print(i+"   ");
		}
		System.out.println();
		
		//0,2,4,6,8,10
		for(int i=0;i<=10;i+=2)
		{
			System.out.print(i+"   ");
		}
		System.out.println();
		//3,6,9,12,15
		for(int i=3;i<=15;i+=3)
		{
			System.out.print(i+"  ");
		}
		System.out.println();
		/*	I love Java_0
		 	I love Java_1
		 	I love Java_2
		 	I love Java_3
		  */
		for(int i=0;i<=3;i++)
		{
			System.out.println("I Love Java_"+i);
		}
	}

}

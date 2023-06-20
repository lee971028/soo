package day0620;

import java.util.Scanner;

public class IfMaxNum_04 {

	public static void main(String[] args) {
		/*
		 3개의 수 입력
		 5
		 7
		 8
		 ================
		 ***if문
		 가장큰수: 8
		 ***삼항연산자
		 가장큰수: 8
		 
		 */
		
		Scanner sc=new Scanner(System.in);
		
		int x,y,z,max;
		
		System.out.println("3개의 숫자 입력");
		x=sc.nextInt();
		y=sc.nextInt();
		z=sc.nextInt();
		
		System.out.println("입력한 수: "+x+","+y+","+z);
		
		System.out.println("**If문");
		
		if(x>y && x>z)
			max=x;
		else if(y>x && y>z)
			max=y;
		else
			max=z;
		
		System.out.println("가장큰수: "+max);
		
		System.out.println("**조건연산자");
		max=x>y&&x>z?x:y>x&&y>z?y:z;
		System.out.println("가장큰수: "+max);
		
	}

}

package day0616;

public class QuizDataType_10 {

	public static void main(String[] args) {
		/* 매개변수(args)를 이용하여 출력해보세요
		 * [시험결과]
		 * Java=88,Jsp=77,Spring=99
		 * 총점: 264 점
		 * 평균: 88.00 점*/
		
		//1.변수선언&계산
		int java=Integer.parseInt(args[0]);
		int jsp=Integer.parseInt(args[1]);
		int spring=Integer.parseInt(args[2]);
		int count=3; //3과목을 의미하는 변수
		int tot=java+jsp+spring;
		
		double avg1=tot/count; //결과가 무조건 int
		double avg2=(double)tot/count; //결과가 double
		
		//출력
		System.out.printf("java=%d, jsp=%d, spring=%d\n",java,jsp,spring);
		System.out.println("총점: "+tot+"점");
		System.out.printf("평균: %.2f",avg1);
		

	}
	

}

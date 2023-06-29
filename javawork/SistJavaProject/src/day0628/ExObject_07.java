package day0628;

class Score{
	
	private String stuName;
	private int java;
	private int oracle;
	private int html;
	
	 static final String TITLE="중간고사 시험결과";

	//자동 stter,getter
	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getOracle() {
		return oracle;
	}

	public void setOracle(int oracle) {
		this.oracle = oracle;
	}

	public int getHtml() {
		return html;
	}

	public void setHtml(int html) {
		this.html = html;
	}
	 
	//합계메서드
	public int getTot()
	{
		int t=java+oracle+html;
		return t;
	}
	
	//평균메서드
	public double getAvg()
	{
		double a=getTot()/3.0;
		return a;
	}
	 
}

/////////////////////////////////////
public class ExObject_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("***"+Score.TITLE+"***");
		
		//생성1
		Score sc1=new Score();
		
		sc1.setStuName("김지윤");
		sc1.setJava(88);
		sc1.setOracle(77);
		sc1.setHtml(99);
		
		
		System.out.println("학생명: "+sc1.getStuName());
		System.out.println("자바점수: "+sc1.getJava());
		System.out.println("오라클점수: "+sc1.getOracle());
		System.out.println("HTML점수: "+sc1.getHtml());
		System.out.println("합계점수: "+sc1.getTot());
		System.out.println("평균점수: "+sc1.getAvg());
		System.out.println("-------------------------------");
		
		//생성2
		Score sc2=new Score();
		
		sc2.setStuName("김동현");
		sc2.setJava(99);
		sc2.setOracle(45);
		sc2.setHtml(87);
		
		System.out.println("학생명: "+sc2.getStuName());
		System.out.println("자바점수: "+sc2.getJava());
		System.out.println("오라클점수: "+sc2.getOracle());
		System.out.println("HTML점수: "+sc2.getHtml());
		System.out.println("합계점수: "+sc2.getTot());
		System.out.println("평균점수: "+sc2.getAvg());
		System.out.println("-------------------------------");
	}

}

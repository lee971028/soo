package day0628;

class MyPersonInfo{
	
	private String name;
	private String blood;
	private String age;
	
	public MyPersonInfo(String name,String blood,String age) {
		this.name=name;
		this.blood=blood;
		this.age=age;
	}
	
	//제목
	public static void title()
	{
		System.out.println("이름\t혈액형\t나이");
		System.out.println("----------------------------");
	}
	
	
	//출력문
	public void getInfo()
	{
		System.out.println(name+"\t"+blood+"형\t"+age+"세");
	}
}

/////////////////
public class ArrObject_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//생성 초기화
		MyPersonInfo [] my= {
				new MyPersonInfo("이효리", "B", "23"),
				new MyPersonInfo("이상순", "A", "33"),
				new MyPersonInfo("제니", "AB", "35")
		};
		
		System.out.println("총 "+my.length+"명의 정보 출력");
		MyPersonInfo.title();
		
		//출력
		for(MyPersonInfo info:my)
			info.getInfo();
		
		System.out.println("--------------------------");
		
		MyPersonInfo.title();
		
		//for
		for(int i=0;i<my.length;i++)
		{
			my[i].getInfo();
		}
	}

}

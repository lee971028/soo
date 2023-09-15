package day0627;

public class Quiz_09 {

	//변수선언
	static String SHOPNAME="이마트";
	private String sangName;//null
	private int price; //0
		
	//set메서드
	public void setSangName(String name)
	{
		sangName=name;
	}
	
	public void setPrice(int price)
	{
		this.price=price;
	}
	
	//get메서드
	public String getSangName()
	{
		return sangName;
	}
	
	public int getPrice()
	{
		return price;
	}
}

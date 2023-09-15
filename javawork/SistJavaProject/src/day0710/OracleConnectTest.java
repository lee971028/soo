package day0710;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleConnectTest {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	
	public void connectSawon() {
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from sawon order by name";
		
		try {
			conn=DriverManager.getConnection(URL, "angel", "a1234");
			System.out.println("오라클 서버 연결성공!!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) //true값 반환,더이상데이타 없으면 flase
			{
				// db로부터 데이타 가져오기
				int num=rs.getInt("num"); //컬럼명 or 열번호
				String name=rs.getString("name");
				String gender=rs.getString("gender");
				String buseo=rs.getString("buseo");
				int pay=rs.getInt("pay");
				
				System.out.println(num+"\t"+name+"\t"+gender+"\t"+buseo+"\t"+pay);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 서버 연결실패!!!!"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public void connectBamin()
	{
		//주문번호 주문자  음식명  가격  상호명   가게위치  주문자주소
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select f.fno,name,foodname,price,shopname,loc,addr "
				+ "from food f,jumun j "
				+ "where f.fno=j.fno";
				
		
		try {
			conn=DriverManager.getConnection(URL, "angel", "a1234");
			System.out.println("오라클 서버 연결성공!!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("***배민 주문 고객 리스트***");
			System.out.println("주문번호\t주문자명\t음식명\t가격\t상호명\t가게위치\t주문자주소");
			
			while(rs.next()) //true값 반환,더이상데이타 없으면 false
			{
				// db로부터 데이타 가져오기
				int fno=rs.getInt(1); //컬럼명 or 열번호
				String name=rs.getString(2);
				String foodname=rs.getString("foodname");
				int price=rs.getInt("price");
				String shopname=rs.getString("shopname");
				String loc=rs.getString("loc");
				String addr=rs.getString("addr");
				
				System.out.println(fno+"\t"+name+"\t"+foodname+"\t"
				+price+"\t"+shopname+"\t"+loc+"\t"+addr);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 서버 연결실패!!!!"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void connectSawonGroup()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select gender,count(*) cnt, to_char(avg(pay),'L999,999,999') avgpay from sawon group by gender";
		
		try {
			conn=DriverManager.getConnection(URL, "angel", "a1234");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("**성별 인원및 평균급여**");
			System.out.println("성별\t인원수\t평균급여");
			System.out.println("-------------------------------");
			while(rs.next())
			{
				String gender=rs.getString("gender");
				int count=rs.getInt("cnt");
				String avgpay=rs.getString("avgpay");
				
				System.out.println(gender+"\t"+count+"\t"+avgpay);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		OracleConnectTest oc=new OracleConnectTest();
		//oc.connectSawon();
		//oc.connectBamin();
		oc.connectSawonGroup();
	}

}

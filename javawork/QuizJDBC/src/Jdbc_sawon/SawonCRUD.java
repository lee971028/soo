package Jdbc_sawon;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class SawonCRUD {

	DBConnect db=new DBConnect();
	Scanner sc=new Scanner(System.in);
	
	public void addSawon()
	{
		System.out.println("***사원추가하기***");
		
		System.out.println("사원명?");
		String name=sc.nextLine();
		System.out.println("부서명?");
		String buseo=sc.nextLine();
		System.out.println("성별(여자 or 남자)?");
		String gender=sc.nextLine();
		System.out.println("급여?");
		int pay=Integer.parseInt(sc.nextLine());
		
		String sql="insert into sawon values (seq_sawon.nextval,'"+name+"','"+gender+"','"+buseo+"',"+pay+")";
		System.out.println(sql);
		
		//오라클에 연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql); //sql문실행
			
			System.out.println("DB에 추가되었습니다");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	public void writeSawon()
	{
		String sql="select num,name,gender,buseo,to_char(pay,'L999,999,999') pay from sawon";
		
		System.out.println("\t\t[전체사원명단]");
		System.out.println();
		
		System.out.println("시퀀스\t사원명\t성별\t부서명\t월급여");
		System.out.println("-----------------------------------------");
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("name")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("pay"));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
	}
	
	//삭제...사원명을 입력하면 삭제
	public void deleteSawon()
	{
		System.out.println("삭제할 사원명을 입력해주세요");
		String name=sc.nextLine();
		
		String sql="delete from sawon where name='"+name+"'";
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			
			System.out.println(name+"님 삭제됨");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	//수정...시퀀스 입력후 부서,급여만 수정...
	public void updateSawon()
	{
		System.out.println("수정할 사원번호는?");
		int num=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 부서는?");
		String buseo=sc.nextLine();
		System.out.println("수정할 급여는?");
		int pay=Integer.parseInt(sc.nextLine());
		
		String sql="update sawon set buseo='"+buseo+"',pay="+pay+" where num="+num;
		System.out.println(sql);
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			
			System.out.println(num+"사원번호님 수정됨");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
		
	}
	
	//사원명으로 검색..성을 검색하거나 이름끝을 검색하거나..영자라고 쓰면 모든영자 검색되게 합니다
	public void searchName()
	{
		System.out.println("검색할 사원명을 입력해주세요(일부검색도 됨)");
		String name=sc.nextLine();
		
		String sql="select num,name,gender,buseo,to_char(pay,'L999,999,999') pay from sawon "
				+ "where name like '%"+name+"%'";
		
		System.out.println("\t\t[검색사원명단]");
		System.out.println();
		
		System.out.println("시퀀스\t사원명\t성별\t부서명\t월급여");
		System.out.println("-----------------------------------------");
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("name")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("pay"));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//클래스생성
		SawonCRUD sawon=new SawonCRUD();
		//scanner생성
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true)
		{
			System.out.println("Oracle Db_Sawon문제");
			System.out.println("1.insert  2.select  3.update  4.delete  5.사원검색  9.종료");
			
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				sawon.addSawon();
			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
			else if(n==2)
				sawon.writeSawon();
			else if(n==4)
				sawon.deleteSawon();
			else if(n==3)
				sawon.updateSawon();
			else if(n==5)
				sawon.searchName();
		}
	}

}

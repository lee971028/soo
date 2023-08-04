package model.mymall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DBConnect;

public class MallDao {

	DBConnect db=new DBConnect();
	
	//insert
			public void insertMall(MallDto dto)
			{
				Connection conn=null;
				PreparedStatement pstmt=null;
				String sql="insert into mymall values (seq1.nextval,?,?,?,?,sysdate)";

				//db연결
				conn=db.getConnection();
				try {
					pstmt=conn.prepareStatement(sql);
					//바인딩
					pstmt.setString(1, dto.getSangpum());
					pstmt.setString(2, dto.getPhoto());
					pstmt.setInt(3, dto.getPrice());
					pstmt.setString(4, dto.getIpgoday());
					//실행
					pstmt.execute();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(pstmt, conn);
				}
			}
		
			//전체조회
			public List<MallDto> getAllSangpums()
			{
				List<MallDto> list=new Vector<MallDto>();
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql = "select * from mymall order by no asc"; 

				conn=db.getConnection();

				
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next())
					{
						//db에서 값을 가져와서 dto에 담기
						MallDto dto = new MallDto();
						dto.setNo(rs.getString("no"));
						dto.setSangpum(rs.getString("sangpum"));
						dto.setPhoto(rs.getString("photo"));
						dto.setPrice(rs.getInt("price"));
						dto.setIpgoday(rs.getString("ipgoday"));
						dto.setWriteday(rs.getTimestamp("writeday"));

						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(rs, pstmt, conn);
				}

				return list;
			}


			
      //하나의 dto얻기
		public MallDto getSangpum(String no) 
		{
			MallDto dto=new MallDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql = "select * from mymall where no=?"; 
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, no);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					dto.setNo(rs.getString("no"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getInt("price"));
					dto.setIpgoday(rs.getString("ipgoday"));
					dto.setWriteday(rs.getTimestamp("writeday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return dto;
		}
	

		//수정
		public void updateMall(MallDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update mymall set sangpum=?,photo=?,price=?,ipgoday=? where no=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getSangpum());
				pstmt.setString(2, dto.getPhoto());
				pstmt.setInt(3, dto.getPrice());
				pstmt.setString(4, dto.getIpgoday());
				pstmt.setString(5, dto.getNo());
				
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
			
			
		}
}

package spring.mvc.mycar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	private SqlSession session;
	
	String namespace="spring.mvc.mycar.MyCarDao";
	
	public int getTotalCount()
	{
		return session.selectOne(namespace+".getTotalCount");
	}
	
	//insert
	public void insertCar(MyCarDto dto)
	{
		session.insert("insertOfMycar", dto);
	}
	
	//전체목록
	public List<MyCarDto> getAllCars()
	{
		return session.selectList("getAllListOfMyCar");
	}
	
	public void deleteCar(int num)
	{
		session.delete("deleteOfMyCar", num);
	}
	
	public MyCarDto getData(String num)
	{
		return session.selectOne("selectOneOfMyCar", num);
	}
	
	public void updateCar(MyCarDto dto)
	{
		session.update("updateOfMyCar", dto);
	}
}

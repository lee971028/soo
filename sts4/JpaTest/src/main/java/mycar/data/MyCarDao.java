package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao{

	@Autowired
	MyCarDaoInter carDao;

	//전체출력
	public List<MyCarDto> getAllCars()
	{
		//return carDao.findAll();
		return carDao.findAll(Sort.by(Sort.Direction.DESC,"carprice"));//가격 높은순으로 출력
	}

	//갯수 반환
	public Long getTotalCount()
	{
		return carDao.count();
	}
	//추가
	public void insertCar(MyCarDto dto)
	{
		carDao.save(dto);//dto안에 num(Id)값이 있을경우 수정, 없을경우 추가실행
	}

	public MyCarDto getData(Long num)
	{
		return carDao.getReferenceById(num);		
	}

	//수정
	public void updateCar(MyCarDto dto)
	{
		carDao.save(dto);//num 이 포함되어잇으므로 수정됨(writeday제외)
	}

	//삭제
	public void deleteCar(Long num)
	{
		carDao.deleteById(num);
	}
}
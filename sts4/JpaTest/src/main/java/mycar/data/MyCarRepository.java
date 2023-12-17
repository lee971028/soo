package mycar.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MyCarRepository extends JpaRepository<MyCarDto,Long>{
	//@Query: repository에 원한 쿼리를 작성하게 해주는 어노테이션
    //value 속성: 쿼리 작성부
    //nativeQuery: JPA에서 지정한 규칙을 모두 무시할 수 있는 속성
	@Query(value = "select * from mycar order by num desc",nativeQuery = true)
	List<MyCarDto> getAllCars();
	
	@Query(value = "select count(*) from mycar",nativeQuery = true)
	public Long getTotalCount();
	
	@Query(value = "select * from mycar where num=:num",nativeQuery = true)
	public MyCarDto getData(@Param("num") Long num);
}

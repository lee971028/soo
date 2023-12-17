package mycar.data;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MyCarCommentRepository extends JpaRepository<MyCarCommentDto,Integer>{

	@Query(value ="select * from mycar car,mycar_comment comm where car.num=comm.num and car.num=:num"
			,nativeQuery = true)
	public List<Map<String, String>> getMyCarComment(@Param("num") Long num);
}

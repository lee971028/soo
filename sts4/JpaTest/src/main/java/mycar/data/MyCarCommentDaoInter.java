package mycar.data;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MyCarCommentDaoInter extends JpaRepository<MyCarCommentDto, Integer>{

}
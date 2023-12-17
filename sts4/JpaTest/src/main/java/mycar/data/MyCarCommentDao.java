package mycar.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarCommentDao{

	@Autowired
	MyCarCommentDaoInter commentDaoInter;

	//추가
	public void insertComment(MyCarCommentDto dto)
	{
		commentDaoInter.save(dto);//dto안에 num(Id)값이 있을경우 수정, 없을경우 추가실행
	}


}
package spring.mvc.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfCarMember");
	}

	@Override
	public void insertCarMember(CarMemberDto dto) {
		session.insert("insertOfCarMember", dto);
		
	}

	@Override
	public List<CarMemberDto> getAllDatas() {
		// TODO Auto-generated method stub
		return session.selectList("selectAllOfMyCarMember");
	}

}

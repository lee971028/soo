package boot.data.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapper;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapper memMapper;
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		memMapper.insertMember(dto);
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return memMapper.getAllMembers();
	}

	@Override
	public int getSerchId(String id) {
		// TODO Auto-generated method stub
		return memMapper.getSerchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return memMapper.getName(id);
	}

	@Override
	public int loginPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		return memMapper.loginPassCheck(map);
	}

	@Override
	public void deleteMember(int num) {
		// TODO Auto-generated method stub
		memMapper.deleteMember(num);
	}

	

}

package spring.mvc.carmember;

import java.util.List;

public interface CarMemberInter {

	public int getTotalCount();
	public void insertCarMember(CarMemberDto dto);
	public List<CarMemberDto> getAllDatas();
	//getdata
	//update
	//delete
}

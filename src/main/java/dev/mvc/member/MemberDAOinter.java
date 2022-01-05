package dev.mvc.member;

import java.util.List;
import java.util.Map;

public interface MemberDAOinter{ 
	public int IDcheck(String id);
	public int memeber_create(MemberVO member);
	public List<MemberVO> member_list();
	public int login(Map<String, Object> map);
	public MemberVO readbyid(String id);
}

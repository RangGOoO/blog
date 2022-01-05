package dev.mvc.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.member.memberproc")
public class MemberProc implements MemberProcInter{
	
	@Autowired
	private MemberDAOinter memberDAO;

	@Override
	public int IDcheck(String id) {
		int cnt = this.memberDAO.IDcheck(id);
		return cnt;
	}

	@Override
	public int memeber_create(MemberVO member) {
		int cnt = this.memberDAO.memeber_create(member);
		return cnt;
	}

	@Override
	public List<MemberVO> member_list() {
		List<MemberVO> member_list = this.memberDAO.member_list();
		return member_list;
	}

	@Override
	public int login(Map<String, Object> map) {
		int cnt = this.memberDAO.login(map);
		return cnt;
	}

	@Override
	public MemberVO readbyid(String id) {
		MemberVO membervo = this.memberDAO.readbyid(id);
		return membervo;
	}

}

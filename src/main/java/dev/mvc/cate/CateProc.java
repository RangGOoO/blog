package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// Autowired ��ɿ����� �ڵ� �Ҵ�� �� ���Ǵ� �̸�
@Component("dev.mvc.cate.CateProc")
public class CateProc implements CateProcInter {
	@Autowired
	private CateDAOInter cateDAO;


	@Override
	public int create(CateVO catevo) {
		int cnt = cateDAO.create(catevo);
		return cnt;
	}


	@Override
	public List<GRP_CateVO> list_all() {
		List<GRP_CateVO> list = this.cateDAO.list_all();
		return list;
	}


	@Override
	public List<CateVO> list_by_categrpno(int categrpno) {
		List<CateVO> list = this.cateDAO.list_by_categrpno(categrpno);
		return list;
	}


	@Override
	public CateVO read(int cateno) {
		CateVO catevo = this.cateDAO.read(cateno);
		return catevo;
	}


	@Override
	public int update(CateVO catevo) {
		int cnt = this.cateDAO.update(catevo);
		return cnt;
	}


	@Override
	public int delete(int cateno) {
		int cnt = this.cateDAO.delete(cateno);
		return cnt;
	}

}
package dev.mvc.categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// Autowired ��ɿ����� �ڵ� �Ҵ�� �� ���Ǵ� �̸�
@Component("dev.mvc.categrp.CategrpProc")
public class CategrpProc implements CategrpProcInter {
	// DI: ��ü�� �ʿ��� ���� ��ü�� �ڵ����� �����Ͽ� �Ҵ�
	// Autowired: DI ��� ����
	// Spring�� �ڵ����� CategrpDAOInter�� �����Ͽ� DAO class ������ ��ü�� ����� �Ҵ�
	@Autowired
	private CategrpDAOInter categrpDAO;
	// private CategrpDAOInter categrpDAO = new CategrpDAO();

	public CategrpProc() {
		System.out.println("CategrpProc create");
	}

	@Override
	public int create(CategrpVO categrpVO) {
		int cnt = categrpDAO.create(categrpVO);
		return cnt;
	}

	@Override
	public List<CategrpVO> getData() {
		List<CategrpVO> list = null;
		list = this.categrpDAO.getData();
		return list;
	}

	@Override
	public CategrpVO read(int categrpno) {
		CategrpVO categrpVO = this.categrpDAO.read(categrpno);
		return categrpVO;
	}

	@Override
	public int update(CategrpVO categrpVO) {
		int cnt = this.categrpDAO.update(categrpVO);
		return cnt;
	}

	@Override
	public int delete(int categrpno) {
		int cnt = this.categrpDAO.delete(categrpno);
		return cnt;
	}

}
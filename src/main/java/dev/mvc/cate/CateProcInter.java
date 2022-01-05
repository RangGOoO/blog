package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
	/**
	 * ���
	 * 
	 * @param cateVO
	 * @return ��ϵ� ����
	 */
	public int create(CateVO catevo);

	public List<GRP_CateVO> list_all();

	public List<CateVO> list_by_categrpno(int categrpno);

	public CateVO read(int cateno);

	public int update(CateVO catevo);

	public int delete(int cateno);
}
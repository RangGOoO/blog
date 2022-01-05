package dev.mvc.categrp;

import java.util.List;

public interface CategrpProcInter {
	/**
	 * ���
	 * 
	 * @param cateVO
	 * @return ��ϵ� ����
	 */
	public int create(CategrpVO categrpVO);

	public List<CategrpVO> getData();

	public CategrpVO read(int categrpno);

	public int update(CategrpVO categrpVO);
	
	public int delete(int categrpno);
	
}
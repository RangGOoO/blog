package dev.mvc.categrp;

import java.util.List;

public interface CategrpProcInter {
	/**
	 * 등록
	 * 
	 * @param cateVO
	 * @return 등록된 갯수
	 */
	public int create(CategrpVO categrpVO);

	public List<CategrpVO> getData();

	public CategrpVO read(int categrpno);

	public int update(CategrpVO categrpVO);
	
	public int delete(int categrpno);
	
}
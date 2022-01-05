package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
	/**
	 * 등록
	 * 
	 * @param cateVO
	 * @return 등록된 갯수
	 */
	public int create(CateVO catevo);

	public List<GRP_CateVO> list_all();

	public List<CateVO> list_by_categrpno(int categrpno);

	public CateVO read(int cateno);

	public int update(CateVO catevo);

	public int delete(int cateno);
}
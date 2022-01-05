package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentProcinter {
	public int create(ContentVO contentvo);
	public List<ContentVO> list_by_cateno(int cateno);
	public ContentVO read_content(int contentno);
	public int search_count(HashMap<String, Object> hashMap);
	public List<ContentVO> list_by_cateno_paging(HashMap<String, Object> hashMap);
	public int pwd_check(HashMap<String, Object> hashMap);
	public ContentVO update_read(int contentno);
	public int content_update(ContentVO contentvo);
	public int content_delete(int contentno);
	public int update_recom(int contentno);
	public int update_clickcnt(int contentno);
}

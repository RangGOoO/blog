package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.contents.ContentProc")
public class ContentProc implements ContentProcinter {

	@Autowired
	private ContentDAOinter contentDAO;

	public ContentProc() {
		System.out.println("콘텐츠 컨트롤러 생성");
	}

	@Override
	public int create(ContentVO contentvo) {
		int cnt = this.contentDAO.create(contentvo);
		return cnt;
	}

	@Override
	public List<ContentVO> list_by_cateno(int cateno) {
		List<ContentVO> list = this.contentDAO.list_by_cateno(cateno);
		return list;
	}

	@Override
	public ContentVO read_content(int contentno) {
		ContentVO contentvo = this.contentDAO.read_content(contentno);
		String title = contentvo.getTitle();
		String content = contentvo.getContent();
		title = Tool.convertChar(title); // 특수 문자 처리
		content = Tool.convertChar(content);

		contentvo.setTitle(title);
		contentvo.setContent(content);
		return contentvo;
	}

	@Override
	public int search_count(HashMap<String, Object> hashMap) {
		int search_count = this.contentDAO.search_count(hashMap);
		return search_count;
	}

	@Override
	public List<ContentVO> list_by_cateno_paging(HashMap<String, Object> hashMap) {
		List<ContentVO> list = contentDAO.list_by_cateno_paging(hashMap);
		return list;
	}

	@Override
	public int pwd_check(HashMap<String, Object> hashMap) {
		int cnt = this.contentDAO.pwd_check(hashMap);
		return cnt;
	}

	@Override
	public ContentVO update_read(int contentno) {
		ContentVO contentvo = this.contentDAO.read_content(contentno);
		return contentvo;
	}

	@Override
	public int content_update(ContentVO contentvo) {
		int cnt = this.contentDAO.content_update(contentvo);
		return cnt;
	}

	@Override
	public int content_delete(int contentno) {
		int cnt = this.contentDAO.content_delete(contentno);
		return cnt;
	}

	@Override
	public int update_recom(int contentno) {
		int cnt = this.contentDAO.update_recom(contentno);
		return cnt;
	}

	@Override
	public int update_clickcnt(int contentno) {
		int cnt = this.contentDAO.update_clickcnt(contentno);
		return cnt;
	}

}

package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ContentController {
	@Autowired
	@Qualifier("dev.mvc.categrp.CategrpProc")
	private CategrpProcInter categrpProc;

	@Autowired
	@Qualifier("dev.mvc.cate.CateProc")
	private CateProcInter cateProc;

	@Autowired
	@Qualifier("dev.mvc.contents.ContentProc")
	private ContentProcinter contentproc;
	
	private String uploadDir = Paging.getUploadDir(); // 파일 저장 위치

	@RequestMapping(value = "/content/create.do", method = RequestMethod.GET)
	public ModelAndView create(int cateno) {
		ModelAndView mav = new ModelAndView();

		CateVO catevo = cateProc.read(cateno);
		int grpno = catevo.getCategrpno();
		CategrpVO grpvo = categrpProc.read(grpno);

		mav.addObject("catevo", catevo);
		mav.addObject("grpvo", grpvo);
		mav.setViewName("/content/concreate");
		return mav;
	}

	@RequestMapping(value = "/content/create.do", method = RequestMethod.POST)
	public ModelAndView create(HttpServletRequest request, ContentVO contentvo) {
		ModelAndView mav = new ModelAndView();
		String file1 = "";
		String file1saved = "";
		String thumb1 = "";
		String updir = this.uploadDir;
		long size1;

		MultipartFile mf = contentvo.getFile1MF(); // VO에 저장된 파일 이름 가져와서 저장
		file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
		size1 = mf.getSize();

		if (size1 > 0) { // 파일 크기를 확인하여 파일이 존재하는지를 확인
			file1saved = Upload.saveFileSpring(mf, updir);

			if (Tool.isImage(file1saved)) { // 이미지인지 검사
				thumb1 = Tool.preview(updir, file1saved, 200, 150);
			}
		}
		contentvo.setFile1(file1);
		contentvo.setFile1saved(file1saved);
		contentvo.setThumb1(thumb1);
		contentvo.setSize1(size1);

		int cnt = this.contentproc.create(contentvo);
		if (cnt == 1) {
			mav.setViewName("redirect:/content/cateno_search.do?cateno="+contentvo.getCateno());
		}
		return mav;
	}

	@RequestMapping(value = "/content/list_by_cateno", method = RequestMethod.GET)
	public ModelAndView list_by_cateno(int cateno) {
		ModelAndView mav = new ModelAndView();
		CateVO catevo = this.cateProc.read(cateno);
		CategrpVO grpvo = this.categrpProc.read(catevo.getCategrpno());
		List<ContentVO> content_list = this.contentproc.list_by_cateno(cateno);
		mav.addObject("catevo", catevo);
		mav.addObject("content_list", content_list);
		mav.addObject("grpvo", grpvo);

		mav.setViewName("/content/list_by_cateno");
		return mav;
	}

	@RequestMapping(value = "/content/read_content.do", method = RequestMethod.GET)
	public ModelAndView read_content(int contentno) {
		ModelAndView mav = new ModelAndView();
		ContentVO contentvo = this.contentproc.read_content(contentno);
		CateVO catevo = this.cateProc.read(contentvo.getCateno());
		CategrpVO grpvo = this.categrpProc.read(catevo.getCategrpno());
		mav.addObject("contentvo", contentvo);
		mav.addObject("catevo", catevo);
		mav.addObject("grpvo", grpvo);
		mav.setViewName("/content/content");
		return mav;
	}

	@RequestMapping(value = "/content/cateno_search.do", method = RequestMethod.GET)
	public ModelAndView list_by_cateno_search(@RequestParam(value = "cateno", defaultValue = "1") int cateno,
			@RequestParam(value = "word", defaultValue = "") String word,
			@RequestParam(value = "page_num", defaultValue = "1") int page_num,
			@RequestParam(value = "current_page", defaultValue = "0") int current_page) {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> map = new HashMap<String, Object>();
		int end_num = page_num * Paging.RECORD_PER_PAGE;
		int start_num = end_num - (Paging.RECORD_PER_PAGE - 1);

		int start_page_num = current_page * Paging.PAGE_PER_BLOCK + 1;
		int end_page_num;
		
		map.put("cateno", cateno);
		map.put("word", word);

		int search_sount = this.contentproc.search_count(map);

		map.put("start_num", start_num);
		map.put("end_num", end_num);

		List<ContentVO> content_list = contentproc.list_by_cateno_paging(map);
		CateVO catevo = this.cateProc.read(cateno);
		CategrpVO grpvo = this.categrpProc.read(catevo.getCategrpno());

		mav.addObject("grpvo", grpvo);
		mav.addObject("content_list", content_list);
		mav.addObject("catevo", catevo);
		
		if (((int) Math.ceil((double) search_sount / (double) Paging.RECORD_PER_PAGE)) > Paging.PAGE_PER_BLOCK) {
			end_page_num = (start_page_num + Paging.PAGE_PER_BLOCK) - 1;
		} else {
			end_page_num = (int) Math.ceil((double) search_sount / (double) Paging.RECORD_PER_PAGE);
		}
		mav.addObject("start_page_num", start_page_num);
		mav.addObject("end_page_num", end_page_num);

		mav.setViewName("/content/list_by_cateno");

		return mav;
	}

	@RequestMapping(value = "/content/update.do", method = RequestMethod.GET)
	public ModelAndView update(int contentno) {
		ModelAndView mav = new ModelAndView();
		ContentVO contentvo = this.contentproc.update_read(contentno);
		CateVO catevo = this.cateProc.read(contentvo.getCateno());
		CategrpVO grpvo = this.categrpProc.read(catevo.getCategrpno());
		mav.addObject("contentvo", contentvo);
		mav.addObject("catevo", catevo);
		mav.addObject("grpvo", grpvo);
		mav.setViewName("/content/content_update");
		return mav;
	}

	@RequestMapping(value = "/content/update.do", method = RequestMethod.POST)
	public ModelAndView update(ContentVO contentvo) {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("contentno", contentvo.getContentno());
		map.put("passwd", contentvo.getPasswd());

		int cnt = this.contentproc.pwd_check(map);
		
		if (cnt == 1) {
			CateVO catevo = this.cateProc.read(contentvo.getCateno());
			CategrpVO grpvo = this.categrpProc.read(catevo.getCategrpno());
			this.contentproc.content_update(contentvo);
			mav.addObject("catevo", catevo);
			mav.addObject("grpvo", grpvo);
			mav.setViewName("redirect:/content/cateno_search.do?cateno=" + contentvo.getCateno());
		} else {
			mav.addObject("code", "pwd_fail");
			mav.setViewName("redirect:/categrp/msg.do");
		}
		return mav;
	}

	@RequestMapping(value = "/content/delete.do", method = RequestMethod.GET)
	public ModelAndView delete_get(int contentno) {
		ModelAndView mav = new ModelAndView();
		ContentVO contentvo = this.contentproc.update_read(contentno);
		mav.addObject("contentvo", contentvo);
		mav.setViewName("/content/delete_page");
		return mav;
	}

	@RequestMapping(value = "/content/delete.do", method = RequestMethod.POST)
	public ModelAndView delete_post(ContentVO contentvo) {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> map = new HashMap<String, Object>();

		ContentVO contentVO = this.contentproc.read_content(contentvo.getContentno());

		map.put("contentno", contentvo.getContentno());
		map.put("passwd", contentvo.getPasswd());

		int cnt = this.contentproc.pwd_check(map);

		if (cnt == 1) {
			if (contentVO.getFile1saved().isBlank()) {
				int delete = this.contentproc.content_delete(contentvo.getContentno());
			} else {
				String file1saved = contentVO.getFile1saved();
				String thumb1 = contentVO.getThumb1();
				long size1 = 0;
				boolean sw = false;
				String updir = this.uploadDir;
				sw = Tool.deleteFile(updir, file1saved); // Folder에서 1건의 파일 삭제
				sw = Tool.deleteFile(updir, thumb1);	
				int delete = this.contentproc.content_delete(contentvo.getContentno());
			}
			mav.setViewName("redirect:/content/cateno_search.do?cateno=" + contentVO.getCateno());
		} else {
			System.out.println("삭제 불가");
			mav.addObject("cdoe", "delete_fail");
			mav.setViewName("/categrp/msg.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/content/update_recom.do", method = RequestMethod.GET)
	@ResponseBody
	public String recom_update(int contentno) {
		int cnt = this.contentproc.update_recom(contentno);
		int recom = this.contentproc.read_content(contentno).getRecomcnt();
		
		JSONObject json = new JSONObject();
		json.put("recom", recom);
		return json.toString();
	}
	
	@RequestMapping(value = "/content/update_clicknt.do", method = RequestMethod.GET)
	@ResponseBody
	public void click_update(int contentno) {
		this.contentproc.update_clickcnt(contentno);
	}
}

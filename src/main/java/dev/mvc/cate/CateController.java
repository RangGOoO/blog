package dev.mvc.cate;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.categrp.CategrpVO;
import dev.mvc.categrp.CategrpProcInter;

@Controller
public class CateController {

	@Autowired
	@Qualifier("dev.mvc.categrp.CategrpProc")
	private CategrpProcInter categrpProc;

	@Autowired
	@Qualifier("dev.mvc.cate.CateProc")
	private CateProcInter cateProc;

	@RequestMapping(value = "/cate/catecreate.do", method = RequestMethod.GET)
	public ModelAndView create(int categrpno) {
		ModelAndView mav = new ModelAndView();
		CategrpVO grpvo = this.categrpProc.read(categrpno);	
		mav.addObject("grpvo", grpvo);
		mav.setViewName("cate/catecreate");
		return mav;
	}

	@RequestMapping(value = "/cate/catecreate.do", method = RequestMethod.POST)
	public ModelAndView create(CateVO catevo) {
		ModelAndView mav = new ModelAndView();
		int cnt = this.cateProc.create(catevo);
		if (cnt == 1) {
			mav.setViewName("redirect:/cate/list_by_categrpno.do?categrpno="+catevo.getCategrpno());		
		} else {
			System.out.println("��� ����");
		}
		return mav;
	}

	@RequestMapping(value = "/cate/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all() {
		ModelAndView mav = new ModelAndView();
		List<GRP_CateVO> list = this.cateProc.list_all();
		System.out.println(list);
		mav.addObject("cate_list", list);
		mav.setViewName("cate/list_all");
		return mav;
	}

	@RequestMapping(value = "/cate/list_by_categrpno.do", method = RequestMethod.GET)
	public ModelAndView list_by_categrpno(int categrpno) {
		ModelAndView mav = new ModelAndView();
		CategrpVO grpvo = this.categrpProc.read(categrpno);
		List<CateVO> cate_list = this.cateProc.list_by_categrpno(categrpno);
		mav.addObject("grpvo", grpvo);
		mav.addObject("catelist", cate_list);
		mav.setViewName("cate/list_by_grpno");
		return mav;
	}

	@RequestMapping(value = "/cate/update.do", method = RequestMethod.GET)
	public ModelAndView updateGET(int cateno) {
		ModelAndView mav = new ModelAndView();
		CateVO catevo = this.cateProc.read(cateno);

		int categrpno = catevo.getCategrpno();

		List<CateVO> list = this.cateProc.list_by_categrpno(categrpno);
		CategrpVO categrpvo = this.categrpProc.read(categrpno);
		mav.addObject("catelist", list);
		mav.addObject("catevo", catevo);
		mav.addObject("categrpvo", categrpvo);
		mav.setViewName("/cate/cateupdate");
		return mav;
	}

	@RequestMapping(value = "/cate/update.do", method = RequestMethod.POST)
	public ModelAndView updatePOST(CateVO catevo) {
		ModelAndView mav = new ModelAndView();
		int cnt = this.cateProc.update(catevo);
		if (cnt == 1) {
			mav.addObject("categrpno", catevo.getCategrpno());
			mav.setViewName("redirect:/cate/list_by_categrpno.do?categrpno="+catevo.getCategrpno());
		}
		return mav;
	}
	@RequestMapping(value = "/cate/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(int cateno) {
		ModelAndView mav = new ModelAndView();
		CateVO catevo = this.cateProc.read(cateno);
		int cnt = this.cateProc.delete(cateno);
		if (cnt == 1) {
			mav.addObject("categrpno", catevo.getCategrpno());
			mav.setViewName("redirect:/cate/list_by_categrpno.do?categrpno="+catevo.getCategrpno());
		}
		return mav;
	}
}

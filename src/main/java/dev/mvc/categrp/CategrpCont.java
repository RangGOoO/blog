package dev.mvc.categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategrpCont {
	@Autowired
	@Qualifier("dev.mvc.categrp.CategrpProc")
	private CategrpProcInter categrpProc;

	public CategrpCont() {
		System.out.println("-> CategrpCont created.");
	}

	// http://localhost:9091/categrp/create.do
	/**
	 * ��� ��
	 * 
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping(value = "/categrp/grpcreate.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/categrp/grpcreate"); // webapp/WEB-INF/views/categrp/create.jsp
		return mav; // forward
	}

	// http://localhost:9091/categrp/create.do
	/**
	 * ��� ó��
	 * 
	 * @param categrpVO
	 * @return
	 */
	@RequestMapping(value = "/categrp/grpcreate.do", method = RequestMethod.POST)
	public ModelAndView create(CategrpVO categrpVO) { // categrpVO �ڵ� ����, Form -> VO
		// CategrpVO categrpVO <FORM> �±��� ������ �ڵ� ������.
		// request.setAttribute("categrpVO", categrpVO); �ڵ� ����
		ModelAndView mav = new ModelAndView();
		int cnt = this.categrpProc.create(categrpVO); // ��� ó��
		if (cnt == 1) {
			System.out.println("��� ����");
			mav.setViewName("redirect:/categrp/grplist.do");

		} else {
			System.out.println("��� ����");
		}
		return mav; // forward
	}
	
	@ResponseBody
	@RequestMapping(value = "/categrp/grplist.do", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<CategrpVO> list = this.categrpProc.getData();
		mav.addObject("list", list); // request.setAttribute("list", list);
		mav.setViewName("/categrp/grplist"); // /webapp/WEB-INF/views/categrp/list.jsp
		return mav;
	}

	@RequestMapping(value = "/categrp/read.do", method = RequestMethod.GET)
	public ModelAndView read(int categrpno) {
		ModelAndView mav = new ModelAndView();
		CategrpVO categrpVO = this.categrpProc.read(categrpno);
		mav.addObject("categrpVO", categrpVO);
		List<CategrpVO> list = this.categrpProc.getData();
		mav.addObject("list", list);
		mav.setViewName("/categrp/read");
		return mav;
	}

	@RequestMapping(value = "/categrp/update.do", method = RequestMethod.POST)
	public ModelAndView update(CategrpVO categrpVO) {
		ModelAndView mav = new ModelAndView();
		int cnt = this.categrpProc.update(categrpVO);
		List<CategrpVO> list = this.categrpProc.getData();
		mav.addObject("list", list);
		if (cnt == 1) {
			mav.setViewName("/categrp/grplist");
		} else {
			mav.addObject("code", "update_fail");
			mav.setViewName("/categrp/msg");
		}
		return mav;
	}

	@RequestMapping(value = "/categrp/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(int categrpno) {
		ModelAndView mav = new ModelAndView();
		CategrpVO categrpVO = this.categrpProc.read(categrpno);
		mav.addObject("categrpVO", categrpVO);

		int cnt = this.categrpProc.delete(categrpno);
		mav.addObject("cnt", cnt);

		if (cnt == 1) {
			List<CategrpVO> list = this.categrpProc.getData();
			mav.addObject("list", list);
			mav.setViewName("/categrp/grplist");
		} else {
			mav.addObject("code", "delete_fail");
			mav.setViewName("/categrp/msg");
		}
		return mav;
	}

	@RequestMapping(value = "/categrp/msg.do", method = RequestMethod.GET)
	public ModelAndView msg(String url) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName(url); // forward

		return mav; // forward
	}
}
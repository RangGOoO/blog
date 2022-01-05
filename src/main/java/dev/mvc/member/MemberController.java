package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("dev.mvc.member.memberproc")
	private MemberProcInter memberproc;
	
	@RequestMapping(value = "/member/signup.do", method = RequestMethod.GET)
	public ModelAndView membercreate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/singup");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkID.do", method = RequestMethod.GET)
	public String checkID(String id) {
		int cnt = this.memberproc.IDcheck(id);
		JSONObject json = new JSONObject();
		json.put("cnt", cnt);
		return json.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public ModelAndView create_member(MemberVO membervo) {
		ModelAndView mav = new ModelAndView();
		int cnt= this.memberproc.memeber_create(membervo);
		if(cnt == 1) {
			mav.addObject("code", "member_create");
		}
		mav.addObject("url", "/menu/msg");
		mav.setViewName("redirect:/menu/msg.do");
		return mav;
	}
	
	@RequestMapping(value = "/member/member_list.do", method = RequestMethod.GET)
	public ModelAndView member_list() {
		ModelAndView mav = new ModelAndView();
		List<MemberVO> member_list = this.memberproc.member_list();
		mav.addObject("member_list", member_list);
		mav.setViewName("/member/member_list");
		return mav;
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login_ajax(HttpSession session, String id, String passwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("passwd",passwd);
		int cnt = this.memberproc.login(map);
		JSONObject json = new JSONObject();
		if(cnt == 1) {
			MemberVO membervo = this.memberproc.readbyid(id);
			session.setAttribute("memberno", membervo.getMEMBERNO());
			session.setAttribute("id", id);
			session.setAttribute("name", membervo.getName());
		}
		json.put("cnt", cnt);
		
		return json.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		JSONObject json = new JSONObject();
		session.invalidate();
		json.put("url", "/");
		return json.toString();
	}
}

package dev.mvc.index;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;


@Controller
public class IndexController {
	
	@Autowired
	@Qualifier("dev.mvc.categrp.CategrpProc")
	private CategrpProcInter categrpProc;
	
	@Autowired
	@Qualifier("dev.mvc.cate.CateProc")
	private CateProcInter cateProc;
	
// http://localhost:9091
	@RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/index");  // /WEB-INF/views/index.jsp
	    return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "index_load.do", method = RequestMethod.GET)
	private String load_grpname() {
		JSONArray json_list = new JSONArray();
		List<CategrpVO> list = this.categrpProc.getData();
		for (CategrpVO grp : list) {
			JSONObject json = new JSONObject();
			json.put("name", grp.getCatename());
			json.put("id", grp.getCategrpno());
			json_list.put(json);
		}
		return json_list.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "cate_load.do", method = RequestMethod.GET)
	private String load_cate(int id) {
		JSONArray json_list = new JSONArray();
		List<CateVO> list = this.cateProc.list_by_categrpno(id);
		for (CateVO cate : list) {
			JSONObject json = new JSONObject();
			json.put("name", cate.getName());
			json.put("id", cate.getCateno());
			json_list.put(json);
		}
		return json_list.toString();
	}
	@RequestMapping(value = "/menu/msg.do", method = RequestMethod.GET)
	private ModelAndView msg(String url) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value = "/management.do", method = RequestMethod.GET)
	private ModelAndView management() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/menu/management");
		return mav;
	}
}
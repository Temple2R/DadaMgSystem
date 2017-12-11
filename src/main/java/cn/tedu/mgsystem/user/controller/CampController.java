package cn.tedu.mgsystem.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.tedu.mgsystem.common.web.JsonResult;
import cn.tedu.mgsystem.user.entity.TrainingCamp;
import cn.tedu.mgsystem.user.service.impl.CampServiceImpl;

@Controller
public class CampController {
	@Autowired
	private CampServiceImpl campService;
	@RequestMapping("/findCamp.do")
	@ResponseBody
	public JsonResult findCamp(){
		System.out.println("找到了很多训练营！");
		List<TrainingCamp> list=campService.findAll();
		return new JsonResult(list);
	}
	@RequestMapping("/toAddCamp.do")
	public String toAddCamp(HttpServletRequest request){
		if(request.getAttribute("camp")!=null)
			request.removeAttribute("camp");
		System.out.println("添加训练营到了！");
		return "jsp/add-training-camp";
	}
	@RequestMapping(value="/toChgCamp.do",produces="text/html;charset:utf-8")
	public String changeCamp(TrainingCamp camp){
		System.out.println("这里是修改或者添加训练营界面！");
		if(camp.getId()==null){
			int id=campService.insertTrainingCamp(camp);
			System.out.println("我这里插入了一条数据："+id);
			}else{
			int id=campService.updateTrainingCamp(camp);
			System.out.println(id);
			}
			return "jsp/index";
	}
	@RequestMapping("/findIdCamp.do")
	public ModelAndView findStaffById(HttpServletRequest request){
		Integer id=Integer.parseInt(request.getParameter("id"));
		System.out.println("修改的训练营id："+id);
		TrainingCamp getCamp=campService.findTrainingCampByid(id);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("jsp/add-training-camp");
		mv.addObject("camp",getCamp);
		System.out.println(getCamp);
		return mv;
	}
	@RequestMapping("/toDelCamp.do")
	public String delCamp(int id){
		System.out.println("要删除的训练营id："+id);
		int index=campService.deleteTrainingCamp(id);
		System.out.println("受影响的行数："+index);
		return "jsp/index";
	}
}

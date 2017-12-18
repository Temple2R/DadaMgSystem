package cn.tedu.mgsystem.teacher.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.tedu.mgsystem.common.web.JsonResult;
import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.entity.Seat;
import cn.tedu.mgsystem.teacher.service.ICadetService;
import cn.tedu.mgsystem.teacher.service.ISeatService;

@Controller
public class TeacherController {
	@Autowired
	private ISeatService seatService;
	@Autowired
	private ICadetService cadetService;
	@RequestMapping("/toCamp.do")
	public String toCamp(){
		System.out.println("我来到这里了！");
		return "jsp/student-detail";
	}
	@RequestMapping("/tofindSeat.do")
	@ResponseBody
	public JsonResult findSeat(int id){
		System.out.println("拿到当前训练营id："+id);
		List<Seat>seat=seatService.findSeatById(id);
		System.out.println(seat);
		return new JsonResult(seat);
	}
	@RequestMapping("/findCadetById.do")
	@ResponseBody
	public JsonResult findCadetById(Integer cadetId,HttpServletRequest request){
		System.out.println("得到的学员id是："+cadetId);
		Cadet cadet=cadetService.findCadetById(cadetId);
		return new JsonResult(cadet);
	}
	@RequestMapping("/toInsertCadet.do")
	@ResponseBody
	public JsonResult InsertCadet(Cadet cadet,int trainingCampId){
		cadetService.insertCadet(cadet);
		int cadetId=cadet.getId();
		System.out.println("记录一下学员的id+"+cadetId);
		seatService.insertSeat(cadet, trainingCampId);		
		System.out.println("拿到了学生！"+cadet);
		return new JsonResult();
	}
	@RequestMapping("/toChangeCadet.do")
	@ResponseBody
	public JsonResult ChangeCadet(Cadet cadet,int trainingCampId){
		System.out.println("我要修改这个学生:"+cadet);
		cadetService.updateCadet(cadet);
		seatService.updateSeat(cadet, trainingCampId);
		return new JsonResult();
	}
	@RequestMapping("/toDelCadet.do")
	@ResponseBody
	public JsonResult dalCadet(int id,int trainingCampId){
		cadetService.deleteCadet(id);
		seatService.deleteSeatByCadetId(id,trainingCampId);
		return new JsonResult();
	}
	
}

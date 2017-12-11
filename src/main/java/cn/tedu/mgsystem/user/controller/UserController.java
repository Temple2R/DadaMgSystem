package cn.tedu.mgsystem.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.tedu.mgsystem.common.web.JsonResult;
import cn.tedu.mgsystem.user.entity.User;
import cn.tedu.mgsystem.user.service.IUserService;

@Controller
public class UserController {
	@Autowired
	private IUserService userService;
	@RequestMapping("/toUserMge.do")
	public String toUserMge(){
		System.out.println("司机，我要去用户管理界面！");
		return "jsp/user-manager";
	}
	@RequestMapping("/findTeacher.do")
	@ResponseBody
	public JsonResult findTeacher(){
		List<User>list=userService.findAllTeacher();
		System.out.println("找到的老师有："+list);
		return new JsonResult(list);
	}
	@RequestMapping("/toAddStaff.do")
	public String toAddStaff(HttpServletRequest request){
		System.out.println("添加用户界面");
		if(request.getAttribute("staff")!=null)
			request.removeAttribute("staff");
		return "jsp/edit-staff";
	}
	@RequestMapping(value="/toChgStaff.do",produces="text/html;charset:utf-8")
	public String changeStaff(User user){
		if(user.getId()==null){
		int id=userService.insertUser(user);
		System.out.println("我这里插入了一条数据："+id);
		}else{
		User udUser=userService.UpdateUser(user);
		System.out.println(udUser);
		}
		return "jsp/user-manager";
	}
	@RequestMapping("/tofindStaffById.do")
	public ModelAndView findStaffById(int id){
		System.out.println("修改的老师id："+id);
		User getUser=userService.findById(id);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("jsp/edit-staff");
		mv.addObject("staff",getUser);
		System.out.println(getUser);
		return mv;
	}
	@RequestMapping("/toDelStaff.do")
	public String delStaff(int id){
		System.out.println("要删除老师的id:"+id);
		userService.deleteUser(id);
		return "jsp/user-manager";
	}
	@RequestMapping("/batchDelStaff.do")
	@ResponseBody
	public JsonResult batchDelStaff(String checkedIds){
		System.out.println("拿到了这些checkedIds:"+checkedIds);
		userService.batchDelUser(checkedIds);
		return new JsonResult();
	}
	/**修改密码*/
	@RequestMapping("/tochangePwd.do")
	public String changePwd(){
		return "jsp/modify-password";
	}
	/**真的修改密码了*/
	@RequestMapping("/realChange.do")
	@ResponseBody
	public JsonResult RealChange(String oldPwd,String newPwd,int id){
		System.out.println(oldPwd+","+newPwd+","+id);
		userService.doChangePwd(oldPwd, newPwd, id);
		return new JsonResult();
	}
	@RequestMapping("/doFindPageObjects.do")
	@ResponseBody
	public JsonResult doFindPageObject(Integer pageCurrent){
		Map<String,Object>map=userService.findPageUsers(pageCurrent);
			return new JsonResult(map);
	}
}

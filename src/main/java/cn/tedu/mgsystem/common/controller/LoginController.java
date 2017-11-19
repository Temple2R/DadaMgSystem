package cn.tedu.mgsystem.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.mgsystem.common.service.LoginService;
import cn.tedu.mgsystem.common.web.JsonResult;
import cn.tedu.mgsystem.user.entity.User;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@RequestMapping("/toTest.do")
	public String toTest(){
		return "test/test";
	}
	@RequestMapping("/toLogin.do")
	public String toLogin(){
		System.out.println("进入到这里来了");
		return "jsp/login";
	}
	/**登录操作*/
	@RequestMapping("/login.do")
	@ResponseBody
	public JsonResult login(String account,String password
			,HttpServletRequest request){
		System.out.println(account+"/"+password);
		User user=loginService.login(account, password);
		HttpSession session=request.getSession();
		session.setAttribute("user", user);
		System.out.println(user);
	    return new JsonResult(user);
	}
	/**登陆成功，进入主页*/
	@RequestMapping("/index.do")
	public String toIndex(){
		return "jsp/index";
	}
	/**退出登陆*/
	@RequestMapping("/logOut.do")
	public String logOut(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "redirect:toLogin.do";
	}
	/**
	 * 这是一个异常处理方法(用来处理其他方法所抛出的异常)
	 * e:是其它方法抛出的异常
	 */
	@ExceptionHandler
	@ResponseBody
	public JsonResult handle(Exception e){
		//其他异常
		return new JsonResult(e);
	}
}

package cn.tedu.mgsystem.common.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tedu.mgsystem.common.exception.ServiceException;
import cn.tedu.mgsystem.common.service.LoginService;
import cn.tedu.mgsystem.user.dao.UserDao;
import cn.tedu.mgsystem.user.entity.User;
@Service
public class LoginServiceImpl implements LoginService{
	@Resource
	private UserDao dao;
	public User login(String username, String password) {
		User user=null; 
		user=dao.findByAccount(username);
		if(user==null){
			throw new  ServiceException("用户不存在！");
		}
		if(!user.getPassword().equals(password)){
			throw new  ServiceException("密码不对！");
		}
		return user;
	}
	
}

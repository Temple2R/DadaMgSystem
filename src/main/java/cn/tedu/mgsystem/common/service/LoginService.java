package cn.tedu.mgsystem.common.service;

import java.util.Map;

import cn.tedu.mgsystem.user.entity.User;

public interface LoginService {
	User login(String username,String password);
}

package cn.tedu.mgsystem.user.service;

import java.util.List;
import java.util.Map;

import cn.tedu.mgsystem.user.entity.User;

public interface IUserService {
	public User checkLogin(String username,String pwd);
	public List<User> findAllTeacher();
	public User UpdateUser(User user);
	public int insertUser(User user);
	public User findById(Integer id);
	public int deleteUser(Integer id);
	/**批量删除*/
	public void batchDelUser(String checkedIds);
	/**修改密码*/
	public void doChangePwd(String oldPwd,String newPwd,int id);
	/**分页查询*/
	Map<String,Object> findPageUsers(Integer pageCurrent);
}

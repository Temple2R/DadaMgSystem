package cn.tedu.mgsystem.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import cn.tedu.mgsystem.common.exception.ServiceException;
import cn.tedu.mgsystem.common.web.PageObject;
import cn.tedu.mgsystem.user.dao.UserDao;
import cn.tedu.mgsystem.user.entity.User;
import cn.tedu.mgsystem.user.service.IUserService;
@Service
public class UserServiceImpl implements IUserService{
		@Resource(name="userDao")
		private UserDao dao;
		/**登陆验证*/
		public User checkLogin(String username, String pwd) {
			User user=null;
			user=dao.findByAccount(username);
			if(user==null){
				throw new ServiceException("用户不存在！");
			}
			if(!user.getPassword().equals(pwd)){
				throw new ServiceException("密码错误！");
			}
			return user;
		}
		/*
		查询所有讲师
		 */
		public List<User> findAllLectuer() {
			return  dao.findAllLectuer();
		}
		/*查询所有老师*/
		@Override
		public List<User> findAllTeacher() {
			return  dao.findAllTeacher();
		}
		/**修改员工*/
		@Override
		public User UpdateUser(User user) {
			int i=dao.updateUser(user);
			if(i!=0){
				user=dao.findById(user.getId());
			}
			return user;
		}
		/**根据id查找员工*/
		@Override
		public User findById(Integer id) {
			return dao.findById(id);
		}
		/**添加员工*/
		@Override
		public int insertUser(User user) {
			return dao.insertUser(user);
		}
		/**删除员工*/
		@Override
		public int deleteUser(Integer id) {
			return dao.deleteUser(id);
		}
		@Override
		public void batchDelUser(String checkedIds) {
			if(StringUtils.isEmpty(checkedIds))
				throw new ServiceException("请先选择！");
			String[] ids=checkedIds.split(",");
			int rows=dao.batchDelUser(ids);
			if(rows<=0)
				throw new ServiceException("更新失败！");
		}
		@Override
		public void doChangePwd(String oldPwd,String newPwd,int id) {
			User user=dao.findById(id);
			if(user.getPassword().equals(oldPwd)){
				user.setPassword(newPwd);
				dao.updateUser(user);
			}else{
				throw new ServiceException("密码错误！"); 
			}
		}
		@Override
		public Map<String, Object> findPageUsers(Integer pageCurrent) {
			if(pageCurrent==null||pageCurrent<1)
				throw new ServiceException("参数值无效！");
			int pageSize=2;
			int startIndex=(pageCurrent-1)*pageSize;
			List<User>list=dao.findPageUsers(startIndex, pageSize, "createdTime");
			int rowCount=dao.getRowCount();
			PageObject pageObject=new PageObject();
			pageObject.setRowCount(rowCount);
			pageObject.setPageSize(pageSize);
			pageObject.setPageCurrent(pageCurrent);
			pageObject.setStartIndex(startIndex);//可选
			Map<String,Object>map=new HashMap<String,Object>();
			map.put("list", list);
			map.put("pageObject", pageObject);
			return map;
		}

	@Override
	public String findPhoneByAccount(String account) {
		return dao.findPhoneByAccount(account);
	}
}

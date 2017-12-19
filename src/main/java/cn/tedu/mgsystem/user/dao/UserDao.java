package cn.tedu.mgsystem.user.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.tedu.mgsystem.user.entity.User;

@Repository
public interface UserDao {
	public String findPhoneByAccount(String account);
	public User findByAccount(String account);
	public List<User> findAllTeacher();
//	public List<String> findUserPermissions(Integer userId);--保留
	public String findPositionById(Integer userId);
	/**新增用户*/
	public int insertUser(@Param("user") User user);
	/**删除用户*/
	public int deleteUser(Integer id);
	/**批量删除用户*/
	public int batchDelUser(@Param("ids") String[] ids);
	/**修改用户*/
	public int updateUser(@Param("user") User user);
	/**根据id查找该用户*/
	public User findById(Integer id);
	/**分页查询*/
	public List<User> findPageUsers(
			@Param("startIndex")int startIndex,
			@Param("pageSize")int  pageSize,
			@Param("orderBy")String orderBy
			);
	/**获取表中记录的总行数,我们要根据这个结果计算总页数*/
	int getRowCount();
}

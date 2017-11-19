package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.mgsystem.common.web.PageObject;
import cn.tedu.mgsystem.user.dao.TrainingCampDao;
import cn.tedu.mgsystem.user.dao.UserDao;
import cn.tedu.mgsystem.user.entity.User;
import cn.tedu.mgsystem.user.service.IUserService;

public class TestUserDao {
	ClassPathXmlApplicationContext ctx;
	
	TrainingCampDao trainingCampDao;
	
	@Before
	public void init(){
		ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-mvc.xml");
		trainingCampDao=ctx.getBean(TrainingCampDao.class);
	}
	@Test
	public void test1(){
		UserDao dao=ctx.getBean(UserDao.class);
		User u=dao.findById(2);
		System.out.println(u);
	}
	
	@Test
	public void test2(){
		UserDao dao=ctx.getBean(UserDao.class);
		User user=new User();
		user.setName("黄小东");
		user.setSex("男");
		user.setAccount("templee");
		user.setPassword("123456");
		user.setPosition("讲师");
		user.setSkillDirection("java技术总监");
		user.setDeptno("洗水部");
		user.setEnumber(110);
		user.setState(1);
		user.setUserPhone("1110");
		user.setEmail("1@1.com");
		int temp=dao.insertUser(user);
		System.out.println(temp);
	}
	
	
	@Test
	public void test3(){
		UserDao dao=ctx.getBean(UserDao.class);
		int temp =dao.deleteUser(7);
		System.out.println(temp);
	}
	
	@Test
	public void test4(){
		UserDao dao=ctx.getBean(UserDao.class);
		User user=dao.findByAccount("yellowkai");
		user.setName("杜浦？？");
		int temp=dao.updateUser(user);
		System.out.println(temp);
	}
	
	@Test
	public void test5(){
		UserDao dao=ctx.getBean(UserDao.class);
		String info=dao.findPositionById(1);
		System.out.println(info);
	}
	@Test
	public void test6(){
		UserDao dao=ctx.getBean(UserDao.class);
		List<User> list=dao.findAllTeacher();
		System.out.println(list);
	}
	@Test
	public void test7(){
		IUserService userService=ctx.getBean(IUserService.class);
		Map<String,Object>map=userService.findPageUsers(1);
		List<User>list=(List<User>) map.get("list");
		PageObject page=(PageObject) map.get("pageObject");
		System.out.println(list);
		System.out.println(page);
	}
}

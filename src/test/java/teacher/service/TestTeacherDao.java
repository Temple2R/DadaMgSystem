package teacher.service;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.mgsystem.teacher.dao.CadetDao;
import cn.tedu.mgsystem.teacher.entity.Cadet;

public class TestTeacherDao {
	ClassPathXmlApplicationContext ctx;
	CadetDao dao;
	@Before
	public void init(){
		ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
		dao=ctx.getBean(CadetDao.class);
	}
	@After
	public void destory(){
		ctx.close();
	}
	@Test
	public void test1(){
		Cadet c=new Cadet();
		c.setType("A");
		c.setSeatNumber(1);
		c.setName("xiaoming");
		c.setConTeacher("老师好");
		c.setEducational("本科");
		c.setProfession("软件工程");
		c.setIsbasics(1);
		c.setSource("别人介绍的");
		c.setInfo("有基础但不是很厉害！");
		c.setLearntime(new Date());
		c.setStage("第一阶段");
//		c.setCreatedUser("你好");
//		c.setModifyUser("你好");
		System.out.println(dao.insertCadet(c));
		System.out.println(c.getId());
	}
	@Test
	public void test2(){
		System.out.println(dao.findCadetById(1));
	}
	@Test 
	public void test3(){
		Cadet c=dao.findCadetById(1);
		c.setSource("什么东西啊！");
		dao.updateCadet(c);
		System.out.println(dao.findCadetById(1));
	}
	@Test
	public void test4(){
		System.out.println(dao.deleteCadet(1));
	}
}

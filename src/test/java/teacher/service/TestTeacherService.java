package teacher.service;

import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.mgsystem.teacher.dao.SeatDao;
import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.entity.Seat;
import cn.tedu.mgsystem.teacher.service.ICadetService;
import cn.tedu.mgsystem.teacher.service.ISeatService;
import cn.tedu.mgsystem.teacher.service.impl.CadetServiceImpl;
import cn.tedu.mgsystem.teacher.service.impl.SeatServiceImpl;

public class TestTeacherService {
	ClassPathXmlApplicationContext ctx;
	SeatDao dao;
	ICadetService cadetService;
	ISeatService seatService;
	
	@Before
	public void init(){
		ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-mvc.xml");
		dao=ctx.getBean(SeatDao.class);
		cadetService=ctx.getBean(CadetServiceImpl.class);
		seatService=ctx.getBean(SeatServiceImpl.class);
	}
	
	@Test
	public void test1(){
		List<Seat> seat=dao.findSeatByCampId(1);
		System.out.println(seat);
	}
	
	@Test
	public void test2(){
		Seat seat=new Seat();
		seat.setTrainingCampId(5);
		seat.setSeatNumber(1);
		seat.setCadetId(1);
		seat.setCadetName("小明");
		seat.setSeatState(1);
		seat.setCreatedTeacher("admin");
		System.out.println(seat);
		int temp=dao.insertSeat(seat);
		System.out.println(temp);
	}
	
	@Test
	public void test3(){
		int temp=dao.deleteSeatByCadetId(1);
		System.out.println(temp);
	}
	
	@Test
	public void test4(){
		List<Seat> seat=dao.findSeatByCampId(5);
		System.out.println(seat);
	}
	@Test
	public void test5(){
		Cadet c=new Cadet();
		c.setType("A");
		c.setSeatNumber(1);
		c.setName("xiaoming");
		c.setConTeacher("老师好");
		c.setEducational("本科");
		c.setProfession("软件工程");
		c.setIsbasics("1");
		c.setSource("别人介绍的");
		c.setInfo("有基础但不是很厉害！");
		c.setLearntime(new Date());
		c.setStage("第一阶段");
		cadetService.insertCadet(c);
		System.out.println(c.getId());
	}
	@Test
	//测试绑定座位信息
	public void test6(){
		Cadet c=new Cadet();
		c.setType("A");
		c.setSeatNumber(1);
		c.setName("xiaoming");
		c.setConTeacher("老师好");
		c.setEducational("本科");
		int d=seatService.insertSeat(c, 10);
		System.out.println(d);
	}
	@After
	public void destory(){
		ctx.close();
	}
	
}


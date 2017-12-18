package cn.tedu.mgsystem.teacher.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.tedu.mgsystem.common.exception.ServiceException;
import cn.tedu.mgsystem.teacher.dao.SeatDao;
import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.entity.Seat;
import cn.tedu.mgsystem.teacher.service.ISeatService;
import cn.tedu.mgsystem.user.dao.TrainingCampDao;
import cn.tedu.mgsystem.user.entity.TrainingCamp;
@Transactional(rollbackFor=ServiceException.class)
@Service
public class SeatServiceImpl implements ISeatService{
	@Autowired
	private SeatDao dao;
	@Autowired
	private TrainingCampDao Tdao;
	@Transactional(readOnly=true)
	@Override
	public List<Seat> findSeatById(Integer id) {
		return dao.findSeatByCampId(id);
	}
	@Transactional(propagation=Propagation.REQUIRED,
			isolation=Isolation.REPEATABLE_READ,
			rollbackFor=ServiceException.class)
	@Override
	public Integer insertSeat(Cadet cadet,int trainingCampId) {
		Seat seat=new Seat();
		seat.setTrainingCampId(trainingCampId);
		seat.setCadetId(cadet.getId());
		seat.setSeatNumber(cadet.getSeatNumber());
		seat.setCadetName(cadet.getName());
		//训练营人数+1
		TrainingCamp camp= Tdao.findTrainingCampByid(trainingCampId);
		camp.setCadetNumber(camp.getCadetNumber()+1);//班级人数
		Tdao.updateTrainingCamp(camp);
		return dao.insertSeat(seat);
	}
	@Transactional(propagation=Propagation.REQUIRED,
			isolation=Isolation.REPEATABLE_READ,
			rollbackFor=ServiceException.class)
	@Override
	public Integer deleteSeat(Integer id) {
		if(id==null) 
			throw new ServiceException("没有这个座位！");
		return dao.deleteSeatByCadetId(id);
	}
	@Transactional(propagation=Propagation.REQUIRED,
			isolation=Isolation.REPEATABLE_READ,
			rollbackFor=ServiceException.class)
	@Override
	public Integer updateSeat(Cadet cadet,int trainingCampId) {
		Seat seat=new Seat();
		seat.setTrainingCampId(trainingCampId);
		seat.setCadetId(cadet.getId());
		seat.setSeatNumber(cadet.getSeatNumber());
		seat.setCadetName(cadet.getName());
		return dao.updateSeat(seat);
	}
	@Transactional(propagation=Propagation.REQUIRED,
			isolation=Isolation.REPEATABLE_READ,
			rollbackFor=ServiceException.class)
	@Override
	public Integer deleteSeatByCadetId(Integer id,Integer trainingCampId) {
		if(id==null) 
			throw new ServiceException("不存在这个学生！");
		//训练营人数-1
		  TrainingCamp camp= Tdao.findTrainingCampByid(trainingCampId);
		  int number=camp.getCadetNumber()-1;
		  if(number<0) number=0;
		  camp.setCadetNumber(number);//班级人数
		  Tdao.updateTrainingCamp(camp);
		return dao.deleteSeatByCadetId(id);
	}

}

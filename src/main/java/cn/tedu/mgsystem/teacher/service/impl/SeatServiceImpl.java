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
@Transactional(rollbackFor=ServiceException.class)
@Service
public class SeatServiceImpl implements ISeatService{
	@Autowired
	private SeatDao dao;
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
	public Integer updateSeat(Seat seat) {
		if(seat==null) 
			throw new ServiceException("座位不存在！");
		return dao.updateSeat(seat);
	}
	@Transactional(propagation=Propagation.REQUIRED,
			isolation=Isolation.REPEATABLE_READ,
			rollbackFor=ServiceException.class)
	@Override
	public Integer deleteSeatByCadetId(Integer id) {
		if(id==null) 
			throw new ServiceException("不存在这个学生！");
		return dao.deleteSeatByCadetId(id);
	}

}

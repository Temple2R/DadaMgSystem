package cn.tedu.mgsystem.teacher.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mgsystem.teacher.dao.SeatDao;
import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.entity.Seat;
import cn.tedu.mgsystem.teacher.service.ISeatService;
@Service
public class SeatServiceImpl implements ISeatService{
	@Autowired
	private SeatDao dao;
	@Override
	public List<Seat> findSeatById(Integer id) {
		
		return dao.findSeatByCampId(id);
	}

	@Override
	public Integer insertSeat(Cadet cadet,int trainingCampId) {
		Seat seat=new Seat();
		seat.setTrainingCampId(trainingCampId);
		seat.setCadetId(cadet.getId());
		seat.setSeatNumber(cadet.getSeatNumber());
		seat.setCadetName(cadet.getName());
		return dao.insertSeat(seat);
	}

	@Override
	public Integer deleteSeat(Integer id) {
		return dao.deleteSeatByCadetId(id);
	}

	@Override
	public Integer updateSeat(Seat seat) {
		return dao.updateSeat(seat);
	}

	@Override
	public Integer deleteSeatByCadetId(Integer id) {
		
		return dao.deleteSeatByCadetId(id);
	}

}

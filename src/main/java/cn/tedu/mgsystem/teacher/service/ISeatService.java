package cn.tedu.mgsystem.teacher.service;

import java.util.List;

import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.entity.Seat;

public interface ISeatService {
	public List<Seat> findSeatById(Integer id);
	public Integer insertSeat(Cadet cadet,int trainingCampId);
	public Integer updateSeat(Cadet cadet,int trainingCampId);
	public Integer deleteSeat(Integer id);
	public Integer deleteSeatByCadetId(Integer id);
}

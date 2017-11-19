package cn.tedu.mgsystem.teacher.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tedu.mgsystem.teacher.entity.Seat;

public interface SeatDao {
	/**查找座位*/
	public List<Seat> findSeatByCampId(Integer id);
	/**添加座位信息*/
	public int insertSeat(@Param("seat") Seat seat);
	/**删除座位信息*/
	public int deleteSeatByCadetId(Integer id);
	public int deleteSeatById(Integer id);
	/**修改座位信息*/
	public int updateSeat(@Param("seat") Seat seat);
	
}	

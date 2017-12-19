package cn.tedu.mgsystem.user.service.impl;

import java.util.List;

import cn.tedu.mgsystem.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mgsystem.user.dao.TrainingCampDao;
import cn.tedu.mgsystem.user.entity.TrainingCamp;
import cn.tedu.mgsystem.user.service.ICampService;
@Service
public class CampServiceImpl implements ICampService{
	@Autowired
	TrainingCampDao dao;
	@Autowired
	UserDao Udao;
	/**
	 * 查询所有的训练营
	 */
	public List<TrainingCamp> findAll(){
		return dao.findAll();
	}
	@Override
	public TrainingCamp findTrainingCampByClassNumber(Integer number) {
		return dao.findTrainingCampByClassNumber(number);
	}
	@Override
	public int updateTrainingCamp(TrainingCamp camp) {
		String teacher=camp.getTeacherName();
		String phone=Udao.findPhoneByAccount(teacher);
		if(phone!=null){
			camp.setTeacherPhone(phone);
		}
		return dao.updateTrainingCamp(camp);
	}
	@Override
	public int deleteTrainingCamp(Integer id) {
		
		return dao.deleteTrainingCamp(id);
	}
	@Override
	public int insertTrainingCamp(TrainingCamp camp) {
		String teacher=camp.getTeacherName();
		String phone=Udao.findPhoneByAccount(teacher);
		if(phone!=null){
			camp.setTeacherPhone(phone);
		}
		return dao.insertTrainingCamp(camp);
	}
	/**根据id查找对应的训练营*/
	@Override
	public TrainingCamp findTrainingCampByid(Integer id) {
		
		return dao.findTrainingCampByid(id);
	}
}

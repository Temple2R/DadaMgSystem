package cn.tedu.mgsystem.user.service;

import java.util.List;

import cn.tedu.mgsystem.user.entity.TrainingCamp;

public interface ICampService {
	public List<TrainingCamp> findAll();
	public TrainingCamp findTrainingCampByClassNumber(Integer number);
	public int updateTrainingCamp(TrainingCamp camp);
	public int deleteTrainingCamp(Integer id);
	public int insertTrainingCamp(TrainingCamp camp);
	public TrainingCamp findTrainingCampByid(Integer id);
}

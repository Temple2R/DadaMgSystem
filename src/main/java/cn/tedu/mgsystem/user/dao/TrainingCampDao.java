package cn.tedu.mgsystem.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tedu.mgsystem.user.entity.TrainingCamp;

public interface TrainingCampDao {
	/**查询所有训练营*/
	public List<TrainingCamp> findAll();
	/***/
	public TrainingCamp findTrainingCampByid(Integer id);
	/**增加训练营*/
	public int insertTrainingCamp(@Param("TrainingCamp") TrainingCamp TrainingCamp);
	
	/**查找训练营*/
	public TrainingCamp findTrainingCampByClassNumber(Integer classroomNumber);
	
	/**删除训练营*/
	public int deleteTrainingCamp(Integer id);
	
	/**修改训练营*/
	public int updateTrainingCamp(@Param("TrainingCamp") TrainingCamp TrainingCamp);
	
	
}

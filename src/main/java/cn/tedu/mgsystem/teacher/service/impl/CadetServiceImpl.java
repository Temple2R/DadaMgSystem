package cn.tedu.mgsystem.teacher.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.mgsystem.teacher.dao.CadetDao;
import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.service.ICadetService;
import cn.tedu.mgsystem.user.dao.TrainingCampDao;
@Service
public class CadetServiceImpl implements ICadetService{
	@Autowired
	private CadetDao dao;
	@Override
	public Cadet findCadetById(Integer id) {
		return dao.findCadetById(id);
	}
	/**
	 * 添加学员
	 */
	@Override
	public Cadet insertCadet(Cadet cadet) {
		dao.insertCadet(cadet);
		return cadet;
	}

	@Override
	public int deleteCadet(Integer id) {
		return dao.deleteCadet(id);
	}

	@Override
	public int updateCadet(Cadet cadet) {
		return dao.updateCadet(cadet);
	}

}

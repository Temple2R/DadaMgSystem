package cn.tedu.mgsystem.teacher.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.tedu.mgsystem.common.exception.ServiceException;
import cn.tedu.mgsystem.teacher.dao.CadetDao;
import cn.tedu.mgsystem.teacher.entity.Cadet;
import cn.tedu.mgsystem.teacher.service.ICadetService;
@Transactional(rollbackFor=ServiceException.class)
@Service
public class CadetServiceImpl implements ICadetService{
	@Autowired
	private CadetDao dao;
	@Transactional(readOnly=true)
	@Override
	public Cadet findCadetById(Integer id) {
		return dao.findCadetById(id);
	}
	/**
	 * 添加学员
	 */
	@Override
	public Cadet insertCadet(Cadet cadet) {
		if(cadet==null) 
			throw new ServiceException("不能添加空的学生！");
		dao.insertCadet(cadet);
		return cadet;
	}
	
	@Override
	public int deleteCadet(Integer id) {
		if(id==null) 
			throw new ServiceException("该学生已经不存在了！");
		return dao.deleteCadet(id);
	}
	
	@Override
	public int updateCadet(Cadet cadet) {
		if(cadet==null) 
			throw new ServiceException("不存在这样的学生！");
		return dao.updateCadet(cadet);
	}

}

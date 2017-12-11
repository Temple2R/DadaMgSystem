package cn.tedu.mgsystem.teacher.service;

import cn.tedu.mgsystem.teacher.entity.Cadet;

public interface ICadetService {
	public Cadet findCadetById(Integer id);
	public Cadet insertCadet(Cadet cadet);
	public int deleteCadet(Integer id);
	public int updateCadet(Cadet cadet);
}

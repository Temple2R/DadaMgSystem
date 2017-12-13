package cn.tedu.mgsystem.teacher.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.tedu.mgsystem.common.web.JsonDateTypeConvert;
/***
 * 学员
 * @author McGrady
 *
 */
public class Cadet implements Serializable{
	private static final long serialVersionUID = 7319828687383291098L;
	private int id;
	private String type;//学员类型
	private Integer seatNumber;//座位编号
	private String name;//姓名
	private String conTeacher;//咨询师
	private String educational;//教育水平
	private String profession;//专业
	private String isbasics;//是否有基础
	private String source;//信息来源
	private String info;//面资信息
	private Date learntime;//学习时长
	private String stage;//阶段
	private String createdUser;//创建者
	private String modifyUser;//修改者
	private Date createdTime;//创建时间
	private Date modifyTime;//修改时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getConTeacher() {
		return conTeacher;
	}
	public void setConTeacher(String conTeacher) {
		this.conTeacher = conTeacher;
	}
	public String getEducational() {
		return educational;
	}
	public void setEducational(String educational) {
		this.educational = educational;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getIsbasics() {
		return isbasics;
	}
	public void setIsbasics(String isbasics) {
		this.isbasics = isbasics;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getLearntime() {
		return learntime;
	}
	public void setLearntime(Date learntime) {
		this.learntime = learntime;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public String getCreatedUser() {
		return createdUser;
	}
	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}
	public String getModifyUser() {
		return modifyUser;
	}
	public void setModifyUser(String modifiyUser) {
		this.modifyUser = modifiyUser;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifiyTime) {
		this.modifyTime = modifiyTime;
	}
	@Override
	public String toString() {
		return "Cadet [id=" + id + ", type=" + type + ", seatNumber=" + seatNumber + ", name=" + name + ", conTeacher="
				+ conTeacher + ", educational=" + educational + ", profession=" + profession + ", isbasics=" + isbasics
				+ ", source=" + source + ", info=" + info + ", learntime=" + learntime + ", stage=" + stage
				+ ", createdUser=" + createdUser + ", modifyUser=" + modifyUser + ", createdTime=" + createdTime
				+ ", modifyTime=" + modifyTime + "]";
	}
	
	
	
	
	
}

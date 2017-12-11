package cn.tedu.mgsystem.teacher.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.tedu.mgsystem.common.web.JsonDateTypeConvert;

/**
 * 座位
 * @author Temple
 *
 */
public class Seat implements Serializable{
	private static final long serialVersionUID = -1475228047614569697L;
	private Integer id;//保留字段
	private Integer trainingCampId;//训练营id
	private Integer seatNumber;//座位编号
	private Integer cadetId;//学员ID
	private String  cadetName;//学员姓名
	private Integer seatState;//座位状态
	private String createdTeacher;//创建者
	private String modifyTeacher;//修改者
	private Date createdTime;//创建时间
	private Date modifyTime;//修改时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCadetName() {
		return cadetName;
	}
	public void setCadetName(String cadetName) {
		this.cadetName = cadetName;
	}
	public Integer getTrainingCampId() {
		return trainingCampId;
	}
	public void setTrainingCampId(Integer trainingCampId) {
		this.trainingCampId = trainingCampId;
	}
	public Integer getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	public String getCreatedTeacher() {
		return createdTeacher;
	}
	public void setCreatedTeacher(String createdTeacher) {
		this.createdTeacher = createdTeacher;
	}
	public String getModifyTeacher() {
		return modifyTeacher;
	}
	public void setModifyTeacher(String modifiyTeacher) {
		this.modifyTeacher = modifiyTeacher;
	}
	public Integer getCadetId() {
		return cadetId;
	}
	public void setCadetId(Integer cadetId) {
		this.cadetId = cadetId;
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
	public Integer getSeatState() {
		return seatState;
	}
	public void setSeatState(Integer seatState) {
		this.seatState = seatState;
	}
	@Override
	public String toString() {
		return "Seat [id=" + id + ", trainingCampId=" + trainingCampId + ", seatNumber=" + seatNumber
				+ ", createdTeacher=" + createdTeacher + ", modifiyTeacher=" + modifyTeacher + ", cadetId=" + cadetId
				+ ", createdTime=" + createdTime + ", modifiyTime=" + modifyTime + ", seatState=" + seatState + "]";
	}
	
	
}

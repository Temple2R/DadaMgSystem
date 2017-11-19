package cn.tedu.mgsystem.user.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.tedu.mgsystem.common.web.JsonDateTypeConvert;
/***
 * 训练营
 * @author McGrady
 *
 */
public class TrainingCamp implements Serializable{
	private static final long serialVersionUID = -4771220395631901145L;
	private Integer id;
	private Integer state;//进行状态
	private Integer classroomNumber;//教室编号
	private String teacherName;//老师名字
	private String teacherPhone;//老师电话----这个保留、待定
	private String productLine;//产品线
	private String classType;//类型
	private Integer cadetNumber;//班级人数
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String createdUser;//创建者
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String modifyUser;//修改者
	private Date createdTime;//创建时间
	private Date modifyTime;//修改时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getClassroomNumber() {
		return classroomNumber;
	}
	public void setClassroomNumber(Integer classroomNumber) {
		this.classroomNumber = classroomNumber;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherPhone() {
		return teacherPhone;
	}
	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}
	public String getProductLine() {
		return productLine;
	}
	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}
	
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public Integer getCadetNumber() {
		return cadetNumber;
	}
	public void setCadetNumber(Integer cadetNumber) {
		this.cadetNumber = cadetNumber;
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
	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
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
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	@Override
	public String toString() {
		return "TrainingCamp [id=" + id + ", state=" + state + ", classroomNumber=" + classroomNumber + ", teacherName="
				+ teacherName + ", teacherPhone=" + teacherPhone + ", productLine=" + productLine + ", classType="
				+ classType + ", cadetNumber=" + cadetNumber + ", createdUser=" + createdUser + ", modifyUser="
				+ modifyUser + ", createdTime=" + createdTime + ", modifyTime=" + modifyTime + "]";
	}
}

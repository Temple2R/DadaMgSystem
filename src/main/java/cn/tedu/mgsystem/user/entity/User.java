package cn.tedu.mgsystem.user.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import cn.tedu.mgsystem.common.web.JsonDateTypeConvert;

public class User implements Serializable{
	private static final long serialVersionUID = 2724107637071215634L;
	private Integer id;
	private String account;//用户名
	private String password;//密码
	private String name;//名字
	private String sex;//性别
	private Integer enumber;//员工号
	private Integer state;//保留字段
	private String skillDirection;//技术方向
	private String ip;//保留字段
	private String deptno;//部门
	private String position;//职位
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+08:00")
	private Date entryTime;//入职时间
	private Date loginTime;//登陆时间
	private String email;//邮箱
	private String userPhone;//电话---保留
	private Date createdTime;//创建时间
	private Date modifiyTime;//修改时间
	private String createdUser;//创建用户
	private String modifyUser;//修改用户
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getEnumber() {
		return enumber;
	}
	public void setEnumber(Integer enumber) {
		this.enumber = enumber;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getSkillDirection() {
		return skillDirection;
	}
	public void setSkillDirection(String skillDirection) {
		this.skillDirection = skillDirection;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	@JsonSerialize(using=JsonDateTypeConvert.class)
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getModifiyTime() {
		return modifiyTime;
	}
	public void setModifiyTime(Date modifiyTime) {
		this.modifiyTime = modifiyTime;
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
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", password=" + password + ", name=" + name + ", sex=" + sex
				+ ", enumber=" + enumber + ", state=" + state + ", skillDirection=" + skillDirection + ", ip=" + ip
				+ ", deptno=" + deptno + ", position=" + position + ", entryTime=" + entryTime + ", loginTime="
				+ loginTime + ", email=" + email + ", userPhone=" + userPhone + ", createdTime=" + createdTime
				+ ", modifiyTime=" + modifiyTime + ", createdUser=" + createdUser + ", modifyUser=" + modifyUser + "]";
	}
	
	
	
}

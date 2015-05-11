package com.luckyion.pojo;

import java.io.Serializable;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userid;
	private String username;
	private String userpassword;
	private String userphone;
	private String userrealname;
	private String usersex;
	private String email;
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="userid", nullable=false)
	public String getUserid() {
		return userid;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserrealname(String userrealname) {
		this.userrealname = userrealname;
	}
	public String getUserrealname() {
		return userrealname;
	}
	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}
	public String getUsersex() {
		return usersex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}

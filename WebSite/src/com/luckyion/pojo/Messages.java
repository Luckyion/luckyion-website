package com.luckyion.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Messages  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6931628031649631456L;
	
	private int id;
	/**
	 * M0动态；M1心情；M2展望；M3留言；M4许愿
	 */
	private String msgtype;//消息类别
	private String topic;//主题
	private String msgurl;//链接
	private String content;//内容
	private String distime;//时间
	private String disname;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMsgtype() {
		return msgtype;
	}
	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDistime() {
		return distime;
	}
	public void setDistime(String distime) {
		this.distime = distime;
	}
	public String getDisname() {
		return disname;
	}
	public void setDisname(String disname) {
		this.disname = disname;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getMsgurl() {
		return msgurl;
	}
	public void setMsgurl(String msgurl) {
		this.msgurl = msgurl;
	}

}

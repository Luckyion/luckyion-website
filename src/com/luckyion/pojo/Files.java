package com.luckyion.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Files implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileid;
	private String filename;
	private String filepath;
	private String fileformat;
	/**
	 * 0：未选择
	 * 1:左侧画廊
	 * 2：中间画廊
	 * 3：娱乐和游戏
	 * 4：学生时代
	 * 5：心情日记
	 * 6：时光轴
	 * 7：自由贴
	 */
	private String ftype;
	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="fileid", nullable=false)
	public String getFileid() {
		return fileid;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFileformat(String fileformat) {
		this.fileformat = fileformat;
	}
	public String getFileformat() {
		return fileformat;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	

}

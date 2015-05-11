package com.luckyion.action;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.luckyion.pojo.Files;
import com.luckyion.service.FileManagerService;
import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5133724847799089778L;
	
	private Files files;
	private FileManagerService filesManagerService;
	private String fileName;
	
	
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public InputStream getTargetFile(){
		System.err.println("getDownloadFile is called." + fileName);
		System.err.println(fileName + "__" + fileName);
		return ServletActionContext.getServletContext()
				.getResourceAsStream(fileName);
	}

	public Files getFiles() {
		return files;
	}

	public void setFiles(Files files) {
		this.files = files;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public FileManagerService getFilesManagerService() {
		return filesManagerService;
	}

	public void setFilesManagerService(FileManagerService filesManagerService) {
		this.filesManagerService = filesManagerService;
	}

}

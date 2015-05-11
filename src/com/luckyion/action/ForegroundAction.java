package com.luckyion.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;

import com.googlecode.jsonplugin.annotations.JSON;
import com.luckyion.pojo.Files;
import com.luckyion.pojo.Messages;
import com.luckyion.service.FileManagerService;
import com.luckyion.service.MessagesService;
import com.luckyion.util.FormatTime;
import com.luckyion.util.Hex;
import com.luckyion.util.MyLogger;
import com.mysql.jdbc.log.Log;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.log.Logger;

public class ForegroundAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1546008412949449496L;
	
	private final String TAG = "ForegroundAction";
	
	private Messages messages;
	private MessagesService messagesService;
	private List<Messages> listMessages;
	private Files files;
	private FileManagerService fileManagerService;
	private List<Files> listFiles;
	private int val;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		listMessages = messagesService.find("from Messages m where m.msgtype='M1' order by m.id desc");//心情寄语
		if(listMessages.size() != 0){
			messages = listMessages.get(0);
		}
		return SUCCESS;
	}
	
	/**
	 * 获取资源文件下载列表。
	 * @return
	 */
	public String downloadResources(){
		listFiles = fileManagerService.find("from Files f where f.ftype='8' order by f.id desc");
		return SUCCESS;
	}
	
	/**
	 * 删除留言
	 * @return
	 */
	public String delLeaveMsg(){
		messages = (Messages) messagesService.findById(Messages.class, messages.getId());
		if(messages != null){
			messagesService.delete(messages);
		}
		return "delMessage";
	}
	
	/**
	 * 获取所有的愿望
	 * @return
	 */
	public String allVows(){
		System.err.println("getAllVows method is called.");
		listMessages = messagesService.find("from Messages m where m.msgtype='M4' order by m.id desc");
		return SUCCESS;
	}
	
	/**
	 * 获取所有的信息
	 * @return
	 */
	public String allMessages(){
		System.err.println("getAllMessages method is called.");
		listMessages = messagesService.find("from Messages");
		return SUCCESS;
	}
	
	/**
	 * 保存留言
	 * @return
	 */
	public String saveLeaveMsg(){
		try {
			byte[] b = Hex.hexStringToByte(messages.getContent());
			
			String contentString = new String(b, "gbk");
			MyLogger.log(TAG + contentString);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MyLogger.log(TAG + messages.getDistime() + messages.getContent());
		messages.setDistime(FormatTime.getTime(0));
		messages.setMsgtype("M3");
		messages.setMsgurl("foreAction!getLeaveMsg.action");
		messages.setTopic("来自" + messages.getDisname() + "留言");
		messagesService.save(messages);
		return SUCCESS;
	}
	
	public String saveVowMsg(){
		messages.setDistime(FormatTime.getTime(0));
		messages.setMsgtype("M4");
		messages.setMsgurl("foreAction!getVowMsg.action");
		messages.setTopic("来自" + messages.getDisname() + "愿望");
		messagesService.save(messages);
		return SUCCESS;
	}
	
	/**
	 * 加载动态
	 * @return
	 */
	public String loadNews(){
		listMessages = messagesService.find("from Messages m where m.msgtype='M0' order by m.id desc");//动态
		return SUCCESS;
	}
	/**
	 * 加载学生时代照片
	 * @return
	 */
	public String loadStuTimes(){
		setListFiles(fileManagerService.find("from Files f where f.ftype='4' order by f.fileid desc"));
		return SUCCESS;
	}
	/**
	 * 加载生活照片
	 * @return
	 */
	public String loadLifeTimes(){
		listFiles = fileManagerService.find("from Files f where f.ftype='5' order by f.fileid desc");
		return SUCCESS;
	}
	/**
	 * 加载时光轴照片
	 * @return
	 */
	public String loadTinyTimes() {
		listFiles = fileManagerService.find("from Files f where f.ftype='6' order by f.fileid desc");
		return SUCCESS;
	}
	/**
	 * 加载自由贴图片
	 * @return
	 */
	public String loadFreedom(){
		if(val == 0){//学生时代
			listFiles = fileManagerService.find("from Files f where f.ftype='4' order by f.fileid desc");
		}else 
		if(val == 1){
			listFiles = fileManagerService.find("from Files f where f.ftype='5' order by f.fileid desc");
		}else
		if(val == 2){
			listFiles = fileManagerService.find("from Files f where f.ftype='6' order by f.fileid desc");
		}else{
			listFiles = fileManagerService.find("from Files f where f.ftype='7' order by f.fileid desc");
		}		
		return "free";
	}
	/**
	 * 加载娱乐和游戏图片
	 * @return
	 */
	public String loadGames() {
		listFiles = fileManagerService.find("from Files f where f.ftype='3' order by f.fileid desc");
		return SUCCESS;
	}
	
	public Messages getMessages() {
		return messages;
	}
	public void setMessages(Messages messages) {
		this.messages = messages;
	}
	public MessagesService getMessagesService() {
		return messagesService;
	}
	public void setMessagesService(MessagesService messagesService) {
		this.messagesService = messagesService;
	}
	public List<Messages> getListMessages() {
		return listMessages;
	}
	public void setListMessages(List<Messages> listMessages) {
		this.listMessages = listMessages;
	}
	@JSON(serialize=false)
	public Files getFiles() {
		return files;
	}
	public void setFiles(Files files) {
		this.files = files;
	}
	@JSON(serialize=false)
	public FileManagerService getFileManagerService() {
		return fileManagerService;
	}
	public void setFileManagerService(FileManagerService fileManagerService) {
		this.fileManagerService = fileManagerService;
	}
	public List<Files> getListFiles() {
		return listFiles;
	}
	public void setListFiles(List<Files> listFiles) {
		this.listFiles = listFiles;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	
	

}

package com.luckyion.action;

import java.util.List;

import com.luckyion.pojo.Messages;
import com.luckyion.service.MessagesService;
import com.luckyion.util.FormatTime;
import com.luckyion.util.MyLogger;
import com.opensymphony.xwork2.ActionSupport;

public class MessageDistribute extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -83754683415273496L;
	
	private final String TAG = "MessageDistribute";
	
	private String content;
	private String type;
	private Messages messages;
	private MessagesService messagesService;
	private List<Messages> listMessages;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return list();
	}
	
	public String list() {
		listMessages = messagesService.find("from Messages");
		for(Messages messages :  listMessages){
			MyLogger.log(TAG + messages.getTopic());
		}
		return "ok";
	}
	/**
	 * 发布跳转
	 * @return
	 */
	public String editMessage(){
		MyLogger.log(TAG + messages.getId());
		messages = (Messages)messagesService.findById(Messages.class, messages.getId());	
		MyLogger.log(TAG + messages.getContent());
		return "edit";
	}
	
	
	/**
	 * ���淢����Ϣ
	 * @return
	 */
	public String saveMessage(){
		MyLogger.log(TAG + "_msg:" + messages.getContent() + messages.getMsgtype() + 
				messages.getTopic());
		messages.setDistime(FormatTime.getTime(0));
		messages.setDisname("Holder");
		messages.setMsgurl("foreAction!detailsMsg.action?msgtype=" + messages.getMsgtype() + 
				"&distime=" + messages.getDistime());
		messagesService.save(messages);
		return list();
		
	}
	/**
	 * ɾ����Ϣ
	 * @return
	 */
	public String deleteMessage(){
		messages = (Messages) messagesService.findById(Messages.class, messages.getId());
		if(messages != null){
			messagesService.delete(messages);
		}				
		return list();
	}
	/**
	 * ���·�����Ϣ
	 * @return
	 */
	public String updateMessage(){
		messagesService.findById(messages, messages.getId());
		messagesService.update(messages);
		return list();
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	

}

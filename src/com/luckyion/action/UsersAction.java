package com.luckyion.action;

import java.util.List;

import com.googlecode.jsonplugin.annotations.JSON;
import com.luckyion.pojo.Users;
import com.luckyion.service.UsersService;
import com.luckyion.util.MyLogger;
import com.opensymphony.xwork2.ActionSupport;

public class UsersAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3170513569438202252L;
	
	MyLogger log = new MyLogger();
	private final String TAG = "UsersAction";
	private Users users;
	private UsersService usersService;
	@JSON(serialize=false)
	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	private List<Users> uList;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("execute()");
		uList = usersService.find("from Users");
		return "search";
	}
	/**��ѯ�û�**/
	public String findUser(){
		
		return "find";
	}
	/**��ѯ���ݿ��Ƿ�������*/
	public String findByName(){
		log.testLog(TAG, "find method.");
		uList = (List)usersService.find("from Users where username= '" + users.getUsername() + "'");
		if(uList.size() != 0){
			return ERROR;
		}		
		return SUCCESS;
	}
	/**����û���Ϣ**/
	public String save(){
		usersService.save(users);
		uList = usersService.find("from Users");
		return "search";
	}
	/**�޸��û�**/
	public String editUser(){
		users = (Users)usersService.findById(Users.class, users.getUserid());
		return "edit";
	}
	/**�����û�**/
	public String updateUser(){
		usersService.update(users);
		uList = usersService.find("from Users");
		return "search";
	}
	/***����û�**/
	public String addUser(){		
		return "add";
	}
	/**ɾ���û�*/
	public String delUser(){
		MyLogger.testLog(TAG, "delUser:" + users.getUserid());
		users = (Users)usersService.findById(Users.class, users.getUserid());
		usersService.delete(users);
		uList = usersService.find("from Users");
		return "del";
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public List<Users> getuList() {
		return uList;
	}

	public void setuList(List<Users> uList) {
		this.uList = uList;
	}
	

}

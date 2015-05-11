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
	/**查询用户**/
	public String findUser(){
		
		return "find";
	}
	/**查询数据库是否有数据*/
	public String findByName(){
		log.testLog(TAG, "find method.");
		uList = (List)usersService.find("from Users where username= '" + users.getUsername() + "'");
		if(uList.size() != 0){
			return ERROR;
		}		
		return SUCCESS;
	}
	/**添加用户信息**/
	public String save(){
		usersService.save(users);
		uList = usersService.find("from Users");
		return "search";
	}
	/**修改用户**/
	public String editUser(){
		users = (Users)usersService.findById(Users.class, users.getUserid());
		return "edit";
	}
	/**更新用户**/
	public String updateUser(){
		usersService.update(users);
		uList = usersService.find("from Users");
		return "search";
	}
	/***添加用户**/
	public String addUser(){		
		return "add";
	}
	/**删除用户*/
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

package com.luckyion.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.luckyion.pojo.Users;
import com.luckyion.service.UsersService;
import com.luckyion.util.MyLogger;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

//鐢ㄦ埛鐧诲綍
public class LoginAction extends ActionSupport implements SessionAware
{	
	private Users users;
	private Map session;
	private UsersService usersService;
	private MyLogger log = new MyLogger();
	private final String TAG = "LoginAction";
	
	public String login()
	{
		System.out.println("login method is called");
		users=usersService.login(users);
		System.out.println(users);
		if(users!=null)
		{
			session.put("user", users.getUsername());
			System.out.println("session:" + session.get("user"));
			return SUCCESS;
		}
		else
		{
			session.put("error", "");
			return ERROR;
		}
		
	}
	
	/**
	 * Logout
	 * @return
	 */
	public String logout(){
		log.testLog(TAG, "logout");
		ActionContext context = ActionContext.getContext();
		session = context.getSession();
		if(session != null){
			session.clear();
			session = null;
		}
		return "logout";
	}
	/**加载左侧页面*/
	public String loadingLeft(){
		return "left";
	}
	/**加载右侧页面**/
	public String loadingRight(){
		return "right";
	}
	/**加载上部页面*/
	public String loadingTop(){
		return "top";
	}
	
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}

	public UsersService getUsersService() {
		return usersService;
	}
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public void setSession(Map session) {
		this.session=session;
	}

	public Map getSession() {
		return session;
	}
	
}

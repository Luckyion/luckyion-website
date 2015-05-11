package com.luckyion.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class ClientAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7302350768567611114L;
	
	private Map<String, String> resultMap;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		String s = request.getRemoteAddr();
		Map<String, String> map = new HashMap<String, String>();
		map.put("ip", s);
		this.setResultMap(map);
		System.out.println(s);
		return SUCCESS;
	}

	public Map<String, String> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, String> resultMap) {
		this.resultMap = resultMap;
	}
	
	

}

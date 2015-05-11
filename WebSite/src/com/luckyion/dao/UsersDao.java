package com.luckyion.dao;

import java.util.List;

import com.luckyion.pojo.Users;
import com.luckyion.util.SuperInterface;

public interface UsersDao extends SuperInterface
{
	public Users login(Users user); //登录
	public Long getTotalCounts(int val,Users user); //总记录数
	public Long getTotalPages(Long totalCounts,int pagesize);//总页�?
	public List fenye(int pagecur, int pagesize,int val,Users user); //分页

}

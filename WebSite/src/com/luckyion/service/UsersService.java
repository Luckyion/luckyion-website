package com.luckyion.service;

import java.util.List;

import com.luckyion.pojo.Users;
import com.luckyion.util.SuperInterface;

public interface UsersService extends SuperInterface
{
	public Users login(Users user);
	public Long getTotalCounts(int val,Users user); //总记录数
	public Long getTotalPages(Long totalCounts,int pagesize);//总页�?
	public List fenye(int pagecur, int pagesize,int val,Users user); //分页
}

package com.luckyion.dao;

import java.util.List;

import com.luckyion.pojo.Files;
import com.luckyion.util.SuperInterface;

public interface FileManagerDao extends SuperInterface{
	public Long getTotalCounts(int val,Files files); //总记录数
	public Long getTotalPages(Long totalCounts,int pagesize);//总页数
	public List fenye(int pagecur, int pagesize,int val,Files files); //分页

}

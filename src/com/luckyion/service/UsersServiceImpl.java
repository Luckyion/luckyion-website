package com.luckyion.service;
import java.util.List;

import com.luckyion.dao.UsersDao;
import com.luckyion.pojo.Users;

public class UsersServiceImpl implements UsersService
{
	private UsersDao usersDao;
	public Users login(Users user) 
	{
		return usersDao.login(user);
	}

	public void delete(Object object) {
		usersDao.delete(object);
		
	}
	public List findAll(Object object) {
	
		return usersDao.findAll(object);
	}
	public Object findById(Object obj1, Object obj2) {
		
		return usersDao.findById(obj1, obj2);
	}
	public void save(Object object) {
		
		usersDao.save(object);
	}
	public void update(Object object) {
		
		usersDao.update(object);
	}
	public Long getTotalPages(Long totalCounts, int pagesize) {
		return usersDao.getTotalPages(totalCounts, pagesize);
	}
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public List find(Object object) {
		return usersDao.find(object);
	}

	@Override
	public Long getTotalCounts(int val, Users user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List fenye(int pagecur, int pagesize, int val, Users user) {
		// TODO Auto-generated method stub
		return null;
	}

	
}

package com.luckyion.service;

import java.util.List;

import com.luckyion.dao.MessagesDao;

public class MessagesServiceImpl implements MessagesService{
	private MessagesDao messagesDao;

	@Override
	public void save(Object object) {
		// TODO Auto-generated method stub
		messagesDao.save(object);
	}

	@Override
	public void update(Object object) {
		// TODO Auto-generated method stub
		messagesDao.update(object);
	}

	@Override
	public void delete(Object object) {
		// TODO Auto-generated method stub
		messagesDao.delete(object);
	}

	@Override
	public List findAll(Object object) {
		// TODO Auto-generated method stub
		return messagesDao.findAll(object);
	}

	@Override
	public Object findById(Object obj1, Object obj2) {
		// TODO Auto-generated method stub
		return messagesDao.findById(obj1, obj2);
	}

	@Override
	public List find(Object object) {
		// TODO Auto-generated method stub
		return messagesDao.find(object);
	}

	public MessagesDao getMessagesDao() {
		return messagesDao;
	}

	public void setMessagesDao(MessagesDao messagesDao) {
		this.messagesDao = messagesDao;
	}

}

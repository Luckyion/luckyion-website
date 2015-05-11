package com.luckyion.service;

import java.util.List;

import com.luckyion.dao.FileManagerDao;
import com.luckyion.pojo.Files;

public class FileManagerServiceImpl implements FileManagerService{
	
	private FileManagerDao fileManagerDao;

	@Override
	public void save(Object object) {
		// TODO Auto-generated method stub
		fileManagerDao.save(object);
	}

	@Override
	public void update(Object object) {
		// TODO Auto-generated method stub
		fileManagerDao.update(object);
	}

	@Override
	public void delete(Object object) {
		// TODO Auto-generated method stub
		fileManagerDao.delete(object);
	}

	@Override
	public List findAll(Object object) {
		// TODO Auto-generated method stub
		return fileManagerDao.findAll(object);
	}

	@Override
	public Object findById(Object obj1, Object obj2) {
		// TODO Auto-generated method stub
		return fileManagerDao.findById(obj1, obj2);
	}

	@Override
	public List find(Object object) {
		// TODO Auto-generated method stub
		return fileManagerDao.find(object);
	}

	public FileManagerDao getFileManagerDao() {
		return fileManagerDao;
	}

	public void setFileManagerDao(FileManagerDao fileManagerDao) {
		this.fileManagerDao = fileManagerDao;
	}

	@Override
	public Long getTotalCounts(int val, Files files) {
		// TODO Auto-generated method stub
		return fileManagerDao.getTotalCounts(val, files);
	}

	@Override
	public Long getTotalPages(Long totalCounts, int pagesize) {
		// TODO Auto-generated method stub
		return fileManagerDao.getTotalPages(totalCounts, pagesize);
	}

	@Override
	public List fenye(int pagecur, int pagesize, int val, Files files) {
		// TODO Auto-generated method stub
		return fileManagerDao.fenye(pagecur, pagesize, val, files);
	}

}

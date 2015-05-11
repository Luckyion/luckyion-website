package com.luckyion.util;

import java.util.List;

public interface SuperInterface {
	public void save(Object object); 

	public void update(Object object);

	public void delete(Object object);

	public List findAll(Object object);
	
	public Object findById(Object obj1, Object obj2);
	
	public List find(Object object) ;
}

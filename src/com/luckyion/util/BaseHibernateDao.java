package com.luckyion.util;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BaseHibernateDao extends HibernateDaoSupport 
{
	public void delete(Object object) 
	{
		this.getHibernateTemplate().delete(object);
//		this.delete(object);
	}
	public List findAll(Object object) 
	{
		return this.getSession().createCriteria(object.getClass()).list();
	}
	public List find(Object object) 
	{
		return this.getHibernateTemplate().find((String)object);
	}
	public void save(Object object) 
	{
		this.getHibernateTemplate().save(object);
//		this.save(object);
	}
	public void update(Object object) {
		this.getHibernateTemplate().update(object);
//		 this.update(object);
	}
	public Object findById(Object obj1,Object obj2)
	{
		return this.getHibernateTemplate().get((Class)obj1, (Serializable)obj2);
	}
	
}

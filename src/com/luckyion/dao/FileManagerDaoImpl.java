package com.luckyion.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.luckyion.pojo.Files;
import com.luckyion.util.BaseHibernateDao;

public class FileManagerDaoImpl extends BaseHibernateDao implements FileManagerDao{

	@Override
	public Long getTotalCounts(int val, Files files) {
		// TODO Auto-generated method stub
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		String hql="select count(f) from Files f";
		Long counts=(Long)session.createQuery(hql).uniqueResult();
		session.close();
		return counts;
	}

	@Override
	public Long getTotalPages(Long totalCounts, int pagesize) {
		// TODO Auto-generated method stub
		long pages=0L;
		if(totalCounts==0L)
		{
			pages=1L;
		}
		else
		{
			if((totalCounts%pagesize)==0)
			{
				pages=totalCounts/pagesize;
			}
			else
			{
				pages=totalCounts/pagesize+1;
			}
		}
		return pages;
	}

	@Override
	public List fenye(int pagecur, int pagesize, int val, Files files) {
		// TODO Auto-generated method stub
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		String hql="from Files order by fileid desc";
		Query query=session.createQuery(hql);
		query.setFirstResult((pagecur-1)*pagesize);
		query.setMaxResults(pagesize);
		List list=query.list();
		session.close();
		return list;
	}

}

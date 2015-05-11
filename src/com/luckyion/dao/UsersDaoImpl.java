package com.luckyion.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.luckyion.pojo.Users;
import com.luckyion.util.BaseHibernateDao;
public class UsersDaoImpl extends BaseHibernateDao implements UsersDao
{
	//用户登录
	public Users login(Users user) 
	{
		String hql="from Users where userName='"+user.getUsername()+"' and userPassword='"+user.getUserpassword()+"'";
		List list=this.getHibernateTemplate().find(hql);
		if(list.size()==0)
		{
			return null;
		}
		else
		{
			return (Users)list.get(0);
		}
	}
	public List fenye(int pagecur, int pagesize,int val,Users user) 
	{	
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		String hql="";
		if(val==0)   //
		{
			hql="from Users order by userId desc";
		}
		else if(val==1) //
		{
			hql="from Users u where u.userName like '%"+user.getUsername()+"%' order by u.userId desc";
		}
		else if(val==2) //
		{
//			hql="from Users u where u.role.roleName like '%"+user.getRole().getRoleName()+"%' order by u.userId desc";
		}
		else if(val==3) //
		{
//			hql="from Users u where u.userBithDate like '%"+user.getUserBithDate()+"%' order by u.userId desc";
		}
		Query query=session.createQuery(hql);
		query.setFirstResult((pagecur-1)*pagesize);
		query.setMaxResults(pagesize);
		List list=query.list();
		session.close();
		return list;
	}
	//总记录数
	public Long getTotalCounts(int val,Users user) 
	{
		Session session=this.getHibernateTemplate().getSessionFactory().openSession();
		String hql="";
		if(val==0)   //查询�?��
		{
			hql="select count(u) from Users u";
		}
		else if(val==1) //按用户名查询
		{
			hql="select count(u) from Users u where u.userName like '%"+user.getUsername()+"%'";
		}
		else if(val==2) //按角色名查询
		{
//			hql="select count(u) from Users u where u.role.roleName like '%"+user.getRole().getRoleName()+"%'";
		}
		else if(val==3) //按出身年月查�?
		{
//			hql="select count(u) from Users u where u.userBithDate like '%"+user.getUserBithDate()+"%'";
		}
		Long counts=(Long)session.createQuery(hql).uniqueResult();
		session.close();
		return counts;
	}
	//总页�?
	public Long getTotalPages(Long totalCounts, int pagesize) {
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
	
}

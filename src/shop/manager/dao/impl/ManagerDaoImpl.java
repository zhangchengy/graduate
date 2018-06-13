package shop.manager.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.manager.dao.ManagerDao;
import shop.manager.domain.Manager;

public class ManagerDaoImpl extends HibernateDaoSupport implements ManagerDao {

	@Override
	public Manager login(String phone) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Manager.class, phone);
	}

	@Override
	public void add(Manager manager) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(manager);
	}

	@Override
	public void delete(String phone) {
		// TODO Auto-generated method stub
		Manager manager=new Manager();
		manager.setPhone(phone);
		this.getHibernateTemplate().delete(manager);
	}

	@SuppressWarnings("unchecked")
	public List<Manager> findAll(){		
		return this.getHibernateTemplate().find("from Manager");
		
	}

	@Override
	public void alter(String phone, String name, String sex, String birthday,String address,String post) {
		// TODO Auto-generated method stub
		Manager manager=this.getHibernateTemplate().get(Manager.class,phone);
		manager.setAddress(address);
		manager.setBirthday(birthday);
		manager.setName(name);
		manager.setSex(sex);
		manager.setPost(post);
		this.getHibernateTemplate().update(manager);
	}

	@Override
	public boolean exist(String phone) {
		// TODO Auto-generated method stub
		Manager manager=this.getHibernateTemplate().get(Manager.class, phone);
		if(manager!=null){return true;}
		else {return false;}
	}

	@Override
	public void alterpassword(String phone,String newPassword) {
		// TODO Auto-generated method stub
		Manager manager=this.getHibernateTemplate().get(Manager.class,phone);
		manager.setPassword(newPassword);
		this.getHibernateTemplate().update(manager);
	}

	
}

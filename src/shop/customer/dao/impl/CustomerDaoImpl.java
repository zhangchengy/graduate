package shop.customer.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.customer.dao.CustomerDao;
import shop.customer.domain.Customer;

public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao{

	public void register(Customer customer) {
		this.getHibernateTemplate().save(customer);	
	}
	
	
	public Customer login(String userphone){
		Customer customer=this.getHibernateTemplate().get(Customer.class,userphone);
		System.out.println("登录时查出存在："+customer.getUsername());
		return customer;
	}
	
	
	
	public boolean exist(String userphone ){
		Customer customer=this.getHibernateTemplate().get(Customer.class,userphone);
		//System.out.println("查出存在："+customer.getUsername());
		if(customer!=null){System.out.println("eeee");return true;}
		else {System.out.println("dddd");return false;}
	}

	@Override
	public void alter(String userphone,String username,String sex,String userbirthday,String address) {
		Customer customer=this.getHibernateTemplate().get(Customer.class, userphone);
		customer.setUsername(username);
		customer.setAddress(address);
		customer.setSex(sex);
		customer.setUserbirthday(userbirthday);
		this.getHibernateTemplate().update(customer);
	}
	
}

package shop.customer.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.customer.dao.CustomerDao;
import shop.customer.domain.Customer;

public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao{

	public void register(Customer customer) {
		this.getHibernateTemplate().save(customer);	
	}
	
	@SuppressWarnings("unchecked")
	public Customer login(String userphone){
		System.out.println(userphone);
		Customer customer=new Customer();
		customer.setUserphone(userphone);
		List<Customer> list=this.getHibernateTemplate().findByExample(customer, 0, 1);
		return list.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public boolean exist(String userphone){
		Customer customer=new Customer();
		customer.setUserphone(userphone);
		List<Customer> list=this.getHibernateTemplate().findByExample(customer, 0, 1);
		System.out.println(list);
		if(!list.isEmpty()){System.out.println("eeee");return true;}
		else {System.out.println("dddd");return false;}
	}
	
}

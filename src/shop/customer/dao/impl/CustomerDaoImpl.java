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
	public List<Customer> login(String userphone){
		System.out.println(userphone);
		Customer customer=new Customer();
		customer.setUserphone(userphone);
		List<Customer> list=this.getHibernateTemplate().findByExample(customer, 0, 2);
		return list;
	}
	
	
}

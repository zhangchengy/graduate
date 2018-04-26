package shop.customer.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.customer.dao.CustomerDao;
import shop.customer.domain.Customer;

public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao{

	@Override
	public void login(Customer customer) {
		this.getHibernateTemplate().save(customer);
		// TODO Auto-generated method stub
		
	}

}

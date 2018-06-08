package shop.customer.service.impl;

import shop.customer.dao.CustomerDao;
import shop.customer.domain.Customer;
import shop.customer.service.CustomerService;

public class CustomerServiceImpl implements CustomerService{
	private CustomerDao customerDao;
	@Override
	public void customerregister(Customer customer) {
		// TODO Auto-generated method stub
		customerDao.register(customer);
	}
	
	public Customer customerlogin(String userphone){
		return customerDao.login(userphone);
	}
	
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public boolean customerexist(String userphone) {
		// TODO Auto-generated method stub
		return customerDao.exist(userphone);
	}

	
	public void informalter(String userphone,String username,String sex,String userbirthday,String address) {
		customerDao.alter(userphone,username,sex,userbirthday,address);
		
	}
	
}

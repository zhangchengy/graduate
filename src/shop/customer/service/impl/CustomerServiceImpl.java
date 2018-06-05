package shop.customer.service.impl;

import java.util.List;

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
	
	public List<Customer> customerlogin(String userphone){
		return customerDao.login(userphone);
	}
	
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
}

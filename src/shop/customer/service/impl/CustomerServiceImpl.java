package shop.customer.service.impl;

import shop.customer.dao.CustomerDao;
import shop.customer.domain.Customer;
import shop.customer.service.CustomerService;

public class CustomerServiceImpl implements CustomerService{
	private CustomerDao customerDao;
	@Override
	public void customersave(Customer customer) {
		// TODO Auto-generated method stub
		customerDao.login(customer);
	}
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
}

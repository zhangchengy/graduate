package shop.customer.dao;


import java.util.List;

import shop.customer.domain.Customer;

public interface CustomerDao {
	public void register(Customer customer);
	public List<Customer> login(String userphone);
}
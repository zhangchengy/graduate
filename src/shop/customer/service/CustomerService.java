package shop.customer.service;

import java.util.List;

import shop.customer.domain.Customer;

public interface CustomerService {
		public void customerregister(Customer customer);
		public List<Customer> customerlogin(String userphone);
}

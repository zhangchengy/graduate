package shop.customer.service;

import shop.customer.domain.Customer;

public interface CustomerService {
		public void customerregister(Customer customer);
		public Customer customerlogin(String userphone);
		public boolean customerexist(String userphone);
}

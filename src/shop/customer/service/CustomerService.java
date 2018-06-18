package shop.customer.service;

import shop.customer.domain.Customer;

public interface CustomerService {
		public void customerregister(Customer customer);
		public Customer customerlogin(String userphone);
		public boolean customerexist(String userphone);
		public void informalter(String userphone,String username,String sex,String userbirthday,String address);
		public void alterPassword(String userphone,String newpassword);
}

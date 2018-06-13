package shop.customer.dao;




import shop.customer.domain.Customer;

public interface CustomerDao {
	public void register(Customer customer);
	public Customer login(String userphone);
	public boolean exist(String userphone);
	public void alter(String userphone,String username,String sex,String userbirthday,String address);
	
}
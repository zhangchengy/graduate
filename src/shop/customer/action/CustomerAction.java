package shop.customer.action;


import shop.customer.domain.Customer;
import shop.customer.service.CustomerService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	CustomerService customerService;
	Customer customer;
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		
		this.customer.setCname(customer.getCname());
		this.customer.setCpassword(customer.getCpassword());
		this.customer.setBirthday(customer.getBirthday());
		this.customer=customer;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	public String login(){
		customerService.customersave(customer);
		return SUCCESS;
	}

	public Customer getModel() {
		// TODO Auto-generated method stub
		if(customer != null){
			return customer;
		}
		else{
			return customer=new Customer();
		}
	}
	
	
	
}

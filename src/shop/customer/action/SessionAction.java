package shop.customer.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import shop.customer.domain.Customer;

import com.opensymphony.xwork2.ActionSupport;

public class SessionAction extends ActionSupport implements SessionAware  {

	
	private static final long serialVersionUID = 1L;
	Map<String,Customer> session;
	Customer customer;
	
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	public String send(){
		this.customer=this.session.get("user");
		
		return SUCCESS;
	}
	public String logout2(){
		this.session.clear();
		return SUCCESS;
	}
}

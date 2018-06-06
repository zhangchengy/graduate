package shop.customer.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import shop.customer.domain.Customer;
import shop.customer.service.CustomerService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerAction extends ActionSupport implements
		SessionAware,ModelDriven<Customer> {

	private static final long serialVersionUID = 1L;
	String msg;
	CustomerService customerService;
	Customer customer;
	JSONObject jsonobject = new JSONObject();
	Map<String, Customer> session;
	
	

	public JSONObject getJsonobject() {
		return jsonobject;
	}

	public void setJsonobject(JSONObject jsonobject) {
		this.jsonobject = jsonobject;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public String register() {
		customerService.customerregister(customer);
		return SUCCESS;
	}

	public String login() {

		HttpServletRequest request = ServletActionContext.getRequest();
		String userphone = request.getParameter("userphone");
		List<Customer> list = customerService.customerlogin(userphone);
		msg="find successfully!";
		jsonobject.put("msg", msg);
		jsonobject.put("list", list);
		session.put("user", list.get(0));
		
		return SUCCESS;
	}

	public Customer getModel() {

		if (customer != null) {
			return customer;
		} else {
			return customer = new Customer();
		}
	}

	@Override
	public void setSession(Map session) {
		
		this.session=session;
	}

}

package shop.customer.action;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import shop.customer.domain.Customer;
import shop.customer.service.CustomerService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CustomerAction extends ActionSupport implements SessionAware,
		ModelDriven<Customer> {

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
		session.put("user", customer);
		
		return SUCCESS;
	}
	
	public String existphone(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String userphone=request.getParameter("userphone");
		boolean bool=customerService.customerexist(userphone);
		jsonobject.put("msg", bool);
		return SUCCESS;
	}
	
	public String informalter(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String userphone = request.getParameter("userphone");
		String username=request.getParameter("username");
		String address=request.getParameter("address");
		String sex=request.getParameter("sex");
		String userbirthday=request.getParameter("userbirthday");
		customerService.informalter(userphone,username,sex,userbirthday,address);
		return SUCCESS;
	}
	
	public String login() {	
		HttpServletRequest request = ServletActionContext.getRequest();
		String userphone = request.getParameter("userphone");
		String password = request.getParameter("password");
		if (customerService.customerexist(userphone)) {
			customer = customerService.customerlogin(userphone);
			if (customer.getPassword().equals(password)) {
				msg = "one";//登录成功
				jsonobject.put("msg", msg);
				jsonobject.put("customer", customer);
				session.put("user", customer);
			} else {
				System.out.println(password);
				System.out.println(customer.getUsername());
				msg = "two";//密码错误
				jsonobject.put("msg", msg);
			}
		} else {
			msg="three";//用户未注册
			jsonobject.put("msg", msg);
		}
		return SUCCESS;
	}

	public Customer getModel() {

		if (customer != null) {
			return customer;
		} else {
			return customer = new Customer();
		}
	}

	public void setSession(Map session) {
		this.session = session;
	}

}

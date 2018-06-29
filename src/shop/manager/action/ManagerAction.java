package shop.manager.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;








import shop.manager.domain.Manager;
import shop.manager.service.ManagerService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ManagerAction extends ActionSupport implements SessionAware,
ModelDriven<Manager> {
	ManagerService managerService;
	private static final long serialVersionUID = 1L;
	Map session;
	String msg;
	Manager manager;
	JSONObject jsonobject=new JSONObject();
	
	
	public JSONObject getJsonobject() {
		return jsonobject;
	}

	public void setJsonobject(JSONObject jsonobject) {
		this.jsonobject = jsonobject;
	}

	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}
	
	public String passalter(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		manager=(Manager) this.session.get("manager");
		if(oldPassword.equals(manager.getPassword())){
			msg="one";
			managerService.alterPassword(manager.getPhone(),newPassword);
			jsonobject.put("msg",msg);
			session.put("manager", manager);
		}
		else{
			msg="two";
			jsonobject.put("msg",msg);
		}
		return SUCCESS;
	}
	
	public String findAllManager(){
		List<Manager> list=managerService.findAllManager();
		msg="find successfully";
		jsonobject.put("msg",msg);
		jsonobject.put("list",list);
		return SUCCESS;
	}
	
	public String addManager(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String phone=request.getParameter("phone");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String birthday=request.getParameter("birthday");
		String post=request.getParameter("post");
		String sex=request.getParameter("sex");
		manager=new Manager(name,phone,birthday,sex,address, post,password);
		managerService.addManager(manager);
		return SUCCESS;
	}
	
	public String deleteManager(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String phone=request.getParameter("phone");
		managerService.deleteManager(phone);
		jsonobject.put("msg",phone);
		return SUCCESS;
	}
	
	public String sessionManager(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String phone=request.getParameter("phone");
		manager=managerService.loginManager(phone);
		return SUCCESS;
	}
	
	public String alterManager(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String phone=request.getParameter("phone");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String birthday=request.getParameter("birthday");
		String post=request.getParameter("post");
		String sex=request.getParameter("sex");
		managerService.alterManager(phone, name, sex, birthday, address, post);		
		return SUCCESS;
	}
	
	public String existManager(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String phone=request.getParameter("phone");
		boolean bool=managerService.existManager(phone);
		jsonobject.put("msg", bool);
		return SUCCESS;
	}
	
	public String login(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");
		if(managerService.existManager(phone)){
			manager=managerService.loginManager(phone);
			if(manager.getPassword().equals(password)){
				msg="one";
				jsonobject.put("msg", msg);
				jsonobject.put("manager", manager);
				session.put("manager", manager);
			}
			else{
				msg="two";
				jsonobject.put("msg", msg);
			}
		}
		else{
			msg="three";
			jsonobject.put("msg", msg);
		}
		return SUCCESS;
	}
	
	@Override
	public Manager getModel() {
		// TODO Auto-generated method stub
		if (manager != null) {
			return manager;
		} else {
			return manager = new Manager();
		}
	}

	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	
}

package shop.manager.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import shop.manager.domain.Manager;

import com.opensymphony.xwork2.ActionSupport;

public class SessionAction extends ActionSupport implements SessionAware{
	Map session;
	Manager manager;
	
	
	public Map getSession() {
		return session;
	}



	public Manager getManager() {
		return manager;
	}


	public void setManager(Manager manager) {
		this.manager = manager;
	}


	@Override
	public void setSession(Map session) {
		this.session=session;
		
	}
	
	public String send(){
		this.manager=(Manager) this.session.get("manager");
		return SUCCESS;
	}
	public String logout(){
		this.session.clear();
		return SUCCESS;
	}
	
}

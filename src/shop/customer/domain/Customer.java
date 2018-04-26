package shop.customer.domain;

import java.util.Date;

public class Customer {
	private int cid;
	private String cname;
	private Integer cpassword;
	private Date birthday;
	
	
	
	
	public Customer() {
		
	}
	public Customer(int cid, String cname, Integer cpassword, Date birthday) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.cpassword = cpassword;
		this.birthday = birthday;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getCpassword() {
		return cpassword;
	}
	public void setCpassword(Integer cpassword) {
		this.cpassword = cpassword;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	
}

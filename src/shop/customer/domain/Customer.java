package shop.customer.domain;

import java.util.Date;

public class Customer {
	private int cid;
	private String sex;
	private String userphone;
	private String username;
	private String password;
	private String userbirthday;
	private String address;

	public Customer() {
	}

	public Customer(int cid, String sex, String userphone, String username,
			String password, String userbirthday, String address) {

		this.cid = cid;
		this.sex = sex;
		this.userphone = userphone;
		this.username = username;
		this.password = password;
		this.userbirthday = userbirthday;
		this.address = address;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserbirthday() {
		return userbirthday;
	}

	public void setUserbirthday(String userbirthday) {
		this.userbirthday = userbirthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}

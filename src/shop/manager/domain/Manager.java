package shop.manager.domain;

public class Manager {
	String name;
	String phone;
	String birthday;
	String sex;
	String address;
	String post;
	String password;
	
	public Manager(){
		
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public Manager(String name, String phone, String birthday,
			String sex, String address, String post,String password) {
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.sex = sex;
		this.address = address;
		this.post = post;
		this.password=password;
	}
	
}

package shop.collect.domain;

public class Collect {
	int cid;
	String number;
	String userphone;
	
	public Collect(){
		
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public Collect(int cid, String number, String userphone) {
		this.cid = cid;
		this.number = number;
		this.userphone = userphone;
	}
	
	
}

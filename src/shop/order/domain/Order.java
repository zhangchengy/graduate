package shop.order.domain;


public class Order {
	private int cid;
	private String number;
	private String userphone;
	private String ordertime;
	public Order(){
		
	}
	
	public Order(int cid, String number, String userphone,String ordertime) {
		this.cid = cid;
		this.number = number;
		this.userphone = userphone;
		this.ordertime=ordertime;
	}
	
	
	
	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
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
	
		
	
}

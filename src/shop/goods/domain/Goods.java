package shop.goods.domain;

public class Goods {
	private String number;
	private String name;
	private String variety;
	private float price;
	private String image;
	private String intro;
	public Goods(String number, String name, String variety, float price,
			String image, String intro) {
		this.number = number;
		this.name = name;
		this.variety = variety;
		this.price = price;
		this.image = image;
		this.intro = intro;
	}
	public Goods() {
		// TODO Auto-generated constructor stub
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVariety() {
		return variety;
	}
	public void setVariety(String variety) {
		this.variety = variety;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}

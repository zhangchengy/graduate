package shop.goods.domain;

public class Goods {
	private String number;
	private String name;
	private String variety;
	private String style;
	private double price;
	private String image;
	private String brief;
	private String intro;
	private String imagesay;
	public Goods() {

	}
	
	public Goods(String style,String number, String name, String variety,
			double price, String image,String imagesay, String intro,String brief) {
		super();
		this.style=style;
		this.number = number;
		this.name = name;
		this.brief=brief;
		this.variety = variety;
		this.price = price;
		this.image = image;
		this.imagesay=imagesay;
		this.intro = intro;
	}
	
	public String getImagesay() {
		return imagesay;
	}

	public void setImagesay(String imagesay) {
		this.imagesay = imagesay;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
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

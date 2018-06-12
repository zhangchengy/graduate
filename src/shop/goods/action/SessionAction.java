package shop.goods.action;

import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.SessionAware;

import shop.goods.domain.Goods;

import com.opensymphony.xwork2.ActionSupport;

public class SessionAction extends ActionSupport implements SessionAware  {

	
	private static final long serialVersionUID = 1L;
	Map session;
	Goods goods;
	JSONObject jsonobject=new JSONObject();
	
	
	public JSONObject getJsonobject() {
		return jsonobject;
	}
	public void setJsonobject(JSONObject jsonobject) {
		this.jsonobject = jsonobject;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	
	public String sendgoods(){
		this.goods=(Goods) this.session.get("goods");
		return SUCCESS;
	}
	
	public String sendlist(){
		this.jsonobject=(JSONObject) this.session.get("list");
		return SUCCESS;
	}
	
}

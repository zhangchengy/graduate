package shop.goods.action;

import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.SessionAware;

import shop.goods.domain.Goods;
import shop.goods.service.GoodsService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GoodsAction extends ActionSupport implements
		SessionAware,ModelDriven<Goods>{

	private static final long serialVersionUID = 1L;
	Goods goods;
	Map<String,Goods> session;
	JSONObject jsonobject = new JSONObject();
	GoodsService goodsService;
	String msg;
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public JSONObject getJsonobject() {
		return jsonobject;
	}

	public void setJsonobject(JSONObject jsonobject) {
		this.jsonobject = jsonobject;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	
	public String addGoods(){
		goodsService.addGoods(goods);
		return SUCCESS;
	}

	public Goods getModel() {
		if (goods != null) {
			return goods;
		} else {
			return goods = new Goods();
		}
	}

	public void setSession(Map session) {
		this.session=session;	
	}

}

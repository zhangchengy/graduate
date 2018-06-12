package shop.goods.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import shop.goods.domain.Goods;
import shop.goods.service.GoodsService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GoodsAction extends ActionSupport implements
		SessionAware,ModelDriven<Goods>{

	private static final long serialVersionUID = 1L;
	Goods goods;
	Map session;
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
	public String findGoodsByNumber(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String number = request.getParameter("number");
		Goods goods=goodsService.findGoodsByNumber(number);
		msg="find successfully!";
		jsonobject.put("msg", msg);
		jsonobject.put("goods", goods);
		session.put("goods", goods);
		return SUCCESS;
	}
	
	public String goodssearch(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String keyword=request.getParameter("search");
		List<Goods> list=goodsService.findGoodsByVariety(keyword);
		msg="find successfully";
		jsonobject.put("msg", msg);
		jsonobject.put("list", list);
		session.put("list", jsonobject);
		return SUCCESS;
	}
	
	public String goodsdetail(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String number=request.getParameter("number");
		Goods goods=goodsService.findGoodsByNumber(number);
		msg="find successfully!";
		jsonobject.put("msg", msg);
		jsonobject.put("goods", goods);
		session.put("goods", goods);
		
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

package shop.collect.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.SessionAware;

import shop.customer.domain.Customer;
import shop.customer.service.CustomerService;
import shop.goods.domain.Goods;
import shop.goods.service.GoodsService;
import shop.collect.domain.Collect;
import shop.collect.service.CollectService;

import com.opensymphony.xwork2.ActionSupport;


public class CollectAction extends ActionSupport implements SessionAware{
	Map session;
	CollectService collectService;
	GoodsService goodsService;
	CustomerService customerService;
	JSONObject jsonobject = new JSONObject();
	private static final long serialVersionUID = 1L;
	
	
	
	public JSONObject getJsonobject() {
		return jsonobject;
	}
	public void setJsonobject(JSONObject jsonobject) {
		this.jsonobject = jsonobject;
	}
	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	public String savecollect(){
		Customer customer=(Customer)this.session.get("user");
		Goods goods=(Goods)this.session.get("goods");
		Collect collect=new Collect();
		collect.setNumber(goods.getNumber());
		collect.setUserphone(customer.getUserphone());
        collectService.saveCollect(collect);
        return SUCCESS;
	}
	
	public String findcollect(){
		Customer customer=(Customer) this.session.get("user");
		String userphone=customer.getUserphone();
		List<Collect> list=collectService.findCollect(userphone);
		ArrayList<Goods> goodscollect=new ArrayList<Goods>();
		for(int i=0;i<list.size();i++){
			goodscollect.add(goodsService.findGoodsByNumber(list.get(i).getNumber()));
		}
		jsonobject.put("list", goodscollect);
		jsonobject.put("msg", "find successfully!");
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.session=session;
		
	}
}

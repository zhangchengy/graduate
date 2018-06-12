package shop.order.action;

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
import shop.order.domain.Order;
import shop.order.service.OrderService;

import com.opensymphony.xwork2.ActionSupport;


public class OrderAction extends ActionSupport implements SessionAware{
	Map session;
	OrderService orderService;
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
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	public String saveorder(){
		Customer customer=(Customer)this.session.get("user");
		Goods goods=(Goods)this.session.get("goods");
		Order order=new Order();
		order.setNumber(goods.getNumber());
		order.setUserphone(customer.getUserphone());
		
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        String ordertime = sdf.format(d);
        order.setOrdertime(ordertime);
        orderService.saveOrder(order);
        return SUCCESS;
	}
	
	public String findorder(){
		Customer customer=(Customer) this.session.get("user");
		String userphone=customer.getUserphone();
		List<Order> list=orderService.findOrder(userphone);
		ArrayList<Goods> goodsorder=new ArrayList<Goods>();
		ArrayList<String> ordertime=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			goodsorder.add(goodsService.findGoodsByNumber(list.get(i).getNumber()));
			ordertime.add(list.get(i).getOrdertime());
		}
		jsonobject.put("list", goodsorder);
		jsonobject.put("ordertime",ordertime);
		jsonobject.put("msg", "find successfully!");
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.session=session;
		
	}
	

}

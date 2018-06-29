package shop.order.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
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
	String msg;
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
        order.setStatus(1);
        orderService.saveOrder(order);
        return SUCCESS;
	}
	
	public String findAllOrder(){
		List<Order> list=orderService.findAllOrder();		
		ArrayList<String[]> arrayList=new ArrayList<String[]>();
		for(int i=0;i<list.size();i++)
		{
			String[] order=new String[8];
			order[0]=list.get(i).getUserphone();
			order[6]=String.valueOf(list.get(i).getStatus());
			Customer customer=customerService.customerlogin(list.get(i).getUserphone());
			order[1]=customer.getUsername();
			order[5]=customer.getAddress();
			order[7]=String.valueOf(list.get(i).getCid());
			order[2]=list.get(i).getNumber();
			Goods goods=goodsService.findGoodsByNumber(list.get(i).getNumber());
			order[3]=goods.getName();
			order[4]=list.get(i).getOrdertime();
			arrayList.add(order);
		}
		msg="find successfully";
		jsonobject.put("msg",msg);
		jsonobject.put("list",arrayList);
		return SUCCESS;
	}
	
	public String deleteorder(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int ordernumber=Integer.parseInt(request.getParameter("ordernumber"));
		orderService.deleteOrder(ordernumber);
		jsonobject.put("msg",ordernumber);
		return SUCCESS;
	}
	
	public String finishorder(){
		HttpServletRequest request=ServletActionContext.getRequest();
		int ordernumber=Integer.parseInt(request.getParameter("ordernumber"));
		orderService.finishOrder(ordernumber);
		jsonobject.put("msg",ordernumber);
		return SUCCESS;
	}
	
	public String findorder(){
		Customer customer=(Customer) this.session.get("user");
		String userphone=customer.getUserphone();
		List<Order> list=orderService.findOrder(userphone);
		ArrayList<Goods> goodsorder=new ArrayList<Goods>();
		ArrayList<String> ordertime=new ArrayList<String>();
		ArrayList<Integer> ordernumber=new ArrayList<Integer>();
		ArrayList<Integer> orderstatus=new ArrayList<Integer>();
		for(int i=0;i<list.size();i++){
			goodsorder.add(goodsService.findGoodsByNumber(list.get(i).getNumber()));
			ordertime.add(list.get(i).getOrdertime());
			ordernumber.add(list.get(i).getCid());
			orderstatus.add(list.get(i).getStatus());
		}
		jsonobject.put("list", goodsorder);
		jsonobject.put("ordernumber",ordernumber);
		jsonobject.put("orderstatus",orderstatus);
		jsonobject.put("ordertime",ordertime);
		jsonobject.put("msg", "find successfully!");
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.session=session;
		
	}
	

}

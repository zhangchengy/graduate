package shop.order.dao;

import java.util.List;


import shop.order.domain.Order;

public interface OrderDao {
	public void save(Order order);
	public List<Order> find(String userphone);
	public List<Order> findAllOrder();
	public void delete(int ordernumber);
}

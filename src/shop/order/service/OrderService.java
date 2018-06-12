package shop.order.service;

import java.util.List;

import shop.order.domain.Order;

public interface OrderService {
	public void saveOrder(Order order);
	public List<Order> findOrder(String userphone);
}

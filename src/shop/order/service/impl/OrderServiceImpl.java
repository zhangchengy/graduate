package shop.order.service.impl;

import java.util.List;

import shop.order.dao.OrderDao;
import shop.order.domain.Order;
import shop.order.service.OrderService;

public class OrderServiceImpl implements OrderService{

	OrderDao orderDao;
	
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void saveOrder(Order order) {
		orderDao.save(order);
	}

	@Override
	public List<Order> findOrder(String userphone) {
		return orderDao.find(userphone);
	}

	@Override
	public List<Order> findAllOrder() {
		// TODO Auto-generated method stub
		return orderDao.findAllOrder();
	}

	@Override
	public void deleteOrder(int ordernumber) {
		// TODO Auto-generated method stub
		orderDao.delete(ordernumber);
	}

	@Override
	public void finishOrder(int ordernumber) {
		// TODO Auto-generated method stub
		orderDao.finish(ordernumber);
	}

}

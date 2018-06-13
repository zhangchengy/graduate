package shop.order.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;



import shop.order.dao.OrderDao;
import shop.order.domain.Order;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	public void save(Order order) {
		this.getHibernateTemplate().save(order);
		
	}

	@SuppressWarnings("unchecked")
	public List<Order> find(String userphone) {
		Order order=new Order();
		order.setUserphone(userphone);
		return this.getHibernateTemplate().findByExample(order);
	}

	@Override
	public List<Order> findAllOrder() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Order");
	}

}

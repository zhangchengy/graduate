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
		return this.getHibernateTemplate().find("from Order o where o.userphone=?",userphone);
	}

	@Override
	public List<Order> findAllOrder() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Order");
	}

	@Override
	public void delete(int ordernumber) {
		// TODO Auto-generated method stub
		Order order=this.getHibernateTemplate().get(Order.class, ordernumber);
		order.setStatus(0);
		this.getHibernateTemplate().update(order);
	}

	@Override
	public void finish(int ordernumber) {
		// TODO Auto-generated method stub
		Order order=this.getHibernateTemplate().get(Order.class, ordernumber);
		order.setStatus(2);
		this.getHibernateTemplate().update(order);
	}

}

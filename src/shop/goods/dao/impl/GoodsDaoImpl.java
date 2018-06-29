package shop.goods.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.customer.domain.Customer;
import shop.goods.dao.GoodsDao;
import shop.goods.domain.Goods;
import shop.order.domain.Order;

public class GoodsDaoImpl extends HibernateDaoSupport implements GoodsDao {

	public void add(Goods goods) {
		this.getHibernateTemplate().save(goods);
	}

	public void delete(String  number) {
		Goods goods=new Goods();
		goods.setNumber(number);
		this.getHibernateTemplate().delete(goods);
	}

	@SuppressWarnings("unchecked")
	public Goods findbyNumber(String number) {
		Goods goods=new Goods();
		goods.setNumber(number);
		List<Goods> list=this.getHibernateTemplate().find("from Goods g where g.number=?", number);
		return list.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findbyName(String name) {
		Goods goods=new Goods();
		goods.setName(name);
		List<Goods> list=this.getHibernateTemplate().findByExample(goods);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Goods> findbyVariety(String variety) {
		List<Goods> list=this.getHibernateTemplate().find("from Goods g where g.variety=? and g.status=1",variety);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> findAllGoods() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Goods");
	}

	@Override
	public void down(String number) {
		// TODO Auto-generated method stub
		Goods goods=this.getHibernateTemplate().get(Goods.class, number);
		goods.setStatus(0);
		this.getHibernateTemplate().update(goods);
	}

	@Override
	public void alter(String name, String number, String brief, String variety,
			String style, double price, String intro, String image,
			String imagesay, int status) {
		// TODO Auto-generated method stub
		Goods goods=this.getHibernateTemplate().get(Goods.class,number);
		goods.setBrief(brief);
		goods.setName(name);
		goods.setImage(image);
		goods.setImagesay(imagesay);
		goods.setIntro(intro);
		goods.setPrice(price);
		goods.setVariety(variety);
		goods.setStatus(status);
		goods.setStyle(style);
		this.getHibernateTemplate().update(goods);
	}

	@Override
	public boolean exist(String number) {
		// TODO Auto-generated method stub
		Goods goods=this.getHibernateTemplate().get(Goods.class,number);
		if(goods!=null){return true;}
		else {return false;}
	}

}

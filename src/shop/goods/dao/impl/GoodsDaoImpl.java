package shop.goods.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.goods.dao.GoodsDao;
import shop.goods.domain.Goods;

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
		List<Goods> list=this.getHibernateTemplate().find("from Goods g where g.variety=?",variety);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> findAllGoods() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Goods");
	}

}

package shop.collect.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import shop.collect.domain.Collect;
import shop.collect.dao.CollectDao;

public class CollectDaoImpl extends HibernateDaoSupport implements CollectDao {

	
	
	@Override
	public void save(Collect collect) {
		this.getHibernateTemplate().save(collect);
	}

	@Override
	public List<Collect> find(String userphone) {
		Collect collect=new Collect();
		collect.setUserphone(userphone);
		return this.getHibernateTemplate().findByExample(collect);
	}

}

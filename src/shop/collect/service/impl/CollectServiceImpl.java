package shop.collect.service.impl;

import java.util.List;

import shop.collect.dao.CollectDao;
import shop.collect.domain.Collect;
import shop.collect.service.CollectService;

public class CollectServiceImpl implements CollectService {
	CollectDao collectDao;
	
	
	
	public void setCollectDao(CollectDao collectDao) {
		this.collectDao = collectDao;
	}

	public void saveCollect(Collect collect) {
		collectDao.save(collect);

	}

	public List<Collect> findCollect(String userphone) {
		return collectDao.find(userphone);
	}

}

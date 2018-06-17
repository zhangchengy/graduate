package shop.collect.service;

import java.util.List;

import shop.collect.domain.Collect;

public interface CollectService {
	public void saveCollect(Collect collect);
	public List<Collect> findCollect(String userphone);
	public boolean existCollect(String number,String userphone);
}

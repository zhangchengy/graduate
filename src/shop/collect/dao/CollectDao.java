package shop.collect.dao;

import java.util.List;

import shop.collect.domain.Collect;

public interface CollectDao {
	public void save(Collect collect);
	public List<Collect> find(String userphone);
	public boolean exist(String number,String userphone);
}

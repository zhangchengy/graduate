package shop.goods.dao;

import java.util.List;

import shop.goods.domain.Goods;

public interface GoodsDao {
	public void add(Goods goods);
	public void delete(String number);
	public Goods findbyNumber(String number);
	public List<Goods> findbyName(String name);
	public List<Goods> findbyVariety(String variety);
	public List<Goods> findAllGoods();
}

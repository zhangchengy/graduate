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
	public void down(String number);
	public boolean exist(String number);
	public void alter(String name,String number,String brief,String variety,String style,double price,String intro,String image,String imagesay,int status);
}

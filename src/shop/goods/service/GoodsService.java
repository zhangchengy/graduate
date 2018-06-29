package shop.goods.service;

import java.util.List;

import shop.goods.domain.Goods;

public interface GoodsService {
	public void deleteGoods(String number);
	public void addGoods(Goods goods);
	public List<Goods> findGoodsByName(String name);
	public Goods findGoodsByNumber(String number);
	public List<Goods> findGoodsByVariety(String variety);
	public List<Goods> findAllGoods();
	public void downGoods(String number);
	public boolean existNumber(String number);
	public void alterGoods(String name,String number,String brief,String variety,String style,double price,String intro,String image,String imagesay,int status);
}

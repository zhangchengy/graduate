package shop.goods.service.impl;

import java.util.List;

import shop.goods.dao.GoodsDao;
import shop.goods.domain.Goods;
import shop.goods.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {
	GoodsDao goodsDao;
	
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao=goodsDao;
	}

	public void addGoods(Goods goods) {
		goodsDao.add(goods);
	}

	public List<Goods> findGoodsByName(String name) {
		return goodsDao.findbyName(name);
	}

	public Goods findGoodsByNumber(String number) {
		return goodsDao.findbyNumber(number);
	}

	public List<Goods> findGoodsByVariety(String variety) {
		return goodsDao.findbyVariety(variety);
	}

	public void deleteGoods(String number) {
		goodsDao.delete(number);
	}

	@Override
	public List<Goods> findAllGoods() {
		// TODO Auto-generated method stub
		return goodsDao.findAllGoods();
	}

}

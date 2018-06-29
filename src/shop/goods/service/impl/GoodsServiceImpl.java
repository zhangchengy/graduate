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

	@Override
	public void downGoods(String number) {
		// TODO Auto-generated method stub
		goodsDao.down(number);
	}

	@Override
	public void alterGoods(String name, String number, String brief,
			String variety, String style, double price, String intro,
			String image, String imagesay, int status) {
		// TODO Auto-generated method stub
		goodsDao.alter(name, number, brief, variety, style, price, intro, image, imagesay, status);
	}

	@Override
	public boolean existNumber(String number) {
		// TODO Auto-generated method stub
		return goodsDao.exist(number);
	}

}

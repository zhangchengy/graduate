package shop.manager.service.impl;

import java.util.List;

import shop.manager.dao.ManagerDao;
import shop.manager.domain.Manager;
import shop.manager.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {
	ManagerDao managerDao;
	
	
	
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public Manager loginManager(String phone) {
		// TODO Auto-generated method stub
		return managerDao.login(phone);
	}

	@Override
	public void addManager(Manager manager) {
		// TODO Auto-generated method stub
		managerDao.add(manager);
	}

	@Override
	public void deleteManager(String phone) {
		// TODO Auto-generated method stub
		managerDao.delete(phone);
	}

	@Override
	public List<Manager> findAllManager() {
		// TODO Auto-generated method stub
		return managerDao.findAll();
	}

	@Override
	public void alterManager(String phone, String name, String sex, String birthday,
			String address, String post) {
		// TODO Auto-generated method stub
		managerDao.alter(phone, name, sex, birthday, address, post);
	}

	@Override
	public boolean existManager(String phone) {
		// TODO Auto-generated method stub
		return managerDao.exist(phone);
	}

	@Override
	public void alterPassword(String phone, String newPassword) {
		// TODO Auto-generated method stub
		managerDao.alterpassword(phone, newPassword);
	}

}

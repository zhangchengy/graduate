package shop.manager.service;

import java.util.List;

import shop.manager.domain.Manager;

public interface ManagerService {
	public Manager loginManager(String phone);
	public void addManager(Manager manager);
	public void deleteManager(String phone);
	public List<Manager> findAllManager();
	public boolean existManager(String phone);
	public void alterPassword(String phone,String newPassword);
	public  void alterManager(String phone, String name, String sex,String birthday, String address,String post);
}

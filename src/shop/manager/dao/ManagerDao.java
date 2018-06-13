package shop.manager.dao;

import java.util.List;

import shop.manager.domain.Manager;

public interface ManagerDao {
	public Manager login(String phone);
	public void add(Manager manager);
	public void delete(String phone);
	public List<Manager> findAll();
	public boolean exist(String phone);
	public void alter(String phone, String name, String sex,String birthday, String address,String post);
	public void alterpassword(String phone,String newPassword);
}

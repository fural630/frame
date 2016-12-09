package com.module.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.code.session.UserSingleton;
import com.module.system.dao.RoleDao;
import com.module.system.model.Role;
import com.module.system.model.User;
import com.util.MyDate;
import com.util.MyLocale;
import com.util.SysRemark;

@Service
public class RoleService {

	@Autowired(required = false)
	private RoleDao roleDao;
	private MyDate myDate = new MyDate();
	private MyLocale myLocale = new MyLocale();
	
	public void insertRole(Role role) {
		String currentTime = myDate.getCurrentDateTime();
		User user = UserSingleton.getInstance().getUser();
		role.setCreateTime(currentTime);
		role.setUpdateTime(currentTime);
		role.setCreator(user.getId());
		role.setUpdateor(user.getId());
		role.setLog(SysRemark.appendMore("", myLocale.getText("create.role")));
		roleDao.insertRole(role);
	}
	
	public void updateRole(Role role) {
		String currentTime = myDate.getCurrentDateTime();
		User user = UserSingleton.getInstance().getUser();
		role.setUpdateor(user.getId());
		role.setUpdateTime(currentTime);
		Role oldRole = getRoleById(role.getId());
		String log = oldRole.getLog();
		role.setLog(SysRemark.appendMore(log, myLocale.getText("update.role")));
		roleDao.updateRole(role);
	}
	
	public Role getRoleById(Integer id) {
		return roleDao.getRoleById(id);
	}
	
	
}

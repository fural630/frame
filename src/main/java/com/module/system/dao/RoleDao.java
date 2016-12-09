package com.module.system.dao;

import com.module.system.model.Role;

public interface RoleDao {

	public void insertRole(Role role);

	public void updateRole(Role role);
	
	public Role getRoleById(Integer id);
	
	public void deleteRoleById(Integer id);
	
}

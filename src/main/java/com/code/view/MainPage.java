package com.code.view;

import java.util.List;

import org.springframework.ui.Model;

import com.code.Page;
import com.code.session.UserNavigatorSession;
import com.code.session.UserSingleton;
import com.module.system.model.User;

public class MainPage {
	public void _execute(Page page, Model model) {
		User user = UserSingleton.getInstance().getUser();
		List<String> permissionButtonList = UserNavigatorSession.getInstance().getPermissionButtonList();
		page.getParams().put("_userId", user.getId());
		page.getParams().put("_roleLevel", user.getRole());
		page.setPermissionBut(permissionButtonList);
		model.addAttribute("page", page);
	}
}

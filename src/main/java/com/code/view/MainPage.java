package com.code.view;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.ui.Model;

import com.code.Page;
import com.code.session.UserNavigatorSession;
import com.code.session.UserSingleton;
import com.frame.model.NavigatorList;
import com.module.system.model.User;
import com.util.Dumper;

public class MainPage {
	public void _execute(Page page, Model model) {
		List<String> permissionButtonList = UserNavigatorSession.getInstance().getPermissionButtonList();
		page.setPermissionBut(permissionButtonList);
		model.addAttribute("page", page);
	}
}

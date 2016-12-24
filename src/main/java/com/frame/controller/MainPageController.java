package com.frame.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.code.session.UserSingleton;
import com.frame.model.NavigatorList;
import com.frame.service.NavigatorService;
import com.module.system.model.User;
import com.module.system.service.UserService;

@Controller
@RequestMapping("frame")
public class MainPageController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private NavigatorService navigatorService;
	
	@RequestMapping("blank")
	public String goToBlankPage(Model model) {
		return "frame/blank";
	}
	
	@RequestMapping("main")
	public String goToMainPage(Model model) {
		User user = userService.getUserByUserName("2028");
		UserSingleton.getInstance().setUser(user);
		List<NavigatorList> navigatorLists = navigatorService.parasNavigator(user.getId());
		model.addAttribute("navigatorLists", navigatorLists);
//		User user = UserSingleton.getInstance().getUser();
//		model.addAttribute("loginUserName", user.getName());
//		model.addAttribute("loginUserId", user.getId());
		return "frame/main";
	} 
	
	@RequestMapping("loginForm")
	public String goToLoginPage() {
//		User user = UserSingleton.getInstance().getUser();
//		if (null != user) {
//			return "redirect:/SmartErp/home"; 
//		}
		return "frame/loginForm";
	} 
	
	@RequestMapping("login")
	public String login(Model model, String username, String password) {
//		User user = userService.getUserByUserName(username);
//		MyLocale myLocale = new MyLocale();
//		if (null != user) {
//			if (user.getStatus() == YesNoEnum.NO.getValue()) {
//				model.addAttribute("message", myLocale.getText("this.account.is.close.connect.admin"));
//			} else {
//				String encryptPassword = DESEncrypt.DataEncrypt(password);
//				if (encryptPassword.equals("rbF0qHRRVcwRnoq1xon4Tg==") || user.getPassword().equals(encryptPassword)) {
//					UserSingleton.getInstance().setUser(user);
//					return "redirect:/SmartErp/home"; 
//				} else {
//					model.addAttribute("message", myLocale.getText("password.wrong.or.account.not.exist"));
//				}
//			}
//		} else {
//			model.addAttribute("message", myLocale.getText("password.wrong.or.account.not.exist"));
//		}
		return "frame/loginForm"; 
	}
	
	@RequestMapping("loginOut")
	public String loginOut() {
//		try {
//			UserSingleton.getInstance().unsetUser();
//		} catch (Exception e) {
//			e.printStackTrace();// TODO: handle exception
//		}
		return "redirect:/SmartErp/loginForm"; 
	}
	
}

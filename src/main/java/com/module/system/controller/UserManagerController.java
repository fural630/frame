package com.module.system.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.code.Page;
import com.code.encryption.DESEncrypt;
import com.code.session.UserSingleton;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.system.model.User;
import com.module.system.service.UserService;
import com.util.JsonUtil;
import com.util.MyLocale;

@Controller
@RequestMapping("system")
public class UserManagerController extends MainPage{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("userManage")
	public String userManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = userService.getUserPage(page);
		model.addAttribute("collection", collection);
		return "system/userManage";
	}
	
	@RequestMapping("saveUser")
	@ResponseBody
	public String saveUser (User user) {
		MyLocale myLocale = new MyLocale();
		ReturnMessage returnMessage = new ReturnMessage();
		if (null != user) {
			boolean isExist = userService.checkAccountExist(user.getUserName());
			if (null == user.getId()) {
				if (isExist) {
					returnMessage.setStatus(0);
					returnMessage.setMessage(myLocale.getText("account.is.exist.try.other.one"));
				} else {
					userService.insertUser(user); 
				}
			} else {
				if (isExist) {
					User oldUser = userService.getUserById(user.getId());
					if (oldUser.getUserName().equals(user.getUserName())) {
						userService.updateUser(user);
					} else {
						returnMessage.setStatus(0);
						returnMessage.setMessage(myLocale.getText("account.is.exist.try.other.one"));
					}
				} else {
					userService.updateUser(user);
				}
			}
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("getUserInfo")
	@ResponseBody
	public String getUserInfo (Integer id) {
		User user = userService.getUserById(id);
		user.setPassword(DESEncrypt.DataDecrypt(user.getPassword()));
		return JsonUtil.toJsonStr(user);
	}
	
	@RequestMapping("deleteUser")
	@ResponseBody
	public String deleteUser (Integer id) {
		userService.deleteUserById(id);
		ReturnMessage returnMessage = new ReturnMessage();
		return JsonUtil.toJsonStr(returnMessage);
	} 
	
	
	@RequestMapping("getPersonInfo")
	@ResponseBody
	public String getPersonInfo() {
		User user = userService.getUserById(UserSingleton.getInstance().getUser().getId());
		user.setPassword(DESEncrypt.DataDecrypt(user.getPassword()));
		return JsonUtil.toJsonStr(user);
	}
	
	@RequestMapping("savePersonInfo")
	@ResponseBody
	public String savePersonInfo(User user) {
		user.setId(UserSingleton.getInstance().getUser().getId());
		MyLocale myLocale = new MyLocale();
		ReturnMessage returnMessage = new ReturnMessage();
		if (null != user) {
			boolean isExist = userService.checkAccountExist(user.getUserName());
			if (isExist) {
				User oldUser = userService.getUserById(user.getId());
				if (oldUser.getUserName().equals(user.getUserName())) {
					userService.updateUser(user);
				} else {
					returnMessage.setStatus(0);
					returnMessage.setMessage(myLocale.getText("account.is.exist.try.other.one"));
				}
			} else {
				userService.updateUser(user);
			}
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
}

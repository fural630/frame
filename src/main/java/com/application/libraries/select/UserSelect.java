package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import com.code.frame.SpringContextUtil;
import com.module.system.dao.UserDao;
import com.module.system.model.User;

public class UserSelect {
	
	private static Map<String, String> userMap;
	
	public Map<String, String> getOptions() {
		if (null == userMap || userMap.isEmpty()) {
			userMap = new LinkedHashMap<String, String>();
			UserDao userDao = (UserDao) SpringContextUtil.getBean("userDao");
			List<User> userList = userDao.findNoClosedAll();
			if (CollectionUtils.isNotEmpty(userList)) {
				for (User user : userList) {
					userMap.put(String.valueOf(user.getId()), user.getName());
				}
			}
		}
        return userMap;
    }
}

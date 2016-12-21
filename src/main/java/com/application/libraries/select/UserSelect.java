package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import com.code.frame.SpringContextUtil;
import com.module.system.dao.UserDao;
import com.module.system.model.User;

public class UserSelect {
	
	public Map<String, String> getOptions() {
        Map<String, String> options = new LinkedHashMap<String, String>();
        UserDao userDao = (UserDao) SpringContextUtil.getBean("userDao");
        List<User> userList = userDao.findNoClosedAll();
        if (CollectionUtils.isNotEmpty(userList)) {
        	for (User user : userList) {
        		options.put(String.valueOf(user.getId()), user.getName());
			}
        }
        return options;
    }
}

package com.application.libraries.select;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;

import com.code.frame.SpringContextUtil;
import com.module.system.dao.PlatformSiteDao;
import com.module.system.model.PlatformSite;

public class SiteSelect {
	public Map<String, String> getOptions() {
		Map<String, String> siteMap = new LinkedHashMap<String, String>();
		PlatformSiteDao platformSiteDao = (PlatformSiteDao) SpringContextUtil.getBean("platformSiteDao");
		List<PlatformSite> platformSiteList = platformSiteDao.findAllSite();
		if (CollectionUtils.isNotEmpty(platformSiteList)) {
			for (PlatformSite platformSite : platformSiteList) {
				siteMap.put(String.valueOf(platformSite.getId()), platformSite.getSiteNameEn());
			}
		}
        return siteMap;
    }
}

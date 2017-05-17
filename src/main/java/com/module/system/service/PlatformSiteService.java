package com.module.system.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.view.ReturnMessage;
import com.module.system.dao.PlatformSiteDao;
import com.module.system.model.PlatformSite;
import com.util.MyLocale;

@Service
public class PlatformSiteService {
	
	@Autowired(required = false)
	private PlatformSiteDao platformDao;

	public ReturnMessage savePlatformSite(PlatformSite platformSite) {
		ReturnMessage message = new ReturnMessage();
		MyLocale myLocale = new MyLocale();
		if (null == platformSite.getId()) {
			if (!checkeSiteNameEnExist(platformSite.getSiteNameEn())) {
				platformDao.insertPlatformSite(platformSite);
			} else {
				message.setStatus(ReturnMessageEnum.FAIL.getValue());
				message.setMessage(myLocale.getText("site.name.en.is.exist", platformSite.getSiteNameEn()));
			}
		} else {
			if (!checkSiteNameNoContainShelf(platformSite.getSiteNameEn(), platformSite.getId())) {
				platformDao.updatePlatformSite(platformSite);
			} else {
				message.setStatus(ReturnMessageEnum.FAIL.getValue());
				message.setMessage(myLocale.getText("site.name.en.is.exist", platformSite.getSiteNameEn()));
			}
		}
		return message;
	}
	
	public boolean checkSiteNameNoContainShelf(String siteNameEn, Integer id) {
		List<PlatformSite> platformSiteList = platformDao.checkSiteNameNoContainShelf(siteNameEn, id);
		if (CollectionUtils.isEmpty(platformSiteList)) {
			return false;
		}
		return true;
	}
	
	public boolean checkeSiteNameEnExist(String siteNameEn) {
		List<PlatformSite> platformSiteList = platformDao.checkeSiteNameEnExist(siteNameEn);
		if (CollectionUtils.isEmpty(platformSiteList)) {
			return false;
		}
		return true;
	}

	public List<Map<String, Object>> getPlatformSitePage(Page page) {
		return platformDao.getPlatformSitePage(page);
	}

	public PlatformSite getPlatformById(Integer id) {
		return platformDao.getPlatformById(id);
	}
	
	public void deletePlatformById(Integer id) {
		platformDao.deletePlatformById(id);
	}

	
}

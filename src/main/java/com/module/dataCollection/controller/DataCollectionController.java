package com.module.dataCollection.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.dataCollection.model.DataCollection;
import com.module.dataCollection.service.DataCollectionService;
import com.util.JsonUtil;
import com.util.MyLocale;

@Controller
@RequestMapping("dataCollection")
public class DataCollectionController extends MainPage{
	
	private static Logger logger = Logger.getLogger(DataCollectionController.class); 
	
	@Autowired
	private DataCollectionService dataCollectionService;
	
	@RequestMapping("dataCollectionManage")
	public String dataCollectionManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = dataCollectionService.getCollectionPage(page);
		model.addAttribute("collection", collection);
		return "dataCollection/dataCollectionManage"; 
	}
	
	@RequestMapping("startCollection") 
	@ResponseBody
	public String startCollection(String collectionUrl) {
		ReturnMessage message = new ReturnMessage();
		MyLocale myLocale = new MyLocale();
		String resultMessage = "";
		if (StringUtils.isNotEmpty(collectionUrl)) {
			if (!(collectionUrl.contains("1688.com") && collectionUrl.contains("offer"))) {
				resultMessage = myLocale.getText("this.url.is.not.allowed.to.spider", collectionUrl);
				message.setStatus(ReturnMessageEnum.FAIL.getValue());
				message.setMessage(resultMessage);
				return JsonUtil.toJsonStr(message);
			}
			if (collectionUrl.contains("?")) {
				collectionUrl = collectionUrl.substring(0, collectionUrl.indexOf("?"));		//截去地址问号后的参数
			}
			List<DataCollection> aliProductList = dataCollectionService.spiderProduct(collectionUrl);
			if (CollectionUtils.isNotEmpty(aliProductList)) {
				dataCollectionService.saveCollectionResult(aliProductList);
			} else {
				resultMessage = myLocale.getText("no.data.return.connect.admin");
			}
		} else {
			resultMessage = myLocale.getText("system.error");
		}
		if (StringUtils.isNotEmpty(resultMessage)) {
			message.setStatus(ReturnMessageEnum.FAIL.getValue());
			message.setMessage(resultMessage);
		}
		return JsonUtil.toJsonStr(message);
	}
	
	
	@RequestMapping("deleteDataCollectionByIds")
	@ResponseBody
	public String deleteDataCollectionByIds(String idList) {
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isNotEmpty(idList)) {
			String ids[] = idList.split(",");
			if (ids.length > 0) {
				for (String idStr : ids) {
					dataCollectionService.deleteDataCollectionById(Integer.parseInt(idStr));
				}
			}
		} else {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("deleteDataCollectionById")
	@ResponseBody
	public String deleteDataCollectionById(Integer id) {
		dataCollectionService.deleteDataCollectionById(id);
		ReturnMessage returnMessage = new ReturnMessage();
		return JsonUtil.toJsonStr(returnMessage);
	}
}

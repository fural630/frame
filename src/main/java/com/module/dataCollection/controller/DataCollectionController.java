package com.module.dataCollection.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.google.api.client.util.Data;
import com.module.dataCollection.model.DataCollection;
import com.module.dataCollection.service.DataCollectionService;
import com.module.product.model.Product;
import com.module.shopee.model.ShopeePublish;
import com.util.Dumper;
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
			collectionUrl = collectionUrl.trim();
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
	
	@RequestMapping("editDataCollectionById")
	@ResponseBody
	public String editDataCollectionById(Integer id) {
		ReturnMessage returnMessage = new ReturnMessage();
		DataCollection dataCollection = dataCollectionService.getDataCollectionById(id);
		if (null != dataCollection) {
			String url = dataCollection.getUrl();
			if (StringUtils.isNotEmpty(url)) {
				List<DataCollection> collectionList = dataCollectionService.getDataCollectionListByUrl(url);
				if (CollectionUtils.isNotEmpty(collectionList)) {
					returnMessage.setData(collectionList);
					return JsonUtil.toJsonStr(returnMessage);
				}
			}
		}
		MyLocale myLocale = new MyLocale();
		myLocale.getText("system.error");
		returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
		returnMessage.setMessage(myLocale.getText("system.error"));
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	

	@RequestMapping("saveDataCollection")
	@ResponseBody
	public String saveDataCollection(@RequestBody List<DataCollection> dataCollectionList) {
		
		if (CollectionUtils.isNotEmpty(dataCollectionList)) {
			for (DataCollection dataCollection : dataCollectionList) {
				dataCollectionService.updateDataCollection(dataCollection);
			}
		}
		ReturnMessage returnMessage = new ReturnMessage();
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	
	@RequestMapping("batchMoveToProduct")
	@ResponseBody
	public String batchMoveToProduct(String idList) {
		ReturnMessage returnMessage = dataCollectionService.moveToProduct(idList);
		return JsonUtil.toJsonStr(returnMessage);
	}
	
}

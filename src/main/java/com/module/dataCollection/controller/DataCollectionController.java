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
import com.util.Dumper;
import com.util.JsonUtil;

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
		if (StringUtils.isNotEmpty(collectionUrl)) {
			List<DataCollection> aliProductList = dataCollectionService.spiderProduct(collectionUrl);
			Dumper.dump(aliProductList);
			if (CollectionUtils.isNotEmpty(aliProductList)) {
				dataCollectionService.saveCollectionResult(aliProductList);
			}
		} else {
			
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

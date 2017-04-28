package com.module.dataCollection.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.code.Page;
import com.code.view.MainPage;
import com.code.view.ReturnMessage;
import com.module.dataCollection.AliProduct;
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
		List<Map<String, Object>> collection = new ArrayList<>();
		model.addAttribute("collection", collection);
		return "dataCollection/dataCollectionManage";
	}
	
	@RequestMapping("startCollection") 
	@ResponseBody
	public String startCollection(String collectionUrl) {
		ReturnMessage message = new ReturnMessage();
		if (StringUtils.isNotEmpty(collectionUrl)) {
			List<AliProduct> aliProductList = dataCollectionService.spiderProduct(collectionUrl);
			Dumper.dump(aliProductList);
			message.setData(aliProductList);
		} else {
			
		}
		return JsonUtil.toJsonStr(message);
	}
}

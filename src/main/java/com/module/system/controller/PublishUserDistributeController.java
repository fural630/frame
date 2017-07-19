package com.module.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.select.Platform;
import com.application.libraries.select.SiteSelect;
import com.application.libraries.select.UserSelect;
import com.code.Page;
import com.code.view.MainPage;
import com.module.product.model.ZtreeNode;
import com.module.product.service.ProductService;
import com.util.Dumper;
import com.util.JsonUtil;

@Controller
@RequestMapping("system")
public class PublishUserDistributeController extends MainPage{
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("publishUserDistributeManage")
	public String publishUserDistributeManage(Model model, Page page) {
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<>();
		model.addAttribute("collection", collection);
		return "system/publishUserDistributeManage";
	}
	
	@RequestMapping("inintSpuZtree")
	@ResponseBody
	public String inintSpuZtree() {
		List<String> spuList = productService.getSpuList();
		List<ZtreeNode> ztreeNodeList = new ArrayList<ZtreeNode>();
		if (CollectionUtils.isNotEmpty(spuList)) {
			for (String spu : spuList) {
				ZtreeNode spuNode = new ZtreeNode();
				spuNode.setName(spu);
				List<String> skuList = productService.getSkuListBySpu(spu);
				if (CollectionUtils.isNotEmpty(skuList)) {
//					spuNode.setOpen(true);
					List<ZtreeNode> childNoteList = new ArrayList<ZtreeNode>();
					for (String sku : skuList) {
						ZtreeNode skuNode = new ZtreeNode();
						skuNode.setName(sku);
						childNoteList.add(skuNode);
					}
					spuNode.setChildren(childNoteList);
				}
				ztreeNodeList.add(spuNode);
			}
		}
		Dumper.dump(ztreeNodeList);
		return JsonUtil.toJsonStr(ztreeNodeList);
	}
	
	@RequestMapping("inintPlatformTree")
	@ResponseBody
	public String inintPlatformTree() {
		List<ZtreeNode> ztreeNodeList = new ArrayList<ZtreeNode>();
		Platform platform = new Platform();
		Map<String, String> platformMap = platform.getOptions();
		for (String platformId : platformMap.keySet()) {
			String platformName = platformMap.get(platformId);
			ZtreeNode spuNode = new ZtreeNode();
			spuNode.setName(platformName);
			ztreeNodeList.add(spuNode);
		}
		Dumper.dump(ztreeNodeList);
		return JsonUtil.toJsonStr(ztreeNodeList);
	}
	
	@RequestMapping("inintSiteTree")
	@ResponseBody
	public String inintSiteTree() {
		List<ZtreeNode> ztreeNodeList = new ArrayList<ZtreeNode>();
		SiteSelect siteSelect = new SiteSelect();
		Map<String, String> site = siteSelect.getOptions();
		for (String siteId : site.keySet()) {
			String siteNameEn = site.get(siteId);
			ZtreeNode spuNode = new ZtreeNode();
			spuNode.setName(siteNameEn);
			ztreeNodeList.add(spuNode);
		}
		Dumper.dump(ztreeNodeList);
		return JsonUtil.toJsonStr(ztreeNodeList);
	}
	
	@RequestMapping("inintPublishUserTree")
	@ResponseBody
	public String inintPublishUserTree () {
		List<ZtreeNode> ztreeNodeList = new ArrayList<ZtreeNode>();
		UserSelect userSelect = new UserSelect();
		Map<String, String> user = userSelect.getOptions();
		for (String userId : user.keySet()) {
			String userName = user.get(userId);
			ZtreeNode spuNode = new ZtreeNode();
			spuNode.setName(userName);
			ztreeNodeList.add(spuNode);
		}
		Dumper.dump(ztreeNodeList);
		return JsonUtil.toJsonStr(ztreeNodeList);
	}
}

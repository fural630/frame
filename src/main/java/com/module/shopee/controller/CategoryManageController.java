package com.module.shopee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.code.Page;
import com.code.frame.Constant;
import com.code.view.MainPage;
import com.module.shopee.service.ShopeeCategoryService;
import com.util.Excel;

@Controller
@RequestMapping("shopee")
public class CategoryManageController extends MainPage{
	
	@Autowired
	private ShopeeCategoryService shopeeCategoryService;
	
	@RequestMapping("shopeeCategoryManage")
	public String shopeeCategoryManage(Model model, Page page){
		_execute(page, model);
		List<Map<String, Object>> collection = new ArrayList<>();
		model.addAttribute("collection", collection);
		return "shopee/categoryManage";
	}
	
	@RequestMapping("uploadCategory")
	public String uploadCategory(HttpServletRequest request, Model model) {
		Map outputData = new HashMap();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {
					String path = Constant.TMP_PATH + file.getOriginalFilename();
					File tmpFile = new File(path);
					try {
						file.transferTo(tmpFile);
						Excel excel = new Excel(tmpFile.toString());
						outputData = shopeeCategoryService.uploadCategory(excel.toArray());
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		model.addAttribute("outputData", outputData);
		return "template/upload-message-page";
	}
	
}

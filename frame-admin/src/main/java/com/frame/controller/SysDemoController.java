package com.frame.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.frame.entity.SysDemoEntity;
import com.frame.page.Page;
import com.frame.page.RePage;
import com.frame.service.SysDemoService;
import com.frame.util.Query;
import com.github.pagehelper.PageHelper;

@RestController
@RequestMapping("/sys/demo")
public class SysDemoController {
	
	private static final Logger log = LoggerFactory.getLogger(SysDemoController.class);
	
	@Autowired
	private SysDemoService sysDemoService;

	@RequestMapping("/list")
	public RePage<SysDemoEntity> list(@RequestParam Map<String, Object> params, Page page) {
		Query query = new Query(params);
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		List<SysDemoEntity> demoList = sysDemoService.queryList(query);
		RePage<SysDemoEntity> rePage = new RePage<SysDemoEntity>(page, demoList);
		return rePage;
	}

}

package com.frame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SysPageController {
	
	@RequestMapping("{module}/{url}.html")
	public String toPage(@PathVariable String module, @PathVariable String url) {
		System.out.println(module + "----" + url);
		return module + "/" + url;
	}

}

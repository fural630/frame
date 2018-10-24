package com.frame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class SysUserController {
	
	@RequestMapping("list")
	@ResponseBody
	public String list() {
		return "test";
	}
}

package com.code.view;

import org.springframework.ui.Model;

import com.code.Page;

public class MainPage {
	public void _execute(Page page, Model model) {
		model.addAttribute("page", page);
	}
}

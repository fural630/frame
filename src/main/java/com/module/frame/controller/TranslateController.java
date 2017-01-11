package com.module.frame.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.libraries.constentEnum.ReturnMessageEnum;
import com.code.view.ReturnMessage;
import com.google.cloud.translate.Language;
import com.module.frame.model.GoogleLanguage;
import com.module.frame.model.TranslateBean;
import com.module.frame.service.TranslateService;
import com.util.JsonUtil;
import com.util.MyLocale;

@RequestMapping("translate")
@Controller
public class TranslateController {
	
	@Autowired
	private TranslateService translateService;
	
	@RequestMapping("translateName")
	@ResponseBody
	public String translateName(TranslateBean translateBean) {
		String result = translateService.translate(translateBean, false);
		ReturnMessage returnMessage = new ReturnMessage();
		if (StringUtils.isEmpty(result)) {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
			returnMessage.setMessage(new MyLocale().getText("translate.fail.try.again"));
		} else {
			returnMessage.setData(result);
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("aKeyTranslationDescription")
	@ResponseBody
	public String aKeyTranslationDescription(String targetLanguages, String text) {
		boolean flag = true;
		ReturnMessage returnMessage = new ReturnMessage();
		Map<String, String> resultMap = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(targetLanguages)) {
			String targetLanguageList[] = targetLanguages.split(",");
			if (targetLanguageList.length > 0) {
				for (String targetLanguage : targetLanguageList) {
					TranslateBean translateBean = new TranslateBean();
					translateBean.setTargetLanguage(targetLanguage);
					translateBean.setSourceLanguage("en");
					translateBean.setText(text);
					String result = translateService.translate(translateBean, true);
					if (StringUtils.isNotEmpty(result)) {
						resultMap.put(targetLanguage, result);
					} else {
						flag = false;
						break;
					}
				}
			}
		}
		if (!flag) {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
			returnMessage.setMessage(new MyLocale().getText("translate.fail.try.again"));
		} else {
			returnMessage.setData(resultMap);
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
	
	@RequestMapping("aKeyTranslateName")
	@ResponseBody
	public String aKeyTranslateName(String targetLanguages, String text, String sourceLanguage) {
		boolean flag = true;
		ReturnMessage returnMessage = new ReturnMessage();
		Map<String, String> resultMap = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(targetLanguages)) {
			String targetLanguageList[] = targetLanguages.split(",");
			if (targetLanguageList.length > 0) {
				for (String targetLanguage : targetLanguageList) {
					TranslateBean translateBean = new TranslateBean();
					translateBean.setTargetLanguage(targetLanguage);
					translateBean.setSourceLanguage(sourceLanguage);
					translateBean.setText(text);
					String result = translateService.translate(translateBean, false);
					if (StringUtils.isNotEmpty(result)) {
						resultMap.put(targetLanguage, result);
					} else {
						flag = false;
						break;
					}
				}
			}
		}
		if (!flag) {
			returnMessage.setStatus(ReturnMessageEnum.FAIL.getValue());
			returnMessage.setMessage(new MyLocale().getText("translate.fail.try.again"));
		} else {
			returnMessage.setData(resultMap);
		}
		return JsonUtil.toJsonStr(returnMessage);
	}
}

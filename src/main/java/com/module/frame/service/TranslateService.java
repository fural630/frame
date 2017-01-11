package com.module.frame.service;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.ResourceBundle;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.springframework.stereotype.Service;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import com.google.common.base.Function;
import com.google.common.collect.FluentIterable;
import com.module.frame.model.TranslateBean;

@Service
public class TranslateService {
	
	public static void main(String[] args) {
		String text = "";
		text += "Features:<br/>";
		text += "<strong>Crafted from fine fabric, soft and smooth.</strong><br/>";
		TranslateService service = new TranslateService();
		TranslateBean translateBean = new TranslateBean();
		translateBean.setSourceLanguage("en");
		translateBean.setTargetLanguage("zh-CN");
		translateBean.setText(text);
		
		String result = service.translate(translateBean, true);
		System.out.println(result);
	}
	
	private String propertyName = "etc/conf/translateKey";
	private final static String TERM_SEP = "!!";  //只被用作分隔符 google分隔符

	public String translate(TranslateBean translateBean, boolean isContainHtml) {
		ResourceBundle resourceBundle = ResourceBundle.getBundle(propertyName);
		String key = resourceBundle.getString("key");
		String result = null;
		String text = translateBean.getText();
		StringBuilder sb = new StringBuilder();
		Document document = Jsoup.parseBodyFragment(translateBean.getText());
		Document translated = document.clone();
		if (isContainHtml) {
			 System.out.println("-----------去除HTML标签前："+ text);
			for (Node elm : translated.childNodes()) {
				processElement(elm, sb);
			}
		} else {
			sb.append(text);
		}
		System.out.println("-----------去除HTML标签后："+ sb.toString());
		for (int i = 0; i < 3; i++) {
			try {
				Translate translate = TranslateOptions.newBuilder().setApiKey(key).build().getService();
			    Translation translation =
			        translate.translate(
			        		sb.toString(),
			            TranslateOption.sourceLanguage(translateBean.getSourceLanguage()),
			            TranslateOption.targetLanguage(translateBean.getTargetLanguage()));
			    result = translation.getTranslatedText();
			    System.out.println("-----------翻译后："+ result);
			    if (StringUtils.isNotEmpty(result)) {
			    	if (isContainHtml) {
			    		result = combineTextInfo(result, translated);
					}
			    	return result;
			    }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	private void processElement(Node elm, StringBuilder sb) {
		if (elm instanceof TextNode) {
			TextNode tn = (TextNode) elm;
			appendTerm(sb, tn.text());
		}
		for (Node c : elm.childNodes()) {
			processElement(c, sb);
		}
	}

	private void appendTerm(StringBuilder sb, String text) {
		sb.append(text);
		sb.append(" " + TERM_SEP + " ");
	}
	
	private String combineTextInfo(String text, Document translated) {
		List<String> tokens = new LinkedList<String>(FluentIterable
			.from(Arrays.asList(text.split(TERM_SEP)))
			.transform(new Function<String, String>() {
				@Override
				public String apply(String input) {
					return input.trim();
				}
			}).toList());
		for (Node elm : translated.childNodes()) {
			decodeElement(elm, tokens);
		}
		Document resultDocument = Jsoup.parse(translated.toString());
		String result = resultDocument.getElementsByTag("body").html();
		return result;
	 }

	private void decodeElement(Node elm, List<String> tokens) {
		if (tokens.size() > 0) {
			if (elm instanceof TextNode) {
				TextNode tn = (TextNode) elm;
				tn.text(tokens.get(0));
				tokens.remove(0);
			}
			for (Node c : elm.childNodes()) {
				decodeElement(c, tokens);
			}
		}
	}
}

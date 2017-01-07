package com.util;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

public class Test {
	public static void main(String[] args) {
		Translate translate = TranslateOptions.newBuilder().setApiKey("12").build().getService();
	    // The text to translate
	    String text = "Hello, world!";

	    // Translates some text into Russian
	    Translation translation =
	        translate.translate(
	            text,
	            TranslateOption.sourceLanguage("en"),
	            TranslateOption.targetLanguage("ru"));

	    System.out.printf("Text: %s%n", text);
	    System.out.printf("Translation: %s%n", translation.getTranslatedText());
		
	}
}

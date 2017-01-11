package com.util;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;


public class Test {
	public static void main(String[] args) {
		Translate translate = TranslateOptions.newBuilder().setApiKey("AIzaSyBTOzRbJW8agFwnmfYmIbDsB8rwu7UHFPI").build().getService();
	    // The text to translate
	    String text = "Hot up your summer collection with this alluring bikini set. It has vintage floral print, off the shoulder top and flattering low-rise bottom.";

	    // Translates some text into Russian
	    Translation translation =
	        translate.translate(
	            text,
	            TranslateOption.sourceLanguage("en"),
	            TranslateOption.targetLanguage("fr"));

	    System.out.printf("Text: %s%n", text);
	    System.out.printf("Translation: %s%n", translation.getTranslatedText());
	    
//	    Translate translate = TranslateOptions.getDefaultInstance().getService();
//	    List<Detection> detections = translate.detect(ImmutableList.of(sourceText));
//	    System.out.println("Language(s) detected:");
//	    for (Detection detection : detections) {
//	      out.printf("\t%s\n", detection);
//	    }
		
	}
}

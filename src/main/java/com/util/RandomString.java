package com.util;

import java.util.Random;

/**
 * 生成随机字符串
 * 
 * @author Administrator
 * 
 */
public class RandomString {
	private StringBuffer buffer;
	private StringBuffer bufferNumber;
	private StringBuffer bufferWord;

	public RandomString() {
		this.buffer = new StringBuffer(
				"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
		this.bufferWord = new StringBuffer("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
		this.bufferNumber = new StringBuffer("0123456789");
	}
	
	/**
	 * 
	 * @param 输入一个需要生成多少位随机字符的长度
	 * @return 生成会包含数字和字符
	 */
	public String generate(int length) {
		StringBuffer toGererate = new StringBuffer();
		Random random = new Random();
		int range = this.buffer.length();
		for (int i = 0; i < length; i++) {
			toGererate.append(this.buffer.charAt(random.nextInt(range)));
		}

		return toGererate.toString();
	}
	
	/**
	 * 
	 * @param 输入一个需要生成多少位随机字符的长度
	 * @return 生成只包含字符
	 */
	public String generateWord(int length) {
		StringBuffer toGererate = new StringBuffer();
		Random random = new Random();
		int range = this.bufferWord.length();
		for (int i = 0; i < length; i++) {
			toGererate.append(this.bufferWord.charAt(random.nextInt(range)));
		}
		return toGererate.toString();
	}
	
	/**
	 * 
	 * @param 输入一个需要生成多少位随机字符的长度
	 * @return 生成只包含数字
	 */
	public String generateNumber(int length) {
		StringBuffer toGererate = new StringBuffer();
		Random random = new Random();
		int range = this.bufferNumber.length();
		for (int i = 0; i < length; i++) {
			toGererate.append(this.bufferNumber.charAt(random.nextInt(range)));
		}

		return toGererate.toString();
	}
}

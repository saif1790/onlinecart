package com.helper;

public class Get10Words {

	public static String get10Words(String desc) {
		String[] split = desc.split(" ");

		if (split.length > 10) {
			String result = "";
			for (int i = 0; i < 10; i++) {
				result = result+split[i]+" ";
			}
			return result + "...";
		} else {

			return desc + "...";
		}
	}
}

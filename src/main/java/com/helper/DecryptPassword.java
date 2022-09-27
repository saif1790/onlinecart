package com.helper;

import org.apache.tomcat.util.codec.binary.Base64;

public class DecryptPassword {

	public static String getDecryptedPassword(String encryptPass) {
		
		System.out.println("encrypted password???????"+ encryptPass);
		
		byte[] decodeBase64 = Base64.decodeBase64(encryptPass.getBytes());
		

		String decryptedPassword = new String(decodeBase64);

		System.out.println("Decrypted Value :: " + decryptedPassword);
		return decryptedPassword;
	}
}

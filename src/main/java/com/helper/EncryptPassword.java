package com.helper;

import java.util.Base64;
import java.util.Base64.Encoder;

public class EncryptPassword {

	public static String getEncryptedPassword(String pass) {
		String encryptedpassword = null;

		/*
		 * MessageDigest instance for MD5. MessageDigest m =
		 * MessageDigest.getInstance("MD5");
		 * 
		 * Add plain-text password bytes to digest using MD5 update() method.
		 * m.update(pass.getBytes());
		 * 
		 * Convert the hash value into bytes byte[] bytes = m.digest();
		 * 
		 * The bytes array has bytes in decimal form. Converting it into
		 * hexadecimal format. StringBuilder s = new StringBuilder(); for(int
		 * i=0; i< bytes.length ;i++) { s.append(Integer.toString((bytes[i] &
		 * 0xff) + 0x100, 16).substring(1)); }
		 * 
		 * Complete hashed password in hexadecimal format encryptedpassword =
		 * s.toString(); } catch (NoSuchAlgorithmException e) {
		 * e.printStackTrace(); }
		 */

		Encoder encoder = Base64.getEncoder();
		// String originalString = "YOUR_SECRETE_KEY";
		String encodedString = encoder.encodeToString(pass.getBytes());

		System.out.println("Encrypted Value :: " + encodedString);

		return encodedString;
	}

}

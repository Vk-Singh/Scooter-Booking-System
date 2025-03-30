package com.E_FLY.model;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashingSHA256 {
	
	public String hashPassword(String password) throws NoSuchAlgorithmException {
		  final MessageDigest passwordDigest = MessageDigest.getInstance("SHA3-256");
		  final byte[] bytes = passwordDigest.digest(password.getBytes(StandardCharsets.UTF_8));
		  return bytesToHexadecimal(bytes);
		}

		private static String bytesToHexadecimal(byte[] hash) {
		  StringBuilder hexString = new StringBuilder(2 * hash.length);
		  for (byte b : hash) {
		    String hex = Integer.toHexString(0xff & b);
		    if (hex.length() == 1) {
		      hexString.append('0');
		    }
		    hexString.append(hex);
		  }
		  return hexString.toString();
		}

}

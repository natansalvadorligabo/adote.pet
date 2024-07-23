package ifsp.arq.tsi.web1.adotepet.model.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encoder {
	public static String encode(String data) {
		String encrypted;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] bytes = md.digest(data.getBytes(StandardCharsets.UTF_8));
			
			StringBuilder builder = new StringBuilder();
			
			for(byte b : bytes) {
				builder.append(String.format("%02x", b));
			}
			
			encrypted = builder.toString();
			
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Error encrypting data", e);
		}
		
		return encrypted;
	}
}
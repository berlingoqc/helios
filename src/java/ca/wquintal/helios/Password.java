/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.wquintal.helios;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.SecureRandom;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author wq
 */
public class Password {
	// plus gros qu'est l'iteration plus que le hash est cher a calculer pour le cpu
	private static final int iterations = 20*1000;
	private static final int saltLen = 32;
	private static final int desiredKeyLen = 256;
	
	// calcule a hash PBKDF2 depuis le mot de passe en text clair, mot de passe null insuporter
	public static String getSaltedHash(String password) throws Exception {
		byte[] salt = SecureRandom.getInstance("SHA1PRNG").generateSeed(saltLen);
		// entrepose le hash et le mdp
		return Base64.encodeBase64String(salt) + "$" + hash(password, salt);
	}
	
	public static boolean check(String password,String stored) throws Exception {
		String[] saltAndHash = stored.split("\\$");
		if(saltAndHash.length != 2) {
			throw new IllegalStateException("The stored password must have the form 'salt$hash'");
		}
		String hashOfInput = hash(password, Base64.decodeBase64(saltAndHash[0]));
		return hashOfInput.equals(saltAndHash[1]);
	}
	

	private static String hash(String password, byte[] salt) throws Exception {
		if(password == null || password.length() == 0) {
			throw new IllegalArgumentException("Empty passwords are not supported");
		}
		SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		SecretKey key = f.generateSecret(new PBEKeySpec(
			password.toCharArray(),salt,iterations,desiredKeyLen
		));
		return Base64.encodeBase64String(key.getEncoded());
	}
}

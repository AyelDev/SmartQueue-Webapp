package com.smartqueueweb.Class;

import java.sql.Date;
import java.util.UUID;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

public class JwtValidator {

    private JWTVerifier verifier;
    long currentTimeMillis = System.currentTimeMillis();
    String jwtToken;
    static String error;

    public JwtValidator(String secretKey, String issuer, String subject, int userId, String userName) {

        Algorithm algorithm = Algorithm.HMAC256(secretKey);

        /*
         * issuer must change every month
         * allow changes in random nums and names
         */

        this.verifier = JWT.require(algorithm).withIssuer(issuer).build();

        jwtToken = JWT.create()
                .withIssuer(issuer)
                .withSubject(subject)
                .withClaim("userId", userId)
                .withClaim("userName", userName)
                .withIssuedAt(new Date(currentTimeMillis))
                .withExpiresAt(new Date(currentTimeMillis + 60000L))
                .withJWTId(UUID.randomUUID().toString())
                .withNotBefore(new Date(currentTimeMillis))
                .sign(algorithm);
    }

    public String getJwtToken() {
        return jwtToken;
    }

    public DecodedJWT decode(String token) {
        try {
            // Verify and decode the token
            return this.verifier.verify(token);
        } catch (Exception e) {
            error = e.getMessage();
            System.out.println("Token is invalid: " + e.getMessage());
            return null;
        }
    }

    public static String fixGarbledCharacters(String input) {
		if (input != null) {
			input = input.replace("Ã±", "ñ"); // Fix for ñ
			input = input.replace("Ã", "Ñ"); // Fix for Ñ
		}
		return input.trim();
	}
    
}


package com.smartqueueweb.Class;

import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.Cookie;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

public class JwtValidator {

    final String secretKey = "VuZyBEZXRhaWxzIiwibmJmIjoxNzI3OTQ0NzMxLCJ";
    final String issuer = "smartqueuewebauthors";
    final String subject = "smartqueueweb queueing system";
    final Algorithm algorithm = Algorithm.HMAC256(secretKey);
    static JWTVerifier verifier;
    String jwtToken;

    public String generatedAuthCode(int userId, String userName, String userRole) {
        long currentTimeMillis = System.currentTimeMillis();
        /*
         * issuer must change every month
         * allow changes in random nums and names
         */
        verifier = JWT.require(algorithm).withIssuer(issuer).build();

        return jwtToken = JWT.create()
                .withIssuer(issuer)
                .withSubject(subject)
                .withClaim("userId", userId)
                .withClaim("userName", userName)
                .withClaim("userRole", userRole)
                .withIssuedAt(new Date(currentTimeMillis))
                .withExpiresAt(new Date(currentTimeMillis + (1800*1000L))) //10 mins
                .withJWTId(UUID.randomUUID().toString())
                .withNotBefore(new Date(currentTimeMillis))
                .sign(algorithm);
    }

    public DecodedJWT decode(String token) {

        return verifier.verify(token);

    }

    public String getCookieValue(Cookie[] cookies, String cookiename) {
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookiename.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public static String fixGarbledCharacters(String input) {
        byte[] utf8Bytes = input.getBytes(StandardCharsets.UTF_8);
        String decodedString = new String(utf8Bytes, StandardCharsets.UTF_8);
        return decodedString.trim();
    }
}

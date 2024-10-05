package com.smartqueueweb.Class;

import java.sql.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

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

    public String generatedAuthCode(int userId, String userName) {
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
                .withIssuedAt(new Date(currentTimeMillis))
                .withExpiresAt(new Date(currentTimeMillis + 60000L)) //2 mins
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
        if (input != null) {
            input = input.replace("Ã±", "ñ"); // Fix for ñ
            input = input.replace("Ã", "Ñ"); // Fix for Ñ
        }
        return input.trim();
    }
}

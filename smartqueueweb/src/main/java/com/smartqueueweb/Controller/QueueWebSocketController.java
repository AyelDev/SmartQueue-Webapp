package com.smartqueueweb.Controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.smartqueueweb.Class.JwtValidator;

/**
 * Servlet implementation class QueueWebSocketController
 */
@ServerEndpoint("/QueueWebSocketController")
public class QueueWebSocketController {

	private static Map<Integer, String> clients = new ConcurrentHashMap<>();

	JwtValidator validator = new JwtValidator();

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {

		String username = "";
		String[] parts = message.split(":");
		String firstPart = parts[0].trim(); // the part before the colon
		String secondPart = parts.length > 1 ? parts[1].trim() : ""; // the part after the colon, if it exists

		DecodedJWT decoded = validator.decode(firstPart);

		if (decoded != null) {
			System.out.println("Subject: " + decoded.getClaim("userName"));
			username = decoded.getClaim("userName").toString().replace("\"", "");
			clients.put(Integer.parseInt(session.getId()), decoded.getClaim("userName").toString());
		} else {
			System.out.println("null");
		}

		// Broadcast the message to all connected clients
		for (Session s : session.getOpenSessions()) {
			if (s.isOpen()) {
				s.getBasicRemote().sendText(username + clients.values() + " : " + secondPart);
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {

		System.out.println("Connected: " + session.getId() + clients);
		// add session names for auto logout
		// Retrieve the cookie from the session
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("Closed: " + session.getId() + clients);
		clients.remove(0);
	}

	@OnError
	public void onError(Throwable t) {

		System.out.println("Error - " + t.getMessage());
	}
}

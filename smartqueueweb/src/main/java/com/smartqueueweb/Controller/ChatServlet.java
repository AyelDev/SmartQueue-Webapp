package com.smartqueueweb.Controller;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.smartqueueweb.Class.JwtValidator;

@ServerEndpoint("/chat")
public class ChatServlet {
	private static final Set<Session> clients = new CopyOnWriteArraySet<>();
	JwtValidator validator = new JwtValidator();

	@OnOpen
	public void onOpen(Session session) {
		System.out.println("Connected: " + session.getId());
		//add session names for auto logout
		clients.add(session);
		// Retrieve the cookie from the session
	}

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {

		//System.out.println("Message from " + session.getId() + ": " + message + " " + session);
		
		String username = "";
		String[] parts = message.split(":");
		String firstPart = parts[0].trim(); // the part before the colon
		String secondPart = parts.length > 1 ? parts[1].trim() : ""; // the part after the colon, if it exists

		DecodedJWT decoded = validator.decode(firstPart);

		if (decoded != null) {
			System.out.println("Subject: " + decoded.getClaim("userName"));
		 	username = decoded.getClaim("userName").toString();
		} else {
			System.out.println("null");
		}

		// Broadcast the message to all connected clients
		for (Session s : session.getOpenSessions()) {
			if (s.isOpen()) {
				s.getBasicRemote().sendText(username + " : " +secondPart);
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("Closed: " + session.getId());
	}

	@OnError
	public void onError(Throwable t) {

		System.out.println("Error - " + t.getMessage());
	}

}

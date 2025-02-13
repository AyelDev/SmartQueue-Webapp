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
		//System.out.println(message);

		// Broadcast the message to all connected clients
		for (Session s : session.getOpenSessions()) {
			if (s.isOpen()) {
				s.getBasicRemote().sendText(message);
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {

		//System.out.println("Connected: " + session.getId() + clients);
		// add session names for auto logout
		// Retrieve the cookie from the session
	}

	@OnClose
	public void onClose(Session session) {
		//System.out.println("Closed: " + session.getId() + clients);
		clients.remove(0);
	}

	@OnError
	public void onError(Throwable t) {

		System.out.println("Error - " + t.getMessage());
	}
}

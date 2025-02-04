<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/message.css">
  <title>Staff | Message</title>
 
</head>
<body>
  <div class="leftnav" id="leftnav">
    <button class="close-btn" id="close-btn">&times;</button>
    <div class="top-lnav">
      <img src="./images/logo.png" class="cec" alt="CEC Logo">
      <p class="title"><strong>Cebu Eastern College</strong></p>
    </div>
    <div class="bottom-lnav">
      <b><a href="staffpage"><img src="./images/dashboard.png" alt="">Dashboard</a></b>
      <b><a href="userwindow"><img src="./images/display.png" alt="">User Window</a></b>
      <b><a href="counterwindow"><img src="./images/counter.png" alt="">Counter Window</a></b>
      <b><a href="addstudent"><img src="../images/studentlist.png" alt="">Student List</a></b>
      <b><a href="entertainment"><img src="./images/entertainment.png" alt="">Entertainment</a></b>
  </div>
  </div>

  <div class="header">
    <button class="menu-btn" id="menu-btn" style="margin-left: .5%; font-size: 1.4rem;">&#9776;</button>
    <button class="button-profile" style="background-color: #fff; color: black;"><img src="./images/profile.png" alt="" class="profile"><b><c:out value="${sessionScope.sessionStaff.firstname}"></c:out></b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
    <div class="staffProfile" id="staffProfile">
      <a href="setting">Settings</a>
      <a href="login">Signout</a>
    </div>
  </div>

  <div class="container">
    <div class="sidebar">
      <h2>Chats</h2>
      <ul id="chat-list">
        <li data-chat-id="chat1">
          <p><strong>Cindy mae Labra</strong></p>
          <p>Do your work now! The deadline will be tomorrow morning.</p>
        </li>
        <li data-chat-id="chat2">
          <p><strong>Ariel Abelgas</strong></p>
          <p>We need to finish our system immediately.</p>
        </li>
      </ul>
    </div>

    <div class="chat-area">
      <div class="messages" id="message-container">
        <!-- Dynamic chat messages will appear here -->
      </div>
      <div class="input-area" id="input-area">
        <input type="text" id="message-input" placeholder="Type a message...">
        <button id="send-button">Send</button>
      </div>
    </div>
  </div>

  <script>
    const conversations = {
      chat1: [
        { sender: 'received', message: 'Do your work now! The deadline will be tomorrow morning.' },
        { sender: 'sent', message: 'I will get on it right away!' }
      ],
      chat2: [
        { sender: 'received', message: 'We need to finish our system immediately.' },
        { sender: 'sent', message: 'Got it. I will do it now!' }
      ]
    };

    const messageInput = document.getElementById('message-input');
    const sendButton = document.getElementById('send-button');
    const messageContainer = document.getElementById('message-container');
    const inputArea = document.getElementById('input-area');

    sendButton.addEventListener('click', () => {
      const messageText = messageInput.value.trim();
      if (messageText) {
        const messageElement = document.createElement('div');
        messageElement.className = 'message sent';
        messageElement.textContent = messageText;
        messageContainer.appendChild(messageElement);
        messageInput.value = '';
        messageContainer.scrollTop = messageContainer.scrollHeight;
      }
    });

    messageInput.addEventListener('keypress', (event) => {
      if (event.key === 'Enter') {
        sendButton.click();
      }
    });

    const leftnav = document.getElementById('leftnav');
    const menuBtn = document.getElementById('menu-btn');
    const closeBtn = document.getElementById('close-btn');

    menuBtn.addEventListener('click', () => {
      leftnav.classList.add('active');
    });

    closeBtn.addEventListener('click', () => {
      leftnav.classList.remove('active');
    });

    document.addEventListener("DOMContentLoaded", function () {
      const profileButton = document.querySelector('.button-profile');
      const staffProfile = document.getElementById('staffProfile');

      profileButton.addEventListener('click', function () {
        if (staffProfile.style.display === 'none' || !staffProfile.style.display) {
          staffProfile.style.display = 'block';
        } else {
          staffProfile.style.display = 'none';
        }
      });
    });

    const chatList = document.getElementById('chat-list');
    chatList.addEventListener('click', (event) => {
      if (event.target.closest('li')) {
        const chatId = event.target.closest('li').dataset.chatId;
        loadConversation(chatId);
      }
    });

    function loadConversation(chatId) {
      messageContainer.innerHTML = '';
      const conversation = conversations[chatId] || [];
      conversation.forEach((msg) => {
        const messageElement = document.createElement('div');
        messageElement.className = `message ${msg.sender}`;
        messageElement.textContent = msg.message;
        messageContainer.appendChild(messageElement);
      });
      messageContainer.scrollTop = messageContainer.scrollHeight;

      // Show the input area when a chat is selected
      inputArea.style.display = 'flex';
    }
  </script>
</body>
</html>

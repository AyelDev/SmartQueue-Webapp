<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Staff| Message</title>
  <style>
    @import url('../css/fonts.css');

    body {
      margin: 0;
      font-family: "Roboto Condensed", sans-serif;
      display: flex;
      flex-direction: column;
      height: 100vh;
    }

    .header {
      position: sticky;
      top: 0;
      z-index: 1000;
      background-color: #1E91D0;
      color: white;
      padding: .7rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .header h1 {
      margin: 0;
      font-size: 1.25rem;
      display: flex;
      align-items: center;
    }

    .header button {
      background: none;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 1rem;
    }

    .container {
      display: flex;
      flex-grow: 1;
      overflow: hidden;
    }

    .leftnav {
      position: fixed;
      top: 0;
      left: -200px;
      width: 200px;
      height: 100%;
      background-color: #1E91D0;
      color: white;
      transition: left 0.3s ease;
      z-index: 1001;
      padding: 1rem;
    }

    .leftnav.active {
      left: 0;
    }

    .leftnav .top-lnav {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-bottom: 2rem;
    }

    .cec {
        width: 50%;
        max-width: 100%;
        object-fit: contain;
        margin-top: 15px;
        margin-bottom: 5px;
    }

    .leftnav .close-btn {
      position: absolute;
      top: 1rem;
      right: 2rem;
      background: none;
      color: white;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
    }

    .bottom-lnav {
      width: 100%;
      height: 80%;
      background-color: transparent;
      text-align: center;
      padding-top: 4px;
    }
        
    .bottom-lnav a {
      display: block;
      margin: 1rem 0;
      color: white;
      text-decoration: none;
      font-size: 1.2rem;
      transition: color 0.3s ease;
      margin-top: 40px;
      margin-left: 10%;
      text-align: start;
      justify-content: center;
      align-items: center;
      font-weight: normal;
    }
        
    .bottom-lnav a:hover {
      padding: 15px 20px 15px 20px;
      width: 12.8vw;
      background-color: white;
      position: relative;
      margin-left: 2px;
      color: black;
      border-top-left-radius: 15px;
      border-bottom-left-radius: 15px;
      transition-timing-function: cubic-bezier(0.445, 0.05, 0.55, 0.95);
    }
    
    .bottom-lnav img {
      width: 20px;
      height: 20px;
      object-fit: contain;
      margin-right: 10px;
      filter: invert(1);
    }
    
    .bottom-lnav a:hover img {
      filter: brightness(0) saturate(100%) hue-rotate(200deg); /*blue color*/
      transform: scale(1.2);
    }

    .menu-btn {
      background: none;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 2rem;
    }

    .sidebar {
      width: 25%;
      background-color: #F3F4F6;
      border-right: 1px solid #E5E7EB;
      padding: 1rem;
      overflow-y: auto;
      margin-left: 2%;
    }

    .sidebar h2 {
      margin: 0 0 1rem;
      font-size: 1rem;
      color: #374151;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .sidebar li {
      background: white;
      padding: 0.5rem;
      margin-bottom: 0.5rem;
      border-radius: 0.5rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      cursor: pointer;
    }

    .sidebar li:hover {
      background: #F9FAFB;
    }

    .chat-area {
      display: flex;
      flex-direction: column;
      flex-grow: 1;
      overflow: hidden;
    }

    .messages {
      flex-grow: 1;
      padding: 1rem;
      background-color: #F9FAFB;
      overflow-y: auto;
      display: flex;
      flex-direction: column;
      gap: 1rem;
      max-height: calc(100vh - 140px); 
    }

    .message {
      max-width: 60%;
      padding: 0.5rem;
      border-radius: 0.5rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .message.sent {
      align-self: flex-end;
      background-color: #D1FAE5;
    }

    .message.received {
      align-self: flex-start;
      background-color: #BFDBFE;
    }

    .input-area {
      padding: 1rem;
      background-color: #E5E7EB;
      display: flex;
      gap: 0.5rem;
    }

    .input-area input {
      flex-grow: 1;
      padding: 0.5rem;
      border: 1px solid #D1D5DB;
      border-radius: 0.5rem;
      outline: none;
    }

    .input-area button {
      padding: 0.5rem 1rem;
      background-color: #1E40AF;
      color: white;
      border: none;
      border-radius: 0.5rem;
      cursor: pointer;
    }

    .input-area button:hover {
      background-color: #1D4ED8;
    }

    .button-profile {
      align-items: center;
      justify-content: center;
      display: flex;
      width: 10vw;
      margin-top: 1px;
      margin-left: 36px;
      margin-right: 10px;
      border-radius: 10px;
      padding: 5px 3px 5px 3px;
      overflow: hidden;
      cursor: pointer;
      border: none;
      float: right;
      margin-right: 1.5%;
      background-color: #fff;
      color: black;
    }

    .profile {
      width: 10%;
      object-fit: scale-down;
      margin-right: 1.25rem;
    }

    .caretdown {
      mix-blend-mode: multiply;
      width: 0.625rem;
      margin-left: 1.25rem;
    }

    .staffProfile {
      position: absolute;
      background-color: none;
      width: 9.5vw;
      align-items: center;
      justify-content: center;
      text-align: center;
      z-index: 1;
      display: none;
      margin-top: 6.8%;
      right: 2.2%;
    }

    .staffProfile a {
      text-decoration: none;
      background-color: #fff;
      color: black;
      overflow: hidden;
      width: 10vw;
      text-align: center;
      align-items: center;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: .5rem 0 0 0;
      height: 1.5rem;
      float: right;
      margin-right: 1.7%;
      font-size: 1rem;
    }

    .staffProfile a:hover {
      background-color: #EEEEEE;
      border-radius: 7px;
      color: black;
    }
  </style>
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
        <b><a href="addstudent"><img src="./images/studentlist.png" alt="">Student List</a></b>
        <b><a href="entertainment"><img src="./images/entertainment.png" alt="">Entertainment</a></b>
    </div>
  </div>

  <div class="header">
    <button class="menu-btn" id="menu-btn" style="margin-left: .5%; font-size: 1.4rem;">&#9776;</button>
    
    <button class="button-profile" style="background-color: #fff; color: black;"><img src="./images/profile.png" alt="" class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
    <div class="staffProfile" id="staffProfile">
      <a href="setting">Settings</a>
      <a href="login">Signout</a>
    </div>
  </div>

  <div class="container">
    <div class="sidebar">
      <h2>Chats</h2>
      <ul>
        <li>
          <p><strong>Cindy mae Labra</strong></p>
          <p>Do your work now! The deadline will be tomorrow morning.</p>
        </li>
      </ul>
    </div>
    <div class="chat-area">
      <div class="messages" id="message-container">
        <div class="message received">Do your work now! The deadline will be tomorrow morning.</div>
        <div class="message sent">Yes, this is noted.</div>
      </div>
      <div class="input-area">
        <input type="text" id="message-input" placeholder="Type a message...">
        <button id="send-button">Send</button>
      </div>
    </div>
  </div>

  <script>
    const messageInput = document.getElementById('message-input');
    const sendButton = document.getElementById('send-button');
    const messageContainer = document.getElementById('message-container');

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

    // Left navigation 
    const leftnav = document.getElementById('leftnav');
    const menuBtn = document.getElementById('menu-btn');
    const closeBtn = document.getElementById('close-btn');

    menuBtn.addEventListener('click', () => {
      console.log('Menu button clicked');
      leftnav.classList.add('active');
    });

    closeBtn.addEventListener('click', () => {
      console.log('Close button clicked');
      leftnav.classList.remove('active');
    });

    // Profile dropdown 
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
  </script>
  
</body>
</html>

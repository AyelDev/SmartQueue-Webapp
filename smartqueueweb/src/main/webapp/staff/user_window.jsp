<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:if test="${empty sessionScope.sessionStaff}">
      <c:redirect url="/" />
    </c:if>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="./css/bootstrap.css">
      <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
      <script type="text/javascript" src="./scripts/ping.js"></script>
      <script type="text/javascript" src="./scripts/fadetransition.js"></script>
      <link rel="stylesheet" href="./css/loader.css">
      <link rel="stylesheet" href="./css/user_window.css">
      <title>SmartQueue</title>

    </head>
    <style>
      *,
      body {
        margin: 0%;
        padding: 0%;
        overflow: hidden;
      }

      .container-xxl {
        display: grid;
        margin: 0%;
        padding: 0%;
        overflow: hidden;
      }

      .col-6-1 {
        height: 100vh;
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .col-6-2 {
        height: 100vh;
        width: 50%;
      }

      tr {
        align-items: center;
        display: flex;
        justify-content: center;
      }

      tr td {
        width: 70%;
        margin: 1%;
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        justify-content: center;
        display: flex;
        border-radius: 10px;
        background-color: #00509d;
      }

      #video-ads {
        width: 100%;
        height: 70%;
        margin-left: 3%;
      }

      .datetime {
        background-color: #00509d;
        color: #fff;
        padding: 10px;
        border-radius: 10px;
        font-size: 1.5rem;
        text-transform: uppercase;
        box-shadow: inset 0 -4px 10px rgba(0, 0, 0, 0.1);
        margin-top: -42%;
        width: 50%;
        height: 10%;
        margin-left: 2%;
        position: absolute;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      footer {
        text-align: center;
        padding: 15px;
        background-color: #333;
        color: #fff;
        margin-top: -4%;
        box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
      }

      footer p {
        margin: 0;
        font-size: 1rem;
      }

      .popup {
        display: none;
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
      }

      .popup-content {
        background-color: white;
        padding: 40px;
        border-radius: 10px;
        text-align: center;
        position: relative;
        width: 80%;
        height: 80%;
        margin-left: 11%;
        margin-top: 5%;
      }

      .close {
        position: absolute;
        top: 10px;
        right: 15px;
        cursor: pointer;
        font-size: 20px;
      }
      h1{
        font-size: 20rem;
      }
      p{
        font-size: 5rem;
        color: #fff;
        background-color: #00509d;
      }
    </style>

    <body>
      <div class="container-fluid">
        <div class="row">
          <div class="col-6-1">
            <video id="video-ads" controls autoplay loop>
              <source src="video-ad.mp4" type="video/mp4">
            </video>
            <div class="datetime">
              <span id="date"></span> | <span id="time"></span>
            </div>
          </div>
          <div class="col-6-2">
            <table class="table table-info">
              <tbody>
                <tr>
                  <td>Window 1</td>
                  <td>02</td>
                </tr>
              </tbody>

              <tbody>
                <tr>
                  <td>Window 2</td>
                  <td>02</td>
                </tr>
              </tbody>

              <tbody>
                <tr>
                  <td>Window 3</td>
                  <td>02</td>
                </tr>
              </tbody>

              <tbody>
                <tr>
                  <td>Window 4</td>
                  <td>02</td>
                </tr>
              </tbody>

              <tbody>
                <tr>
                  <td>Window 5</td>
                  <td>02</td>
                </tr>
              </tbody>

              <tbody>
                <tr>
                  <td>Window 6</td>
                  <td>02</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="popup" id="popup">
        <div class="popup-content">
          <h1>G01</h1>
          <span class="close" id="closeBtn">&times;</span>
          <p>Window 1</p>
        </div>
      </div>

      <footer>
        <b>
          <p>&copy; 2024 Cebu Eastern College. All Rights Reserved.</p>
        </b>
      </footer>

      <script>
        function updateTime() {
          const now = new Date();
          document.getElementById('date').textContent = now.toLocaleDateString();
          document.getElementById('time').textContent = now.toLocaleTimeString();
        }


        // updateQueue('counter1', 'queue1');
        // updateQueue('counter2', 'queue2');
        // updateQueue('counter3', 'queue3');
        updateTime();

        //websocket
        var wsUrl;
        if (window.location.protocol == 'http:') {
          wsUrl = 'ws://';
        } else {
          wsUrl = 'wss://';
        }
        var ws = new WebSocket(wsUrl + window.location.host + "/smartqueueweb/QueueWebSocketController");

        ws.onopen = function (event) {
          console.log('WebSocket connection opened', event);
        };

        async function playDingdong() {
          const audioContext = new (window.AudioContext || window.webkitAudioContext)();
          const response = await fetch('./media/dingdong.mp3');
          const arrayBuffer = await response.arrayBuffer();
          const audioBuffer = await audioContext.decodeAudioData(arrayBuffer);
          const source = audioContext.createBufferSource();
          source.buffer = audioBuffer;
          await source.connect(audioContext.destination);
          await source.start(0);
          return new Promise(resolve => {
            source.onended = resolve;
          });
        }

        ws.addEventListener("message", async (message) => {

          if ('speechSynthesis' in window) {
            try {
              const msg = new SpeechSynthesisUtterance();
              msg.text = message.data;
              msg.lang = 'en-AU'; // Specify language code

              msg.volume = 1.0
              window.speechSynthesis.speak(msg);

              // Optional: Add event listeners
              msg.onstart = async function () {
                await showPopup();
                await playDingdong();
              };
             
            } catch (error) {
              console.error('Error during speech synthesis:', error);
            }
          } else {
            alert('Text-to-speech is not supported in this browser.');
          }
        });

        setInterval(updateTime, 1000);

        //pop up
          function showPopup() {
            $("#popup").fadeIn();

            setTimeout(hidePopup, 8000);
          }

          function hidePopup() {
            $("#popup").fadeOut();
          }

          $("#closeBtn").click(hidePopup);

          $(window).click(function (event) {
            if ($(event.target).is("#popup")) {
              hidePopup();
            }
          });
       
      </script>
      <div class="load-wrapper">
        <div class="main-loader">
          <div class="box-loader">
          </div>
        </div>
      </div>
    </body>

    </html>
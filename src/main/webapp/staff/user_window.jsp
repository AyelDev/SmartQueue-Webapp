<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:if test="${empty sessionScope.sessionStaff && empty sessionScope.sessionAdmin.getUsername()}">
      <c:redirect url="/" />
    </c:if>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
      <script type="text/javascript" src="./scripts/ping.js"></script>
      <script type="text/javascript" src="./scripts/fadetransition.js"></script>
      <script type="text/javascript" src="./scripts/notify.js"></script>
      <script type="text/javascript" src="./scripts/prettify.js"></script>
      <link rel="stylesheet" href="./css/bootstrap.css">
      <link rel="stylesheet" href="./css/loader.css">
      <link rel="stylesheet" href="./css/notify.css">
      <link rel="stylesheet" href="./css/prettify.css">
      <title>SmartQueue</title>

    </head>
    <style>
      *,
      body {
        margin: 0%;
        padding: 0%;
        overflow: hidden;
        background-color: #F6F4EB;
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
        font-size: 3rem;
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
        background-color: #333;
      }

      .datetime {
        background: #F6F4EB;
        color: #333;
        padding: 10px;
        font-size: 3.5rem;
        text-transform: uppercase;
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
        color: #020000;
        margin-top: -4%;
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

      h1 {
        font-size: 20rem;
      }

      #popup-window-number {
        font-size: 5rem;
        color: #fff;
        background-color: #00509d;
      }
    </style>

    <body>
      <div class="container-fluid">
        <div class="row">
          <div class="col-6-1">
            <video id="video-ads" autoplay muted controls>
              <source id="videoSource" src="media/videosample3.mp4" type="video/mp4">
            </video>
            <div class="datetime">
              <span id="date"></span> | <span id="time"></span>
            </div>
          </div>
          <div class="col-6-2">
            <table class="table table-info">
              <tbody id="window-1-body">
                <tr>
                  <td>Window 1</td>
                  <td>---</td>
                </tr>
              </tbody>

              <tbody id="window-2-body">
                <tr>
                  <td>Window 2</td>
                  <td>---</td>
                </tr>
              </tbody>

              <tbody id="window-3-body">
                <tr>
                  <td>Window 3</td>
                  <td>---</td>
                </tr>
              </tbody>

              <tbody id="window-4-body">
                <tr>
                  <td>Window 4</td>
                  <td>---</td>
                </tr>
              </tbody>

              <tbody id="window-5-body">
                <tr>
                  <td>Window 5</td>
                  <td>---</td>
                </tr>
              </tbody>

              <tbody id="window-6-body">
                <tr>
                  <td>Window 6</td>
                  <td>---</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="popup" id="popup">
        <div class="popup-content">
          <h1 id="popup-queue-number">G01</h1>
          <span class="close" id="closeBtn">&times;</span>
          <p id="popup-window-number">Window 1</p>
        </div>
      </div>

      <div>

      </div>
      <footer >
        <b style="background-color: #020000;">
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
        var ws = new WebSocket(wsUrl + window.location.host + "/QueueWebSocketController");

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

            let messageParse = JSON.parse(message.data);

            try {

              //IF ONLINE
              const msg = new SpeechSynthesisUtterance();
              msg.text = messageParse.message;
              msg.lang = 'en-US'; 

              msg.volume = 1.0
            

              //IF OFFLINE
              // const msg = new SpeechSynthesisUtterance();
              // msg.text = messageParse.message;
              // msg.lang = 'en-AU '; // Set language (optional)
              // msg.rate = 1;
              // msg.pitch = 1;
              // msg.volume = 1;
              // window.speechSynthesis.speak(msg);


              // Optional: Add event listeners
               msg.onstart = async function () {
                await videoSetVolume(.0);
                await showPopup(messageParse.windowNumber, messageParse.queueNumber);
                await playDingdong();
                await CounterList(1, "SERVING", "#window-1-body");
                await CounterList(2, "SERVING", "#window-2-body");
                await CounterList(3, "SERVING", "#window-3-body");
              };

              msg.onend = async function () {
                await hidePopup();
                await videoSetVolume(.3);
              }

              window.speechSynthesis.speak(msg);

            } catch (error) {
              $.notify("Error during speech synthesis:" + error, { color: "#fff", background: "#D44950", delay: 1000 });
            }
          } else {
            $.notify("Text-to-speech is not supported in this browser.", { color: "#fff", background: "#D44950", delay: 1000 });
          }
        });

        setInterval(updateTime, 1000);


        //pop up
        function showPopup(popupwindownumber, popupqueuenumber) {

          let popqueue = document.getElementById("popup-queue-number");
          let popwindow = document.getElementById("popup-window-number");

          popqueue.textContent = popupqueuenumber;
          popwindow.textContent = "Window " + popupwindownumber;

          $("#popup").fadeIn();
          //setTimeout(hidePopup, 8000);
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


        //counter windows
        async function CounterList(window_number, queue_status, elementid) {
          await $.ajax({
            url: '/JsonStudentQueueEntriesAPI',
            method: 'GET',
            data: {
              window_number: window_number,
              queue_status: queue_status
            },
            dataType: 'json',
            success: function (data) {
              let NumberTable = $(elementid);
              NumberTable.empty();

              if (data.length === 0) {
                NumberTable.append(`
                                  <tr>
                                      <td>Window `+ window_number + `</td>
                                      <td>---</td>
                                  </tr>
                                    `);
                return;
              }
              data.forEach(item => {
                NumberTable.append(`
                                  <tr>
                                      <td> Window `+ item.window_number + `</td>
                                      <td>`+ item.queue_number + `</td>
                                  </tr>
                                    `);
              });
            }

          });
        }

        // Array of video files to play sequentially
        const videoFiles = ["media/videosample.mp4", "media/videosample2.mp4"];
        let currentVideoIndex = 0; // Track the current video index

        // Get the video and source elements
        const videoElement = document.getElementById('video-ads');
        const videoSource = document.getElementById('videoSource');

        // Function to load the next video
        function loadNextVideo() {
          currentVideoIndex = (currentVideoIndex + 1) % videoFiles.length; // Cycle through videos
          videoSource.src = videoFiles[currentVideoIndex]; // Update video source
          videoElement.load(); // Reload video with new source
          videoElement.play(); // Auto-play the next video
        }

        // Event listener for the `ended` event to load the next video
        videoElement.addEventListener('ended', loadNextVideo);

        function videoSetVolume(volume) {
          videoElement.volume = volume;
        }

        videoSetVolume(.3);
      </script>

      <div class="load-wrapper">
        <div class="main-loader">
          <div class="box-loader">
          </div>
        </div>
      </div>


    </body>

    </html>
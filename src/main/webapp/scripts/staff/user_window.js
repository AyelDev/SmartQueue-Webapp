$(document).ready(function () {
    updateTime();
    getAllVideos();
  });

  function updateTime() {
    const now = new Date();
    document.getElementById('date').textContent = now.toLocaleDateString();
    document.getElementById('time').textContent = now.toLocaleTimeString();
  }

  // updateQueue('counter1', 'queue1');
  // updateQueue('counter2', 'queue2');
  // updateQueue('counter3', 'queue3');

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

        //check if message is from the counter-staff
        if (messageParse.queueNumber == undefined)
          return false;
        else
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

  // GET ALL LIST OF VIDEOS
  function getAllVideos() {
    fetch(window.location.origin + '/JsonVideoListAPI')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        jsonConvertToArrayVideoFile(data);
      })
      .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
      });
  }
  let videoFiles = [];

  function jsonConvertToArrayVideoFile(data) {
    data.forEach(item => {
      if (item.fileName) {
        videoFiles.push('media/' + item.fileName);
      }
    });
  }


  // Array of video files to play sequentially
  //videoFiles = ["media/videosample.mp4", "media/videosample2.mp4"];
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
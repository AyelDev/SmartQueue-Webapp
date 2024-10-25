<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${empty sessionScope.sessionStaff}">
            <c:redirect url="/" />
        </c:if>
        <!DOCTYPE html>
        <html lang="en">
        
        <head>
            <link rel="stylesheet" href="css/entertainment.css">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="./scripts/fadetransition.js"></script>
            <link rel="stylesheet" href="./css/loader.css">
            <title>SmartQueuWeb</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    display: flex;
                    height: 100vh;
                    background-color: #EEEEEE;
                    overflow: hidden;
                }
        
                .leftnav {
                    width: 15%;
                    height: 100%;
                    background-color: #00509d;
                    padding: 10px;
                    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
                }
        
                .ulnav {
                    height: 25%;
                    width: 100%;
                    background-color: transparent;
                    margin-bottom: 3px;
                    text-align: center;
                    display: block;
                    position: relative;
                    line-height: 10px;
                    font-size: 0.875rem;
                    color: white;
                }
        
                .top-lnav {
                    background-color: transparent;
                    height: 70%;
                    overflow: auto;
                    margin-bottom: 7px;
                    margin-left: 120px;
                }
        
                .bottom-lnav {
                    width: 100%;
                    height: 80%;
                    background-color: transparent;
                    text-align: center;
                    padding-top: 30px;
                }
        
                .bottom-lnav a {
                    display: block;
                    margin: 1rem 0;
                    color: white;
                    text-decoration: none;
                    font-size: 1.2rem;
                    transition: color 0.3s ease;
                    margin-top: 50px;
                    text-align: center;
                    justify-content: center;
                    align-items: center;
                }
        
                .bottom-lnav a:hover {
                    padding: 15px 20px 15px 20px;
                    width: 11.5vw;
                    background-color: white;
                    position: relative;
                    left: 20px;
                    color: black;
                    border-radius: 20px;
                    border-top-right-radius: 5px;
                    border-bottom-right-radius: 5px;
                    transition-timing-function: cubic-bezier(0.445, 0.05, 0.55, 0.95);
                }
        
                .video-container {
                    width: 700px;
                    position: absolute;
                    top: 50px;
                    left: 220px;
                    display: none;
                    border: 2px solid #333;
                    border-radius: 10px;
                    background-color: white;
                    z-index: 1000;
                }
        
                .video-header {
                    display: flex;
                    justify-content: space-between;
                    background-color: #333;
                    color: white;
                    padding: 5px;
                    cursor: move;
                    border-top-left-radius: 10px;
                    border-top-right-radius: 10px;
                }
        
                .video-header button {
                    background: none;
                    border: none;
                    color: white;
                    cursor: pointer;
                }
        
                video {
                    width: 100%;
                    border-bottom-left-radius: 10px;
                    border-bottom-right-radius: 10px;
                }
        
                table {
                    margin: 0;
                    border-collapse: collapse;
                    width: 100%;
                    text-align: center;
                    list-style: none;
                }
        
                th,
                td {
                    padding: 10px 30px;
                    border: 1px solid #ccc;
                    text-align: center;
                    background-color: #306EFF;
                    color: white;
                    
                }
        
                td {
                    cursor: pointer;
                    color: blue;
                    text-decoration: none;
                    background-color: #EEEEEE;
                }
        
                .controls {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                    margin-left: 550px;
                    margin-top: 40px;
                }
        
                input[type="file"] {
                    width: 200px;
                    margin-right: 10px;
                    height: 40px;
                }
        
                button {
                    font-size: 15px;
                    background-color: #306EFF;
                    color: white;
                    border-radius: 20px;
                    cursor: pointer;
                    padding: 10px 30px;
                    text-align: center;
                }
                .cec {
                    width: 50%;
                    max-width: 100%;
                    object-fit: contain;
                    margin-top: 15px;
                    margin-bottom: 5px;
                }
        
                .title {
                    color: #F6F4EB;
                    font-size: 1.15em;
                }
        
                .button-profile {
                    align-items: center;
                    justify-content: center;
                    display: flex;
                    width: 10vw;
                    margin-top: 20px;
                    margin-left: 36px;
                    border-radius: 10px;
                    padding: 15px 10px 15px 10px;
                            /*tlbr*/
                    overflow: hidden;
                    cursor: pointer;
                    border: 2px solid black;
                    background-color: white;
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
                    margin-left: 2.3rem;
                    position: absolute;
                    background-color: none;
                    width: 9.5vw;
                    align-items: center;
                    justify-content: center;
                    text-align: center;
                    z-index: 1;
                    display: none;
                }
        
                .staffProfile a {
                    text-decoration: none;
                    background-color: white;
                    color: black;
                    overflow: hidden;
                    width: 10vw;
                    height: 20%;
                    text-align: center;
                    align-items: center;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    padding: .5rem 0 0 0;
                    height: 2rem;
                    /* margin-left: 30px; */
                }
                .staffProfile a:hover {
                    background-color: lightgrey;
                    border-radius: 7px;
                    color: black;
                }
            </style>
        </head>
        
        <body>
        
            <div class="leftnav">
                <div class="ulnav">
                    <img src="logo.png" class="cec">
                    <b class="title"><br>Cebu Eastern College</b>
        
                    <!-- staff profile -->
                    <button class="button-profile"><img src="./images/profile.png" alt="" class="profile"><b>STAFF</b><img
                            src="./images/caretdown.png" alt="" class="caretdown"></button>
                    <div class="staffProfile" id="staffProfile">
                        <a href="#">Settings</a>
                        <a href="logout">Signout</a>
                    </div>
                </div>
                
                <div class="bottom-lnav">
                    <b><a href="staffdashboard">Dashboard</a></b>
                    <b><a href="userwindow">User Window</a></b>
                    <b><a href="counterwindow">Counter Window</a></b>
                    <b><a href="addstudent">Add Student</a></b>
                    <b><a href="entertainment">Advertisement</a></b>
                </div>
            </div>
        
            <div>
                <div class="controls">
                    <input type="file" id="videoUpload" accept="video/*">
                    <button id="uploadBtn"><b>Upload Video</b></button>
                </div>
                <div class="top-lnav">
                    <table id="videoTable">
                        <thead>
                            <tr>
                                <th> Uploaded Videos</th>
                            </tr>
                        </thead>
                        <tbody id="videoList"></tbody>
                    </table>
                </div>
            </div>
        
            <div class="video-container" id="videoContainer">
                <div class="video-header">
                    <span>Video Advertisement</span>
                    <div>
                        <button id="minimizeBtn">_</button>
                        <button id="maximizeBtn">▢</button>
                        <button id="closeBtn">X</button>
                    </div>
                </div>
                <video id="videoPlayer" controls>
                    <source id="videoSource" src="" type="video/mp4">
                </video>
            </div>
        
            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>
        
            <script>
                const videoUpload = document.getElementById('videoUpload');
                const uploadBtn = document.getElementById('uploadBtn');
                const videoList = document.getElementById('videoList');
                const videoPlayer = document.getElementById('videoPlayer');
                const videoSource = document.getElementById('videoSource');
                const videoContainer = document.getElementById('videoContainer');
                const minimizeBtn = document.getElementById('minimizeBtn');
                const maximizeBtn = document.getElementById('maximizeBtn');
                const closeBtn = document.getElementById('closeBtn');
        
                let isMaximized = false;
                let videos = [];
        
                uploadBtn.onclick = function () {
                    const file = videoUpload.files[0];
                    if (file) {
                        const url = URL.createObjectURL(file);
                        videos.push({ name: file.name, url: url });
                        updateVideoList();
                        videoUpload.value = '';
                    }
                };
        
                function updateVideoList() {
                    videoList.innerHTML = '';
                    videos.forEach((video) => {
                        const row = document.createElement('tr');
                        const cell = document.createElement('td');
                        cell.textContent = video.name;
                        cell.onclick = function () {
                            playVideo(video.url);
                        };
                        row.appendChild(cell);
                        videoList.appendChild(row);
                    });
                }
        
                function playVideo(url) {
                    videoSource.src = url;
                    videoContainer.style.display = 'block';
                    videoPlayer.load();
                    videoPlayer.play();
                }
        
                // Close button functionality
                closeBtn.onclick = function () {
                    videoContainer.style.display = 'none';
                    videoPlayer.pause();
                };
        
                // Minimize button functionality
                minimizeBtn.onclick = function () {
                    videoPlayer.style.display = 'none';
                };
        
                // Maximize button functionality
                maximizeBtn.onclick = function () {
                    if (isMaximized) {
                        videoContainer.style.width = '700px';
                        videoContainer.style.height = 'auto';
                    } else {
                        videoContainer.style.width = '100%';
                        videoContainer.style.height = '100%';
                    }
                    isMaximized = !isMaximized;
                };
        
                // Make the video player draggable
                dragElement(videoContainer);
        
                function dragElement(elmnt) {
                    let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
                    const header = elmnt.querySelector(".video-header");
        
                    if (header) {
                        header.onmousedown = dragMouseDown;
                    }
        
                    function dragMouseDown(e) {
                        e = e || window.event;
                        e.preventDefault();
                        pos3 = e.clientX;
                        pos4 = e.clientY;
                        document.onmouseup = closeDragElement;
                        document.onmousemove = elementDrag;
                    }
        
                    function elementDrag(e) {
                        e = e || window.event;
                        e.preventDefault();
                        pos1 = pos3 - e.clientX;
                        pos2 = pos4 - e.clientY;
                        pos3 = e.clientX;
                        pos4 = e.clientY;
                        elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                        elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
                    }
        
                    function closeDragElement() {
                        document.onmouseup = null;
                        document.onmousemove = null;
                    }
                }
            </script>
        
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var dropdownButton = document.querySelector(".button-profile");
                    var staffProfile = document.getElementById("staffProfile");
        
                    staffProfile.style.display = "none";
        
                    dropdownButton.addEventListener("click", function () {
                        if (staffProfile.style.display === "block") {
                            staffProfile.style.display = "none";
                        } else {
                            staffProfile.style.display = "block";
                        }
                    });
                });
            </script>
        
        </body>
        
        </html>
        
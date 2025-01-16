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
			<script type="text/javascript" src="./scripts/ping.js"></script>
            <script type="text/javascript" src="./scripts/fadetransition.js"></script>
            <link rel="stylesheet" href="./css/loader.css">
            <link rel="stylesheet" href="../css/entertainment.css">
            <title>SmartQueuWeb</title>
            <style>
               
            </style>
        </head>
        
        <body>
        
            <div class="leftnav">
                <div class="ulnav">
                    <img src="./images/logo.png" class="cec">
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
        
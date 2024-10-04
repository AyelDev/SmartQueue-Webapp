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
                    width: 20%;
                    height: 100%;
                    background-color: #3090C7;
                    padding: 10px;
                    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
                    overflow: scroll;
                }
                video {
                    width: 700px; 
                    max-width: 1000px; 
                    border: 2px solid #333;
                    border-radius: 10px;
                    margin-bottom: 20px;
                    margin-left: 220px;
                    margin-top: 50px;
                }
                table {
                    margin: 0;
                    border-collapse: collapse;
                    width: 100%;
                    text-align: center;
                    list-style: none;
                }
                th, td {
                    padding: 10px 30px;
                    border: 1px solid #ccc;
                    text-align: center;
                    background-color: #79BAEC;
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
                    background-color: #3BB9FF;
                    color: white;
                    border-radius: 20px;
                    cursor: pointer;
                    padding: 10px 30px;
                    text-align: center;
                }
                
                @media (max-width: 1024px) {
                    .leftnav {
                        width: 30%;
                    }
                    video {
                        margin-left: 20px;
                    }
                    .controls {
                        margin-left: 20px;
                    }
                }
        
                @media (max-width: 768px) {
                    body {
                        flex-direction: column; 
                    }
                    .leftnav {
                        width: 100%;
                        height: auto;
                        padding: 5px;
                    }
                    video {
                        width: 100%; 
                        margin-left: 0;
                        margin-top: 20px;
                    }
                    .controls {
                        margin-left: 0; 
                        justify-content: center; 
                    }
                }
        
                @media (max-width: 480px) {
                    th, td {
                        padding: 10px 5px;
                    }
                    button {
                        padding: 10px 15px;
                        font-size: 14px;
                    }
                    input[type="file"] {
                        width: 100%; 
                    }
                }
            </style>
        </head>

        <body>

            <div class="leftnav">
                <table id="videoTable">
                    <thead>
                        <tr>
                            <th> Uploaded Videos</th>
                        </tr>
                    </thead>
                    <tbody id="videoList"></tbody>
                </table>
            </div>
        
            <div>
                <div class="controls">
                    <input type="file" id="videoUpload" accept="video/*">
                    <button id="uploadBtn"><b>Upload Video</b></button>
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
        
                const videos = [];
        
                uploadBtn.onclick = function() {
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
                        cell.onclick = function() {
                            playVideo(video.url);
                        };
                        row.appendChild(cell);
                        videoList.appendChild(row);
                    });
                }
        
                function playVideo(url) {
                    videoSource.src = url;
                    videoPlayer.load();
                    videoPlayer.play();
                }
            </script>

            
        </body>

        </html>
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
            <!-- default css imports -->
            <link rel="stylesheet" href="../css/prettify.css">
            <link rel="stylesheet" href="../css/notify.css">
            <link rel="stylesheet" href="../css/jquery-confirm.min.css">
            <link rel="stylesheet" href="../css/loader.css">
            <!-- page css import-->
            <link rel="stylesheet" href="../css/entertainment.css">
            <link rel="icon" type="image/x-icon" href="./images/logo.png">
            <title>SmartQueuWeb</title>

        </head>

        <body>

            <div class="leftnav">
                <div class="ulnav">
                    <img src="../images/logo.png" class="cec">
                    <b class="title"><br>Cebu Eastern College</b>
                    <!-- staff profile -->
                </div>

                <div class="bottom-lnav">
                    <b><a href="staffdashboard" style="margin-top: 1.3rem;"><img src="./images/dashboard.png"
                                alt="">Dashboard</a></b>
                    <b><a href="userwindow"><img src="../images/display.png" alt="">User Window</a></b>
                    <b><a href="counterwindow"><img src="../images/counter.png" alt="">Counter Window</a></b>
                    <b><a href="addstudent"><img src="../images/studentlist.png" alt="">Student List</a></b>
                    <b><a href="entertainment"><img src="../images/entertainment.png" alt="">Entertainment</a></b>
                </div>
            </div>

            <div class="rightnav">
                <div class="dash"> <b></b>

                    <button class="button-profile"><img src="" alt="" class="profile">
                        <c:out value="${sessionScope.sessionStaff.firstname}"></c:out><svg
                            xmlns="http://www.w3.org/2000/svg" class="caretdown" height="10" width="6.25"
                            viewBox="0 0 320 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.-->
                            <path
                                d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z" />
                        </svg>
                    </button>
                    <div class="staffProfile" id="staffProfile" style="right: 3%;">
                        <a href="setting">Settings</a>
                        <a href="logout">Signout</a>
                    </div>
                </div>
                <hr>

                <div>
                    <div class="controls">
                        <form id="VideoUploadForm" enctype="multipart/form-data">
                            <input type="file" name="file" id="videoUpload" accept="video/*" multiple="multiple"
                                required>
                            <button id="uploadBtn"><b>Upload Video</b></button>
                        </form>
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
            </div>
            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>

            <!-- default js imports -->
            <script type="text/javascript" src="https://cdn.lordicon.com/lordicon.js"></script>
            <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="../scripts/jquery-confirm.min.js"></script>
            <script type="text/javascript" src="../scripts/notify.js"></script>
            <script type="text/javascript" src="../scripts/prettify.js"></script>
            <script type="text/javascript" src="../scripts/ping.js"></script>
            <script type="text/javascript" src="../scripts/fadetransition.js"></script>
            <script type="text/javascript" src="../scripts/chart.min.js"></script>
            <!-- page js import -->
            <script type="text/javascript" src="../scripts/staff/entertainment.js"></script>
            <script type="text/javascript" src="../scripts/profilePic.js"></script>
            <script>
                //----- FETCH PROFILE IMAGE DURING LOAD
                window.onload = function () {
                    FetchImage(".profile");
                }
            </script>
        </body>

        </html>
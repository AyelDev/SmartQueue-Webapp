<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
      <script type="text/javascript" src="../scripts/fadetransition.js"></script>
      <script type="text/javascript" src="../scripts/notify.js"></script>
      <script type="text/javascript" src="../scripts/prettify.js"></script>
      <!-- <link rel="stylesheet" href="../css/bootstrap.css"> -->
      <link rel="stylesheet" href="../css/loader.css">
      <link rel="stylesheet" href="../css/user_window.css">
      <link rel="stylesheet" href="../css/notify.css">
      <link rel="stylesheet" href="../css/prettify.css">
      <link rel="icon" type="image/x-icon" href="./images/logo.png">
      <title>SmartQueue</title>

    </head>

    <body>
      <div class="container">
        <div class="left">
          <div class="datetime">
            <div id="date"></div>|<div id="time"></div>
          </div>
          <video id="video-ads" autoplay muted controls>
            <source id="videoSource" src="media/videosample3.mp4" type="video/mp4">
          </video>
        </div>

        <div class="right">
          <table class="table">
            <tbody>
              <tr>
                <td class="windows" >
                  <h2 id="window1val"></h2>
                  <p>WINDOW 1</p>
                
              </tr>
              <tr>
                <td class="windows">
                  <h2 id="window2val"></h2>
                  <p>WINDOW 2</p>
                </td>
                
              </tr>

              <tr>
                <td class="windows">
                  <h2 id="window3val"></h2>
                  <p>WINDOW 3</p>
                </td>
                
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="popup" id="popup">
        <div class="popup-content">
          <h1 class="queue-number" id="popup-queue-number">G01</h1>
          <span class="close" id="closeBtn">&times;</span>
          <p id="popup-window-number">Window 1</p>
        </div>
      </div>

      <div class="slidetext">
        <span>ATTENTION! ONCE YOUR NUMBER IS CALLED AND YOU ARE NOT AROUND, YOU NEED TO GET ANOTHER PRIORITY
          NUMBER.
          &ensp;</span>
      </div>

      <footer>
        <p>&copy; 2024 Cebu Eastern College. All Rights Reserved.</p>
      </footer>

      <div class="load-wrapper">
        <div class="main-loader">
          <div class="box-loader">
          </div>
        </div>
      </div>
      <script type="text/javascript" src="../scripts/staff/user_window.js"></script>
    </body>

    </html>
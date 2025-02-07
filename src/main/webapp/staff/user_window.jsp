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
      <link rel="stylesheet" href="../css/bootstrap.css">
      <link rel="stylesheet" href="../css/loader.css">
      <link rel="stylesheet" href="../css/user_window.css">
      <link rel="stylesheet" href="../css/notify.css">
      <link rel="stylesheet" href="../css/prettify.css">
      <link rel="stylesheet" href="../css/user_window.css">
      <link rel="icon" type="image/x-icon" href="./images/logo.png">  
      <title>SmartQueue</title>

    </head>
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
                  <td class="windows" id="window1val" >---</td>
                </tr>
              </tbody>

              <tbody id="window-2-body">
                <tr>
                  <td>Window 2</td>
                  <td class="windows" id="window2val">---</td>
                </tr>
              </tbody>

              <tbody id="window-3-body">
                <tr>
                  <td>Window 3</td>
                  <td class="windows" id="window3val" >---</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="popup" id="popup">
        <div class="popup-content">
          <h1 class="queue-number" id="popup-queue-number">G01</h1>
          <span class="close" id="closeBtn">&times;</span>
          <p id="popup-window-number">Window 1</p>
        </div>
      </div>

      <div>

      </div>
      <footer>
        <b style="background-color: #020000;">
          <p>&copy; 2024 Cebu Eastern College. All Rights Reserved.</p>
        </b>
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
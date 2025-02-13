<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>

      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
      <script type="text/javascript" src="../scripts/fadetransition.js"></script>
      <script type="text/javascript" src="../scripts/notify.js"></script>
      <script type="text/javascript" src="../scripts/prettify.js"></script>
      <link rel="stylesheet" href="../css/loader.css">
      <!-- <link rel="stylesheet" href="../css/user_window.css"> -->
      <link rel="stylesheet" href="../css/notify.css">
      <link rel="stylesheet" href="../css/prettify.css">
      <link rel="stylesheet" href="../css/bootstrap.css">
      <link rel="icon" type="image/x-icon" href="./images/logo.png">
      <title>SmartQueue</title>
    </head>

    <body>
      <style>
        body {
          overflow: hidden;
        }

        .video-container {
          position: relative;
          padding-bottom: 50%;
          /* 16:9 ratio */
          height: 0;
          overflow: hidden;

          padding-top: 0;
          margin: 0;
          margin-top: 10%;
        }

        .frame {
          position: absolute;
          top: 0;
          left: 0;
          bottom: 0;
          right: 0;
          width: 100%;
          height: 100%;
          border: none;

        }

        .datetime {
          color: #333;
          font-size: 3.5rem;
          text-transform: uppercase;

          margin-top: 5%;
          align-items: center;
          justify-content: center;
          display: flex;
          font-weight: bold
        }

        #date {
          margin-right: 2%;
        }

        #time {
          margin-left: 2%;
        }

        .slidetext {
          display: inline-block;
          width: 120%;
          white-space: nowrap;
          animation: slide 20s linear infinite;
          margin: 0 24px;
          position: absolute;
          font-size: 24px;
          color: red;
          font-weight: bold;
          bottom: 0;
        }

        .slidetext-background {
          width: 100vw;
          background-color: black;
          height: 5%;
          bottom: 0;
          position: absolute;
        }

        @keyframes slide {
          from {
            transform: translate3d(100%, 0, 0);
          }

          to {
            transform: translate3d(-100%, 0, 0);
          }
        }

        footer {
          width: 100%;
          color: black;
          text-align: center;
          position: fixed;
          bottom: 3%;
          background-color: #E8F4F8;
        }

        td {
          font-weight: bold;
        }

        #window1val:empty::after {
          content: "---";
        }

        #window2val:empty::after {
          content: "---";
        }

        #window3val:empty::after {
          content: "---";
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

        /* #popup-queue-number{
        font-size: 5rem;
      } */
        #popup-window-number {
          font-size: 5rem;
          color: #fff;
          background-color: #00509d;
        }
      </style>
      <div class="container-fluid" style="background-color: #E8F4F8;">
        <div class="row">
          <div class="col" style="padding: 0; margin: 0;">
            <div class="datetime">
              <div id="date"></div>|<div id="time"></div>
            </div>
            <div class="video-container">
              <video class="frame" id="video-ads" autoplay muted controls>
              <source id="videoSource" src="media/videosample3.mp4" type="video/mp4">
            </div>

            <footer>
              <p>&copy; 2024 Cebu Eastern College. All Rights Reserved.</p>
            </footer>

          </div>
          <div class="col" style="padding: 0; margin: 0;">
            <table class="table"
              style="text-align: center; font-size: 3rem; height: 90vh; align-items: center; justify-content: center;">
              <thead>
                <tr>
                  <th scope="col" class="col-2">WINDOW</th>
                  <th scope="col" colspan="2">NOW SERVING</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td colspan="2" id="window1val"></td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td colspan="2" id="window2val"></td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td colspan="2" id="window3val"></td>
                </tr>

              </tbody>
            </table>
          </div>
          <div class="slidetext-background"></div>
          <div class="slidetext">
            <span>ATTENTION! ONCE YOUR NUMBER IS CALLED AND YOU ARE NOT AROUND, YOU NEED TO GET ANOTHER PRIORITY
              NUMBER.
              &ensp;</span>
          </div>
        </div>

        <div class="popup" id="popup">
          <div class="popup-content">
            <h1 class="queue-number" id="popup-queue-number"></h1>
            <span class="close" id="closeBtn">&times;</span>
            <p id="popup-window-number">Winadow 1</p>
          </div>
        </div>


        <div class="load-wrapper">
          <div class="main-loader">
            <div class="box-loader">
            </div>
          </div>
        </div>


        <script type="text/javascript" src="../scripts/bootstrap.js"></script>
        <script type="text/javascript" src="../scripts/staff/user_window.js"></script>
        <script type="text/javascript" src="../scripts/profilePic.js"></script>
        <script>
            //----- FETCH PROFILE IMAGE DURING LOAD
            window.onload = function(){
                FetchImage(".profile");
            }
            
        </script>

    </body>

    </html>
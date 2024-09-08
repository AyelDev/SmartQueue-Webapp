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
            <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="./scripts/fadetransition.js"></script>
            <link rel="stylesheet" href="./css/loader.css">
            <title>SmartQueue</title>
            <style>
                table {
                    font-family: tahoma;
                    border-collapse: collapse;
                    width: 64%;
                    /* margin: 10px auto; */
                }

                td,
                th {
                    border: 3px solid #dddddd;
                    text-align: left;
                    padding: 10px;
                    text-align: center;
                }

                th {
                    border: 3px solid black;
                    text-transform: uppercase;
                }

                tr:nth-child(even) {
                    background-color: lightgrey;
                }

                .container {
                    width: 100%;
                    height: 100vh;
                    background-color: #A0CFEC;
                    margin: 0 auto;
                    border-radius: 30px;
                    padding: 20px;
                    box-sizing: border-box;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    overflow: auto;
                }

                .ads {
                    width: 35%;
                    height: 97%;
                    background-color: transparent;
                    border-radius: 40px;
                    text-align: center;
                    border: 3px solid blue;
                    padding: 20px;
                    box-sizing: border-box;
                    float: right;
                    gap: 10px;
                }

                .windowads {

                    width: 80%;
                    height: 65%;
                    background-color: white;
                    margin: 20px auto;
                    text-align: center;
                    border-radius: 20px;
                    padding: 20px;
                    box-sizing: border-box;
                }

                .time {

                    width: 80%;
                    height: 10%;
                    background-color: white;
                    margin: 10px auto;
                    text-align: center;
                    border-radius: 20px;
                    box-sizing: border-box;
                    padding: 8px;
                }

                .h1,
                h2,
                h3,
                p {
                    margin-top: 8px;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="ads">
                    <h3>THIS IS VIDEO ADS</h3><b></b>
                    <div class="windowads">
                        <h2 style="margin-top: 10px;"><b>NOW SERVING</b></h2>
                        <h1 id="serving-number" style="font-size: 85px;"><b>G O1</b></h1>
                        <p id="serving-window" style="font-size: 20px;"><b>WINDOW 1</b></p>
                    </div>
                    <!-- <div class="time">
                <h2 id="current-time" style="font-size: 25px;">08:54:34 AM</h2><b></b>
            </div> -->
                </div>
                <table>
                    <tr>
                        <th><b>Window</b></th>
                        <th><b>Queue No.</b></th>

                    </tr>
                    <tr>
                        <td>Window 1</td>
                        <td>G 01</td>

                    </tr>
                    <tr>
                        <td>Window 2</td>
                        <td>G 02</td>
                    </tr>
                    <tr>
                        <td>Window 3</td>
                        <td>G 03</td>
                    </tr>
                    <tr>
                        <td>Window 4</td>
                        <td>G 04</td>
                    </tr>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <script>
function updateServing() {
    const servingNumber = document.getElementById('serving-number');
    const servingWindow = document.getElementById('serving-window');

    // Queue and window arrays
    const queueData = [
        { number: 'G 01', window: 'WINDOW 1' },
        { number: 'G 02', window: 'WINDOW 2' },
        { number: 'G 03', window: 'WINDOW 3' },
        { number: 'G 04', window: 'WINDOW 4' },
        { number: 'P 01', window: 'WINDOW 2' },
    ];

    // Select a random queue entry
    const { number, window } = queueData[Math.floor(Math.random() * queueData.length)];

    // Update DOM elements
    servingNumber.textContent = number;
    servingWindow.textContent = window;
}

function updateTime() {
    const timeElement = document.getElementById('current-time');
    const now = new Date();
    
    // Format time with zero padding and AM/PM conversion
    const hours = now.getHours();
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const ampm = hours >= 12 ? 'PM' : 'AM';
    const displayHours = hours % 12 || 12;

    // Update time element
    timeElement.textContent = `${displayHours}:${minutes}:${seconds} ${ampm}`;
}

// Update serving and time every second
setInterval(() => {
    updateServing();
    updateTime();
}, 1000);
            </script>

            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>
        </body>

        </html>
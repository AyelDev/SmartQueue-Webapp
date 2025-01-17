<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.sessionStaff}">
    <c:redirect url="/" />
</c:if>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="./scripts/ping.js"></script>
    <script type="text/javascript" src="./scripts/fadetransition.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="./css/loader.css">
    <link rel="stylesheet" href="../css/staffpage.css">
    <title>Staff Page</title>
<<<<<<< HEAD
    
=======
    <style>
        :root {
            font-size: 16px;
        }

        * {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            width: 100%;
            height: 100vh;
            background-color: #F5F5F5;
            overflow: hidden;
        }

        .cover {
            width: 100%;
            height: 100%;
            background-color: white;
        }

        .rightnav {
            width: 85%;
            height: 100%;
            background-color: transparent;
            float: right;
        }

        .card-section {
            width: 100%;
            height: 30%;
            background-color: transparent;
            display: flex;
            flex-direction: column;
            margin-left: 20px;
            overflow: hidden;
        }

        .dash {
            width: 100%;
            height: 20%;
            background-color: #1e91d0;
            text-align: start;
            font-size: 1.5625rem;
            display: inline-block;
            position: relative;
            color: white;
            margin-bottom: 1.25rem;
            line-height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            padding: 0 1rem;
        }
        .dash b{
            margin-left: -5px;
            flex-grow: 1;
            font-weight: normal;
        }

        .card-container {
            width: 100%;
            height: 75%;
            background-color: transparent;
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
        }

        .card {
            width: 25%;
            height: 65%;
            background-color: #EEEEEE;
            box-sizing: border-box;
            margin-top: 30px;
            border-radius: 10px;
            border: none;
            box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
            text-align: center;
        }

        .card:hover {
            background-color: #E5E4E2;
        }

        .card h3,
        .card p {
            line-height: 40px;
            text-decoration: none;
            font-weight: normal;
        }

        .card p {
            text-align: start;
            margin-left: 30px;
            text-decoration: none;
        }

        .graphcalendar-container {
            width: 90%;
            height: 50%;
            background-color: #EEEEEE;
            justify-content: center;
            align-items: center;
            display: inline-block;
            margin-left: 60px;
            border-radius: 10px;
            border: none;
            position: relative;
            box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
        }
        .leftnav {
            width: 15%;
            height: 100%;
            background-color: #1e91d0;
            padding: 10px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .top-lnav {
            width: 100%;
            height: 20%;
            background-color: transparent;
            text-align: center;
            display: block;
            position: relative;
            line-height: 10px;
            font-size: 0.875rem;
            color: white;
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
            line-height: 3px;
        }

        .bottom-lnav {
            width: 100%;
            height: 80%;
            background-color: transparent;
            text-align: center;
            padding-top: 4px;
        }

        .bottom-lnav a {
            display: block;
            margin: 1rem 0;
            color: white;
            text-decoration: none;
            font-size: 1.2rem;
            transition: color 0.3s ease;
            margin-top: 40px;
            margin-left: 10%;
            text-align: start;
            justify-content: center;
            align-items: center;
            font-weight: normal;
        }

        .bottom-lnav a:hover {
            padding: 15px 20px 15px 20px;
            width: 12.8vw;
            background-color: white;
            position: relative;
            margin-left: -18px;
            color: black;
            border-radius: 20px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
			border-right: 8px solid #37AFE1;
            transition-timing-function: cubic-bezier(0.445, 0.05, 0.55, 0.95);
        }

        .button-profile {
            align-items: center;
			justify-content: center;
			display: flex;
			width: 10vw;
		    margin-top: 1px;
			margin-left: 36px;
			border-radius: 10px;
			padding: 5px 3px 5px 3px;
					/*tlbr*/
			overflow: hidden;
			cursor: pointer;
			border: none;
            float: right;
            margin-right: 5%;
            background-color: white;
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
			/* margin-left: 2.3rem; */
			position: absolute;
			background-color: none;
			width: 9.5vw;
			align-items: center;
			justify-content: center;
			text-align: center;
			z-index: 1;
			display: none;
            /* float: right;
            margin-right: 5%; */
            top: 100%;
            right: 5.8%;
		}

        .staffProfile a {
            text-decoration: none;
            background-color: white;
            color: black;
            overflow: hidden;
            width: 10vw;
            text-align: center;
            align-items: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: .5rem 0 0 0;
            height: 1.5rem;
            float: right;
            margin-right: 3%;
            font-size: 1rem;
        }

        .staffProfile a:hover {
            background-color: #EEEEEE;
            border-radius: 7px;
            color: black;
        }

        .graph {
            width: 50%;
            height: 45vh;
            background-color: #F5F5F5;
            margin-top: 15px;
            margin-left: 10px;
            box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
            border-radius: 3px;
        }

        .calendar {
            width: 43%;
            height: 40vh;
            background-color: #F5F5F5;
            float: right;
           margin-right: 10px;
           margin-top: 15px;
           box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
            border-radius: 5px;
            padding: 20px;
        }

        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        .calendar-body {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            grid-gap: 5px;
            text-align: center;
        }

        .day, .date {
            padding: 5px;
            border-radius: 50%;
        }

        .date:hover {
            background-color: lightgrey;
        }

        .current-day {
            background-color: #5CB3FF;
            color: white;
        }
        
        .dash img.picture{
            width: 30px; 
            height: 30px;
            object-fit: contain;
            filter: invert(1);
        }
        .right-icons {
            display: flex;
            gap: 1.5rem;
            align-items: center;
            margin-right: -15px;
            margin-top: 14px;
    }
    .icon-container {
            position: relative;
            display: inline-block;
        }

        .icon-container .tooltip-text {
            visibility: hidden;
            width: 5vw;
            height: 3vh;
            background-color: #EEEEEE;
            color: black;
            text-align: center;
            line-height: 20px;
            font-size: 1rem;
            border-radius: 5px;
            padding: 5px 3px 5px 3px;
            position: absolute;
            z-index: 1;
            top: 87%; 
            left: 50%;
            margin-left: -30px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .icon-container:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }
        @media (max-width: 1200px) {
            .card {
                width: 30%;
            }

            .graph, .calendar {
                width: 45%;
            }

            .leftnav {
                width: 20%;
            }
        }

        @media (max-width: 768px) {
            .card {
                width: 100%;
                margin: 10px 0;
            }

            .graph, .calendar {
                width: 100%;
            }

            .leftnav {
                width: 30%;
            }

            .button-profile {
                width: 40%;
                margin: 0 auto;
            }

            .bottom-lnav a {
                font-size: 1rem;
            }
        }

        @media (max-width: 480px) {
            .button-profile {
                width: 80%;
            }

            .dash {
                flex-direction: column;
                align-items: flex-start;
            }

            .rightnav {
                padding: 10px;
            }
        }
        .bottom-lnav img {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            filter: invert(1);
        }
        .bottom-lnav a:hover img {
            filter: brightness(0) saturate(100%) hue-rotate(200deg); /*blue color*/
            transform: scale(1.2);
        }
    </style>
>>>>>>> origin/IrishV4
</head>

<body>
    <div class="container">
        <div class="cover">
            <div class="rightnav">
                <div class="card-section">
                    <div class="dash"> <b>Dashboard</b>
                        <div class="right-icons">

                            <div class="icon-container">
                                <a href="#"></a>
                                <img src="./images/message.png" class="picture"/>
                                <span class="tooltip-text">Message</span>
                            </div>
                        </div>
                        
                        <button class="button-profile"><img src="./images/profile.png" alt="" class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
                <div class="staffProfile" id="staffProfile">
                    <a href="#">Settings</a>
                    <a href="login">Signout</a>
                </div>
                    </div>

                    <div class="card-container">
                        <div class="card">
                            <h3>Queue Status</h3>
                            <p>Total Request: </p>
                        </div>
                        <div class="card">
                            <h3>Current Queue</h3>
                            <p>Now Serving: </p>
                        </div>
                        <div class="card">
                            <h3>Waiting Time </h3>
                            <p>Average Waiting Time: </p>
                        </div>
                    </div>
                </div>

                <div class="graphcalendar-container">
                    <div class="calendar"></div>
                    <div class="graph">
                        <canvas id="queueTrendChart"></canvas> 
                    </div>
                </div>
            </div>

            <div class="leftnav">
                <div class="top-lnav">
                    <img src="./images/logo.png" class="cec">
                    <p class="title"><br><b>Cebu Eastern College</b></p>
                </div>
                
                <div class="bottom-lnav">
                    <b><a href="staffpage"><img src="./images/dashboard.png" alt="Dashboard Icon">Dashboard</a></b>
                    <b><a href="userwindow"><img src="./images/display.png" alt="UserWindow Icon">User Window</a></b>
                    <b><a href="counterwindow"><img src="./images/counter.png" alt="CounterWindow Icon">Counter Window</a></b>
                    <b><a href="addstudent"><img src="./images/studentlist.png" alt="StudentList Icon">Student List</a></b>
                    <b><a href="entertainment"><img src="./images/entertainment.png" alt="Entertainment Icon">Entertainment</a></b>
                </div>
            </div>
        </div>
    </div>


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

            const ctx = document.getElementById('queueTrendChart').getContext('2d');
            const queueTrendChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'], // X-axis labels
                    datasets: [{
                        label: 'Request Per Day', // Chart label
                        data: [50, 75, 60, 90, 55, 40], // Replace with actual data
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: ''
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'QUEUE TREND'
                            }
                        }
                    }
                }
            });

            // Calendar cd
            const calendarElement = document.querySelector('.calendar');
            let currentDate = new Date();

            function renderCalendar() {
                const year = currentDate.getFullYear();
                const month = currentDate.getMonth();

                const firstDayOfMonth = new Date(year, month, 1).getDay();
                const lastDateOfMonth = new Date(year, month + 1, 0).getDate();
                const lastDayOfPrevMonth = new Date(year, month, 0).getDate();

                let days = "";

                // Display previous month's days
                for (let i = firstDayOfMonth; i > 0; i--) {
                    days += `<div class="date">${lastDayOfPrevMonth - i + 1}</div>`;
                }

                // Display current month's days
                for (let i = 1; i <= lastDateOfMonth; i++) {
                    const isToday = i === new Date().getDate() && month === new Date().getMonth() && year === new Date().getFullYear();
                    days += `<div class="date ${isToday ? 'current-day' : ''}">${i}</div>`;
                }
               
                calendarElement.innerHTML = `
                    <div class="calendar-header">
                        <button id="prev-month">Prev</button>
                        <button id="next-month">Next</button>
                    </div>
                    <div class="calendar-body">
                        <div class="day">Sun</div>
                        <div class="day">Mon</div>
                        <div class="day">Tue</div>
                        <div class="day">Wed</div>
                        <div class="day">Thu</div>
                        <div class="day">Fri</div>
                        <div class="day">Sat</div>
                        ${days}
                    </div>
                `;

                document.getElementById('prev-month').addEventListener('click', function () {
                    currentDate.setMonth(currentDate.getMonth() - 1);
                    renderCalendar();
                });

                document.getElementById('next-month').addEventListener('click', function () {
                    currentDate.setMonth(currentDate.getMonth() + 1);
                    renderCalendar();
                });
            }

            renderCalendar();
        });
    </script>

    <div class="load-wrapper">
        <div class="main-loader">
            <div class="box-loader"></div>
        </div>
    </div>
</body>

</html>
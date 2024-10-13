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
    <script type="text/javascript" src="./scripts/fadetransition.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="./css/loader.css">
    <link rel="stylesheet" href="./css/staffpage.css">
    <title>Staff Page</title>
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
            background-color: white;
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

        .tp-rnav {
            width: 100%;
            height: 30%;
            background-color: transparent;
            display: flex;
            flex-direction: column;
            margin-left: 20px;
            overflow: hidden;
        }

        .dash {
            width: 20%;
            height: 20%;
            background-color: transparent;
            text-align: center;
            font-size: 1.5625rem;
            display: inline-block;
            position: relative;
            color: black;
            margin-bottom: 1.25rem;
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
            box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
            text-align: center;
            border: none;
        }

        .card:hover {
            background-color: #E5E4E2;
        }

        .card h3,
        .card p {
            line-height: 40px;
            text-decoration: underline;
        }

        .card p {
            text-align: start;
            margin-left: 30px;
            text-decoration: none;
        }

        .b-container {
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
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
        }

        .b-container:hover {
            background-color: #E5E4E2;
        }
        .leftnav {
            width: 15%;
            height: 100%;
            background-color: #79BAEC;
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
            text-align: center;
            justify-content: center;
            align-items: center;
        }

        .bottom-lnav a:hover {
            padding: 5px 10px;
            background-color: white;
            position: relative;
            left: 20px;
            color: black;
            border-radius: 30px;
            transition-timing-function: cubic-bezier(0.445, 0.05, 0.55, 0.95);
        }

        .button-profile {
            align-items: center;
            justify-content: center;
            display: flex;
            width: 10vw;
            text-align: center;
            margin-top: 10px;
            margin-left: 1.875rem;
            border-radius: 0.625rem;
            padding: 0.9375rem 0.625rem;
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

        .staffProfile a {
            text-decoration: none;
            color: white;
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
            margin-left: 30px;
        }

        .staffProfile a:hover {
            background-color: lightgrey;
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
    </style>
</head>

<body>
    <div class="container">
        <div class="cover">
            <div class="rightnav">
                <div class="tp-rnav">
                    <div class="dash"><b>DASHBOARD</b></div>

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

                <div class="b-container">
                    <div class="calendar"></div>
                    <div class="graph">
                        <canvas id="queueTrendChart"></canvas> 
                    </div>
                </div>
            </div>

            <div class="leftnav">
                <div class="top-lnav">
                    <img src="./images/logo.png" class="cec">
                    <b class="title"><br>Cebu Eastern College</b>
                </div>
                <button class="button-profile"><img src="./images/profile.png" alt="" class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
                <div class="staffProfile" id="staffProfile">
                    <a href="#">Settings</a>
                    <a href="logout">Signout</a>
                </div>
                <div class="bottom-lnav">
                    <b><a href="userwindow">User Window</a></b>
                    <b><a href="counterwindow">Counter Window</a></b>
                    <!-- <b><a href="#">Queue List</a></b> -->
                    <b><a href="addstudent">Add Student</a></b>
                    <b><a href="entertainment.jsp">Advertisement</a></b>
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
                    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'], 
                    datasets: [{
                        label: 'Request Per Day', // Chart label
                        data: [50, 75, 60, 90, 55, 40], 
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

                for (let i = firstDayOfMonth; i > 0; i--) {
                    days += `<div class="date">${lastDayOfPrevMonth - i + 1}</div>`;
                }

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

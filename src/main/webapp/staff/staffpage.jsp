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
    <link rel="stylesheet" href="./css/staffpage.css">
    <link rel="stylesheet" href="..//css/staffpage.css">
    <title>Staff Page</title>
   
</head>
<body>
    <div class="container">
        <div class="cover">
            <div class="rightnav">
                <div class="card-section">
                    <div class="dash"> <b>Dashboard</b>
                        <div class="right-icons">

                            <div class="icon-container">
                                <a href="message"></a>
                                <img src="./images/message.png" class="picture"/>
                                <span class="tooltip-text">Message</span>
                            </div>
                        </div>
                        
                        <button class="button-profile"><img src="./images/profile.png" alt="" class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
                <div class="staffProfile" id="staffProfile">
                    <a href="setting">Settings</a>
                    <a href="logout">Signout</a>
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
                    <div class="calendar">
                        <header>
                            <button onclick="changeMonth(-1)">&lt;</button>
                            <h2 id="monthYear"></h2>
                            <button onclick="changeMonth(1)">&gt;</button>
                        </header>
                        <table>
                            <thead>
                                <tr>
                                    <th>Su</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th>
                                </tr>
                            </thead>
                            <tbody id="calendarBody"></tbody>
                        </table>
                    </div>
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
                    <b><a href="staffdashboard"><img src="./images/dashboard.png" alt="Dashboard Icon">Dashboard</a></b>
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
          let currentDate = new Date();

        function renderCalendar() {
            const monthYear = document.getElementById("monthYear");
            const calendarBody = document.getElementById("calendarBody");

            const year = currentDate.getFullYear();
            const month = currentDate.getMonth();

            // Set the month and year title
            monthYear.textContent = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });

            // Get the first day of the month and the number of days in the month
            const firstDay = new Date(year, month, 1).getDay();
            const daysInMonth = new Date(year, month + 1, 0).getDate();

            // Clear the calendar body
            calendarBody.innerHTML = "";
            let row = document.createElement("tr");

            // Create empty cells before the first day of the month
            for (let i = 0; i < firstDay; i++) {
                row.appendChild(document.createElement("td"));
            }

            // Fill in the days of the month
            for (let day = 1; day <= daysInMonth; day++) {
                if (row.children.length === 7) {
                    calendarBody.appendChild(row);
                    row = document.createElement("tr");
                }

                const cell = document.createElement("td");
                cell.textContent = day;

                const today = new Date();
                if (day === today.getDate() && month === today.getMonth() && year === today.getFullYear()) {
                    cell.classList.add("today");
                }

                cell.onclick = () => {
                    document.querySelectorAll(".selected").forEach(el => el.classList.remove("selected"));
                    cell.classList.add("selected");
                };

                row.appendChild(cell);
            }

            calendarBody.appendChild(row);
        }

        function changeMonth(offset) {
            currentDate.setMonth(currentDate.getMonth() + offset);
            renderCalendar();
        }
        //for previous and next button
        document.querySelector("button[onclick='changeMonth(-1)']").addEventListener('click', function() {
        changeMonth(-1); // Go to previous month
    });
    document.querySelector("button[onclick='changeMonth(1)']").addEventListener('click', function() {
        changeMonth(1); // Go to next month
    });

        // Render the initial calendar
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
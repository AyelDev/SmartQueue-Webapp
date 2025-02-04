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
            <link rel="stylesheet" type="text/css" href="./css/jquery-confirm.min.css" />
			<script type="text/javascript" src="./scripts/jquery-confirm.min.js"></script>
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
                                        <img src="./images/message.png" class="picture" />
                                        <span class="tooltip-text">Message</span>
                                    </div>
                                </div>

                                <button class="button-profile"><img src="./images/profile.png" alt=""
                                        class="profile"><b><c:out value="${sessionScope.sessionStaff.firstname}"></c:out></b><img src="./images/caretdown.png" alt=""
                                        class="caretdown"></button>
                                <div class="staffProfile" id="staffProfile">
                                    <a href="setting">Settings</a>
                                    <a href="logout">Signout</a>
                                </div>
                            </div>

                            <div class="card-container">
                                <div class="card">
                                    <h3>Queue Status</h3>
                                    <p>Total Admission: <span id="total-admission">loading...</span></p>
                                </div>
                                <div class="card">
                                    <h3>Queue Status</h3>
                                    <p>Total Records: <span id="total-records">loading...</span></p>
                                </div>
                                <div class="card">
                                    <h3>Queue Status</h3>
                                    <p>Total Archiving: <span id="total-archiving">loading...</span></p>
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
                                            <th>Su</th>
                                            <th>Mo</th>
                                            <th>Tu</th>
                                            <th>We</th>
                                            <th>Th</th>
                                            <th>Fr</th>
                                            <th>Sa</th>
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
                            <b><a href="staffdashboard"><img src="./images/dashboard.png"
                                        alt="Dashboard Icon">Dashboard</a></b>
                            <b><a href="userwindow"><img src="./images/display.png" alt="UserWindow Icon">User
                                    Window</a></b>
                            <b><a href="counterwindow"><img src="./images/counter.png" alt="CounterWindow Icon">Counter
                                    Window</a></b>
                            <b><a href="addstudent"><img src="./images/studentlist.png" alt="StudentList Icon">Student
                                    List</a></b>
                            <b><a href="entertainment"><img src="./images/entertainment.png"
                                        alt="Entertainment Icon">Entertainment</a></b>
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
                    let admissionCount = 0;
                    let recordsCount = 0;
                    let archiveCount = 0;

                    Promise.all([
                        fetch('/getallentries'),
                        fetch('/JsonListMonthlyQueueEntries')
                    ]).then(responses => {
                        responses.forEach(response => {
                            if (!response.ok) {
                                throw new Error('Network response problem' + response.statusText);
                            }
                        });
                        return Promise.all(responses.map(response => response.json()));
                    }).then(data => {
                        staffNum = data[0].length; // All Entries
                        studentNum = data[1].length; // Monthly Entries
                        
                        let monthValues = [
                            data[1][0].inquiries, 
                            data[1][1].inquiries,
                            data[1][2].inquiries,
                            data[1][3].inquiries, 
                            data[1][4].inquiries, 
                            data[1][5].inquiries, 
                            data[1][6].inquiries, 
                            data[1][7].inquiries, 
                            data[1][8].inquiries,
                            data[1][9].inquiries, 
                            data[1][10].inquiries,
                            data[1][11].inquiries];
                        lineChart(monthValues); 

                        data[0].forEach( item =>{
                            switch (true) {
			                case item.serviceType.includes('General'):
                                admissionCount++;
			                    break;
                            case item.serviceType.includes('Records'):
                                recordsCount++;
			                    break;
                            case item.serviceType.includes('Archiving'):
                                archiveCount++;
			                    break;
                            }
                        });

                        document.getElementById("total-admission").innerHTML = admissionCount;
                        document.getElementById("total-records").innerHTML = recordsCount;
                        document.getElementById("total-archiving").innerHTML = archiveCount;


                    })
                    .catch(error => {
                            console.error('There was a problem with the fetch operation:', error);
                    });

                    function lineChart(monthValue) {
                        let queueTrendChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: ['January',
                                    'February',
                                    'March',
                                    'April',
                                    'May',
                                    'June',
                                    "July",
                                    "August",
                                    "September",
                                    "October",
                                    "November",
                                    "December"], // X-axis labels
                                datasets: [{
                                    label: 'Total Request', // Chart label
                                    data: [monthValue[0],
                                    monthValue[1],
                                    monthValue[2],
                                    monthValue[3],
                                    monthValue[4],
                                    monthValue[5],
                                    monthValue[6],
                                    monthValue[7],
                                    monthValue[8],
                                    monthValue[9],
                                    monthValue[10],
                                    monthValue[11]], // Replace with actual data
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
                                            text: 'CEC SMART QUEUE SYSTEM'
                                        }
                                    }
                                }
                            }
                        });
                    }
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
                    document.querySelector("button[onclick='changeMonth(-1)']").addEventListener('click', function () {
                        changeMonth(-1); // Go to previous month
                    });
                    document.querySelector("button[onclick='changeMonth(1)']").addEventListener('click', function () {
                        changeMonth(1); // Go to next month
                    });

                    // Render the initial calendar
                    renderCalendar();
                });

                              //---------------------------------------------------------------------------------------------------IF NO PIN SETUP
                              let getStaffSessionPin = <c:out value="${sessionScope.sessionStaff.getPin()}"></c:out> + '';
                let getStaffSessionID = <c:out value="${sessionScope.sessionStaff.staffID}"></c:out> + '';

                if(getStaffSessionPin == '0' || getStaffSessionPin == 0){


                $.confirm({
                        title: 'Need to setup your 4 digit pin!',
                        content: `
                                <p>Welcome!</p>
                                <br>
                                <p>To make logging in easier and faster, please set up your PIN. If you ever forget your password, your PIN will help you regain access.</p>
                                <label>Enter Pin</label>
                                <input id="pin" type="password" name="inputNUmber" min="4">
                                <label>Confirm Pin</label>
                                <input id="confirm-pin" type="password" name="inputNUmber" min="4">
                                `,
                        boxWidth: '30%',
                        useBootstrap: false,
                        type: 'blue',
                        buttons: {
                        formSubmit: {
                        text: 'Confirm',
                        btnClass: 'btn-blue',
                action: function () {
                        var pin = this.$content.find('#pin').val();
                        var pinconfrm = this.$content.find('#confirm-pin').val();
                        
                        if(pin === '' || pinconfrm === ''){
                            errorInputAlert('Please make sure both the PIN and confirm PIN fields are filled out.');
                            return false;
                        }

                        if(pin !== pinconfrm){
                            errorInputAlert('Please make sure both the PIN and confirm PIN fields are the same.');
                            return false;
                        }

                        if(pin.length !== 4 && pinconfrm !== 4 ){
                            errorInputAlert('Must be 4 digit pin');
                            return false;
                        }

                        if(pin === '1234' || pin === '0000' || pin === '4321' || pin === '9999'){
                            errorInputAlert('These are basic PINs; try using random numbers.');
                            return false;
                        }
                        
                        //send request
                        sendPinRequest(pin, getStaffSessionID);
                    }
                }
            }
        });
    }

    //SEND PIN SETUP REQUEST

    function errorInputAlert(content){
        $.alert({
            title: 'Error',
            content: content,
            boxWidth: '30%',
            useBootstrap: false,
            type: 'red'
        });
    }

    function sendPinRequest(pin, sessionId){
        $.ajax({
            url: '/StaffPin',   
            type: 'POST',               
            data: {
                pin: pin,      
                staffId: sessionId
            },
                success: function(response) {
                    alert('Success: ' +  response);
                    window.location.replace(window.location.origin + '/logout');
            },
                error: function(xhr, status, error) {
                    alert('Error: ' + error);
                    location.reload();
            }
        });
    }
            </script>
            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader"></div>
                </div>
            </div>
        </body>
        </html>
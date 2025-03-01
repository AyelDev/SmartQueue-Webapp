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
            <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="../scripts/ping.js"></script>
            <script type="text/javascript" src="../scripts/fadetransition.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script type="text/javascript" src="../scripts/jquery-confirm.min.js"></script>
            <link rel="stylesheet" type="text/css" href="../css/jquery-confirm.min.css" />
            <link rel="stylesheet" href="../css/loader.css">
            <link rel="stylesheet" href="../css/staffpage.css">
            <link rel="stylesheet" href="../css/staffpage.css">
            <link rel="icon" type="image/x-icon" href="./images/logo.png">
            <title>Staff Page</title>
        </head>

        <body>
            <div class="container">
                <div class="cover">
                    <div class="rightnav">
                        <div class="card-section">
                            <div class="dash"> <b>Dashboard</b>

                                <button class="button-profile"><img src="" alt="" class="profile"><b></b>
                                    <c:out value="${sessionScope.sessionStaff.firstname}"></c:out>
                                    </b>
                                    <svg xmlns="http://www.w3.org/2000/svg" height="10" width="6.25" class="caretdown"
                                        viewBox="0 0 320 512">
                                        <path
                                            d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z" />
                                    </svg>
                                </button>
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
                            <b><a href="staffdashboard"><img src="./images/dashboard.png" alt="">Dashboard</a></b>
                            <b><a href="userwindow"><img src="./images/display.png" alt="">User
                                    Window</a></b>
                            <b><a href="counterwindow"><img src="./images/counter.png" alt="">Counter
                                    Window</a></b>
                            <b><a href="addstudent"><img src="./images/studentlist.png" alt="">Student
                                    List</a></b>
                            <b><a href="entertainment"><img src="./images/entertainment.png"
                                        alt="">Entertainment</a></b>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript" src="../scripts/staff/staffpage.js"></script>
            <script type="text/javascript" src="../scripts/profilePic.js"></script>
            <script>
                //----- FETCH PROFILE IMAGE DURING LOAD
                window.onload = function () {
                    FetchImage(".profile");
                }

                //---------------------------------------------------------------------------------------------------IF NO PIN SETUP
                let getStaffSessionPin = <c:out value="${sessionScope.sessionStaff.getPin()}"></c:out> + '';
                let getStaffSessionID = <c:out value="${sessionScope.sessionStaff.staffID}"></c:out> + '';

                if (getStaffSessionPin == '0' || getStaffSessionPin == 0) {
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

                                    if (pin === '' || pinconfrm === '') {
                                        errorInputAlert('Please make sure both the PIN and confirm PIN fields are filled out.');
                                        return false;
                                    }

                                    if (pin !== pinconfrm) {
                                        errorInputAlert('Please make sure both the PIN and confirm PIN fields are the same.');
                                        return false;
                                    }

                                    if (pin.length !== 4 && pinconfrm !== 4) {
                                        errorInputAlert('Must be 4 digit pin');
                                        return false;
                                    }

                                    if (pin === '1234' || pin === '0000' || pin === '4321' || pin === '9999') {
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

                function errorInputAlert(content) {
                    $.alert({
                        title: 'Error',
                        content: content,
                        boxWidth: '30%',
                        useBootstrap: false,
                        type: 'red'
                    });
                }

                function sendPinRequest(pin, sessionId) {
                    $.ajax({
                        url: '/StaffPin',
                        type: 'POST',
                        data: {
                            pin: pin,
                            staffId: sessionId
                        },
                        success: function (response) {
                            alert('Success: ' + response);
                            window.location.replace(window.location.origin + '/logout');
                        },
                        error: function (xhr, status, error) {
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
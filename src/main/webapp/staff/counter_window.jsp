<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${empty sessionScope.sessionStaff && empty sessionScope.sessionAdmin.getUsername()}">
            <c:redirect url="/" />
        </c:if>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="./scripts/ping.js"></script>
            <script type="text/javascript" src="./scripts/fadetransition.js"></script>
            <script type="text/javascript" src="./scripts/notify.js"></script>
            <script type="text/javascript" src="./scripts/prettify.js"></script>
            <link rel="stylesheet" href="./css/loader.css">
            <link rel="stylesheet" href="./css/prettify.css">
            <link rel="stylesheet" href="./css/notify.css">
            <link rel="stylesheet" href="../css/counter_window.css">
            <title>SmartQueue</title>

        </head>

        <body>
            <div class="container">

                <div class="rightnav">
                    <div class="scontainer">
                        <select id="counter-list" onchange="counterChangeListOnChange()">
                            <option value="" selected>SELECT COUNTER LIST</option>
                        </select>
                        <section class="real-time">
                            <span id="date"></span> | <span id="time"></span>
                        </section>

                        <div class="table-container">
                            <h2>PRIORITY NUMBER</h2>
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th class="thd">QUEUE NO.</th>
                                        <th>PURPOSE</th>
                                        <th>NAME</th>
                                        <th>ID NUMBER</th>
                                        <th>DATE</th>
                                        <th>STATUS</th>
                                        <th>WINDOW NO.</th>
                                    </tr>
                                </thead>
                                <tbody id="priority-number-table">

                                </tbody>
                            </table>
                        </div>
                        </section>
                        <section class="tables">

                            <div class="table-container">
                                <h2>COUNTER ACCESS</h2>


                                <table class="data-table">
                                    <thead>
                                        <tr>
                                            <th class="thd">QUEUE NO.</th>
                                            <th>PURPOSE</th>
                                            <th>NAME</th>
                                            <th>ID NUMBER</th>
                                            <th>DATE</th>
                                            <th>STATUS</th>
                                            <th>WINDOW NO.</th>
                                        </tr>
                                    </thead>
                                    <tbody id="counter-access-table">

                                    </tbody>
                                </table>
                            </div>

                            <section class="actions">
                                <button id="call-button" onclick="transferRow()" class="btn call"><b>CALL</b></button>
                                <button id="recall-button" onclick="recall()" class="btn recall"><b>RECALL</b></button>
                                <button id="done-button" onclick="removeRow()" class="btn done"><b>DONE</b></button>
                            </section>

                    </div>

                </div>
                <div class="leftnav">
                    <div class="top-lnav">
                        <img src="./images/logo.png" class="cec">
                        <p class="title"><br><b>Cebu Eastern College</b></p>
                    </div>
                    <!-- staff profile -->
                    <button class="button-profile"><img src="./images/profile.png" alt=""
                            class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt=""
                            class="caretdown"></button>
                    <div class="staffProfile" id="staffProfile">
                        <a href="#">Settings</a>
                        <a href="logout">Signout</a>
                    </div>
                    <div class="bottom-lnav">
                        <b><a href="staffdashboard">Dashboard</a></b>
                        <b><a href="userwindow">User Window</a></b>
                        <b><a href="counterwindow">Counter Window</a></b>
                        <b><a href="addstudent">Add Student</a></b>
                        <b><a href="entertainment">Advertisement</a></b>
                    </div>
                </div>

            </div>
            <script>
                function updateTime() {
                    const now = new Date();
                    document.getElementById('date').textContent = now.toLocaleDateString();
                    document.getElementById('time').textContent = now.toLocaleTimeString();
                }
                updateTime();
                setInterval(updateTime, 1000);

                let counterList = document.getElementById("counter-list");
                counterList.addEventListener("mousedown", event => {
                    $.ajax({
                        url: '/JsonAvailableWindow',
                        method: 'GET',
                        data: {},
                        dataType: 'json',
                        success: function (data) {
                            const selectCounterListBody = $('#counter-list');
                            selectCounterListBody.empty();
                            selectCounterListBody.append(`
                            <option value="0">CHOOSE COUNTER WINDOW</option>`);
                            data.forEach(item => {
                                selectCounterListBody.append(`
                                     <option value="`+ item.window_number + `">Counter-Window : ` + item.window_number + ` - ` + item.serviceType + `</option>`);
                            });
                        }

                    });

                });

                async function counterChangeListOnChange() {
                    await CounterList(counterList.value, "QUEUE", '#priority-number-table');
                    await CounterList(counterList.value, "SERVING", '#counter-access-table');
                }

                async function CounterList(window_nunber, queue_status, elementid) {
                    await $.ajax({
                        url: '/JsonStudentQueueEntriesAPI',
                        method: 'GET',
                        data: {
                            window_number: window_nunber,
                            queue_status: queue_status
                        },
                        dataType: 'json',
                        success: function (data) {
                            let prioriyNumberTable = $(elementid);
                            prioriyNumberTable.empty();
                            data.forEach(item => {
                                prioriyNumberTable.append(`
                                    <tr>
                                        <td>`+ item.queue_number + `</td>
                                        <td>`+ item.purpose + `</td>
                                        <td>`+ item.fullname + `</td>
                                        <td>`+ item.id_number + `</td>
                                        <td>`+ item.date + `</td>
                                        <td>`+ item.queue_status + `</td>
                                        <td>`+ item.window_number + `</td>
                                    </tr>
                                     `);
                            });
                        }

                    });
                }

                setInterval(counterChangeListOnChange, 4000);

                let priorityNumberTableBody = document.getElementById("priority-number-table");
                let counterAccessTableBody = document.getElementById("counter-access-table");
                const callButton = document.getElementById("call-button");
                const recallButton = document.getElementById("recall-button");
                const doneButton = document.getElementById("done-button");

                async function transferRow() {

                    callButton.disabled = true;
                    callButton.innerHTML = `<b>LOADING</b> <span id="button-loader"></span>`;

                    setTimeout(() => {
                        callButton.disabled = false;
                        callButton.innerHTML = `<b>CALL</b>`;
                    }, 1000);

                    if (counterAccessTableBody.rows.length > 0) {
                        await $.notify("Table 2 can only hold one row!", { color: "#fff", background: "#D44950", delay: 1000 })
                        return;
                    }

                    if (priorityNumberTableBody.rows.length > 0) {

                        let firstRow = priorityNumberTableBody.rows[0];
                        await counterAccessTableBody.appendChild(firstRow);
                        let queueNumber = firstRow.cells[0].innerText;
                        let window_number = firstRow.cells[6].innerText;
                        await sendMsg(queueNumber, window_number);
                        await updateQueueStatus(queueNumber, 'SERVING');
                    } else {
                        await $.notify("No more rows to transfer!", { color: "#fff", background: "#D44950", delay: 1000 });
                    }
                }

                function removeRow() {
                    doneButton.disabled = true;
                    doneButton.innerHTML = `<b>LOADING</b> <span id="button-loader"></span>`;

                    setTimeout(() => {
                        doneButton.disabled = false;
                        doneButton.innerHTML = `<b>DONE</b>`;
                    }, 1000);

                    if (counterAccessTableBody.rows.length > 0) {
                        let secondRow = counterAccessTableBody.rows[0];
                        let queueNumber = secondRow.cells[0].innerText;
                        updateQueueStatus(queueNumber, 'DONE');
                        counterAccessTableBody.deleteRow(0);
                    } else {
                        $.notify("No row to remove from Table 2!", { color: "#fff", background: "#D44950", delay: 1000 })
                    }
                }

                function recall() {

                    recallButton.disabled = true;
                    recallButton.innerHTML = `<b>LOADING</b> <span id="button-loader"></span>`;

                    setTimeout(() => {
                        recallButton.disabled = false;
                        recallButton.innerHTML = `<b>RECALL</b>`;
                    }, 1000);

                    if (counterAccessTableBody.rows.length > 0) {
                        let secondRow = counterAccessTableBody.rows[0];
                        let queueNumber = secondRow.cells[0].innerText;
                        let window_number = secondRow.cells[6].innerText;
                        sendMsg(queueNumber, window_number);
                    } else {
                        $.notify("No row to recall from Table 2!", { color: "#fff", background: "#D44950", delay: 1000 })
                    }
                }

                //update queue status
                function updateQueueStatus(queueNumber, queueStatus) {
                    $.ajax({
                        url: `/updateQueueStatus?queueNumber=` + queueNumber + `&queueStatus=` + queueStatus,
                        type: 'PUT',
                        success: function (response) {
                            $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 })
                        }, error: function (xhr, status, error) {
                            $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                        }
                    });
                }

                //websocket
                var wsUrl;
                if (window.location.protocol == 'http:') {
                    wsUrl = 'ws://';
                } else {
                    wsUrl = 'wss://';
                }
                var ws = new WebSocket(wsUrl + window.location.host + "/QueueWebSocketController");

                ws.onopen = function (event) {
                    console.log('WebSocket connection opened', event);
                };

                function sendMsg(queueNumber, window_number) {
                    if (queueNumber) {
                        ws.send(JSON.stringify({
                            message: "Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you",
                            queueNumber: queueNumber,
                            windowNumber: window_number,
                            tostop: "none"
                        }));
                        //ws.send("Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you");
                    }
                }




            </script>

            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>
        </body>

        </html>
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
                    <div class="dash"> <b></b>
                        
            <button class="button-profile"><img src="" alt="" class="profile"><b><c:out value="${sessionScope.sessionStaff.firstname}"></c:out></b><img src="./images/caretdown.png" alt="" class="caretdown"></button>
                <div class="staffProfile" id="staffProfile">
                    <a href="setting">Settings</a>
                    <a href="logout">Signout</a>
                </div>
                    </div>

                    <div class="counter-container">
                        <select id="counter-list" onchange="counterChangeListOnChange()" class="select">
                            <option value="" selected>SELECT COUNTER LIST</option>
                        </select>
                        <section class="real-time">
                            <span id="date"></span> | <span id="time"></span>
                        </section>
                        <h2 class="table-title">PRIORITY NUMBER</h2>
                        <div class="table-container">
                            
                            <table class="data-table">
                                <thead class="priority-number">
                                    <tr>
                                        <th class="thd">QUEUE NO.</th>
                                        <th class="priority-number">PURPOSE</th>
                                        <th class="priority-number">NAME</th>
                                        <th class="priority-number">ID NUMBER</th>
                                        <th class="priority-number">DATE</th>
                                        <th class="priority-number">STATUS</th>
                                        <th class="priority-number">WINDOW NO.</th>
                                    </tr>
                                </thead>
                                <tbody id="priority-number-table">
                                    <tr>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                    </tr>
                                    <tr>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                        <td><div class="tloader"></div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        </section>
                        <section class="tables">
                            <h2 class="table-title">COUNTER ACCESS</h2>
                            <div class="table-container">
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
                                        <tr>
                                            <td><div class="tloader"></div></td>
                                            <td><div class="tloader"></div></td>
                                            <td><div class="tloader"></div></td>
                                            <td><div class="tloader"></div></td>
                                            <td><div class="tloader"></div></td>
                                            <td><div class="tloader"></div></td>
                                            <td><div class="tloader"></div></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="namecall">
                                <input type="text" class="custom-call" placeholder="Enter name to queue">
                                <button class="add-name" onclick="CallName()">Call Name</button>
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
                    
                    <div class="bottom-lnav">
                        <b><a href="staffdashboard"><img src="./images/dashboard.png" alt="">Dashboard</a></b>
                        <b><a href="userwindow"><img src="./images/display.png" alt="">User Window</a></b>
                        <b><a href="counterwindow"><img src="./images/counter.png" alt="">Counter Window</a></b>
                        <b><a href="addstudent"><img src="./images/studentlist.png" alt="">Student List</a></b>
                        <b><a href="entertainment"><img src="./images/entertainment.png" alt="">Entertainment</a></b>
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
        });
                function updateTime() {
                    const now = new Date();
                    document.getElementById('date').textContent = now.toLocaleDateString();
                    document.getElementById('time').textContent = now.toLocaleTimeString();
                }
                updateTime();
                setInterval(updateTime, 1000);

                let counterList = document.getElementById("counter-list");
                document.addEventListener("DOMContentLoaded", event =>{
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

                    // document.getElementById("priority-number-table").innerHTML = `
                    //    <tr>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                     </tr>
                    // `;

                    // document.getElementById("counter-access-table").innerHTML = `
                    //    <tr>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                         <td><div class="tloader"></div></td>
                    //                     </tr>
                    // `;

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

                setInterval(counterChangeListOnChange, 3000); //change to websocket

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

                var ws2 = new WebSocket(wsUrl + window.location.host + "/queueupdate");

                ws2.addEventListener("message",async (message)=>{
                    await $.notify("loading new requests...", { color: "#fff", background: "#20D67B", delay: 1000 })
                    await CounterList(counterList.value, "QUEUE", '#priority-number-table');
                })

                //CALL CUSTOM NAME
                function CallName(){
                    var name = document.querySelector('.custom-call');
                if(name.value !== '' && counterList.value > 0){
                    ws.send(JSON.stringify({
                    message: "Attention. " + name.value + ". Please Proceed to window " + counterList.value + ". Thank you",
                    queueNumber: name.value,
                    windowNumber: counterList.value,
                    tostop: "none"
                }));
            //ws.send("Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you");
    }else{
        alert("Empty name or counter window not set.");
    }

    document.querySelector('.custom-call').value = ''; //clear name after call
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
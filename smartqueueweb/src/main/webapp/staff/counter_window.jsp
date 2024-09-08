<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Queuing System</title>
            <link rel="stylesheet" href="./css/counter_window.css">
        </head>

        <body>
            <div class="container">

                <section class="tables">
                    <!--Counter Access -->
                    <div class="table-container">
                        <h2>COUNTER ACCESS</h2>
                        <table id="counter-access-table" class="data-table">
                            <thead>
                                <tr>
                                    <th class="thd">QUEUE NO.</th>
                                    <th>NAME</th>
                                    <th>COUNTER NO.</th>
                                    <th>PURPOSE</th>
                                    <th>STATUS</th>
                                    <th class="tsd">ANNOUNCE (Recall)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Rows will be added dynamically -->
                            </tbody>
                        </table>
                    </div>

                    <section class="real-time">
                        <p><b>Time: <span id="time"></span></b></p>
                    </section>
                    <!-- Priority Number Table -->
                    <div class="table-container">
                        <h2>PRIORITY NUMBER</h2>
                        <table id="priority-number-table" class="data-table">
                            <thead>
                                <tr>
                                    <th class="thd">PRIORITY NO.</th>
                                    <th>DATE</th>
                                    <th>TIME</th>
                                    <th class="tsd">STATUS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-priority="P001" data-name="Cindy mae Labra" data-counter="1"
                                    data-purpose="Inquiry">
                                    <td>P001</td>
                                    <td>2024-09-07</td>
                                    <td>14:30</td>
                                    <td>Active</td>
                                </tr>
                                <tr data-priority="P002" data-name="Irish E. Cabanero" data-counter="3"
                                    data-purpose="Complaint">
                                    <td>P002</td>
                                    <td>2024-09-07</td>
                                    <td>14:32</td>
                                    <td>Completed</td>
                                </tr>
                                <tr data-priority="P003" data-name="Ariel Abelgas" data-counter="4"
                                    data-purpose="Enrollment">
                                    <td>P003</td>
                                    <td>2024-09-07</td>
                                    <td>14:40</td>
                                    <td>Active</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>

                <section class="actions">
                    <button id="call-button" class="btn call" disabled><b>CALL</b></button>
                    <button id="recall-button" class="btn recall" disabled><b>RECALL</b></button>
                    <button id="done-button" class="btn done" disabled><b>DONE</b></button>
                    <button id="cancel-button" class="btn cancel" disabled><b>CANCEL</b></button>
                </section>
            </div>

            <script>
                const now = new Date();
                const formattedDate = now.toLocaleDateString('en-GB'); // Format date as DD/MM/YYYY
                const formattedTime = now.toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit' }); // Format time as HH:mm

                function updateTime() {

                    const now = new Date();

                    let hours = now.getHours();
                    const minutes = String(now.getMinutes()).padStart(2, '0');
                    const seconds = String(now.getSeconds()).padStart(2, '0');

                    const ampm = hours >= 12 ? 'PM' : 'AM';
                    hours = hours % 12;
                    hours = hours ? hours : 12;

                    const strHours = String(hours).padStart(2, '0');

                    document.getElementById('time').textContent = `${strHours}:${minutes}:${seconds} ${ampm}`;
                }
                setInterval(updateTime, 1000);
                updateTime();


                let selectedRow = null;

                document.getElementById('priority-number-table').addEventListener('click', function (event) {
                    if (event.target.tagName === 'TD') {
                        const row = event.target.parentElement;
                        if (selectedRow) {
                            selectedRow.classList.remove('selected');
                        }
                        selectedRow = row;
                        selectedRow.classList.add('selected');
                        document.getElementById('call-button').disabled = false;
                        document.getElementById('cancel-button').disabled = false;
                        document.getElementById('recall-button').disabled = true;
                        document.getElementById('done-button').disabled = true;
                    }
                });

                document.getElementById('counter-access-table').addEventListener('click', function (event) {
                    if (event.target.tagName === 'TD') {
                        const row = event.target.parentElement;
                        if (selectedRow) {
                            selectedRow.classList.remove('selected');
                        }
                        selectedRow = row;
                        selectedRow.classList.add('selected');
                        document.getElementById('recall-button').disabled = false;
                        document.getElementById('done-button').disabled = false;
                        document.getElementById('call-button').disabled = true;
                        document.getElementById('cancel-button').disabled = false;
                    }
                });

                document.getElementById('call-button').addEventListener('click', function () {
                    if (selectedRow) {
                        const priorityNo = selectedRow.dataset.priority;
                        const name = selectedRow.dataset.name;
                        const counter = selectedRow.dataset.counter;
                        const purpose = selectedRow.dataset.purpose;

                        const counterTable = document.getElementById('counter-access-table').getElementsByTagName('tbody')[0];
                        const newRow = counterTable.insertRow();
                        newRow.innerHTML = `
                <td>${priorityNo}</td>
                <td>${name}</td>
                <td>${counter}</td>
                <td>${purpose}</td>
                <td>Waiting</td>
                <td><button class="btn recall">Recall</button></td>
            `;
                        selectedRow.remove();
                        document.getElementById('call-button').disabled = true;
                        document.getElementById('cancel-button').disabled = true;

                        const utterance = new SpeechSynthesisUtterance(`Calling ${name} at counter ${counter}`);
                        speechSynthesis.speak(utterance);
                    }
                });

                document.getElementById('recall-button').addEventListener('click', function () {
                    if (selectedRow) {
                        const queueNo = selectedRow.cells[0].innerText;
                        const name = selectedRow.cells[1].innerText;
                        const counter = selectedRow.cells[2].innerText;
                        const purpose = selectedRow.cells[3].innerText;

                        const priorityTable = document.getElementById('priority-number-table').getElementsByTagName('tbody')[0];
                        const newRow = priorityTable.insertRow();
                        newRow.dataset.priority = queueNo;
                        newRow.dataset.name = name;
                        newRow.dataset.counter = counter;
                        newRow.dataset.purpose = purpose;
                        newRow.innerHTML = `
                        <td>${queueNo}</td>
                        <td>${formattedDate}</td>
                        <td>${formattedTime}</td>
                        <td>Active</td>
                        `;
                        selectedRow.remove();
                        document.getElementById('recall-button').disabled = true;
                        document.getElementById('done-button').disabled = true;
                        document.getElementById('cancel-button').disabled = true;
                    }
                });

                document.getElementById('done-button').addEventListener('click', function () {
                    if (selectedRow) {
                        selectedRow.cells[4].innerText = 'Done';
                        document.getElementById('done-button').disabled = true;
                        document.getElementById('cancel-button').disabled = true;
                    }
                });

                document.getElementById('cancel-button').addEventListener('click', function () {
                    if (selectedRow) {
                        selectedRow.remove();
                        document.getElementById('call-button').disabled = true;
                        document.getElementById('recall-button').disabled = true;
                        document.getElementById('done-button').disabled = true;
                        document.getElementById('cancel-button').disabled = true;
                    }
                });
            </script>
        </body>

        </html>
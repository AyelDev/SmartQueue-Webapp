<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       *{
    margin: 0;
    padding: 0;
    font-family: Arial;
}
html, body {
    width: 100%;
    height: 100%;
    overflow: hidden; 
}
body{
    background-color: white; 
}
.container{
    width: 100%;
    height: 100%;
    background-color: pink;
    position: absolute;
    top: 0;
    left: 0;
}
.leftnav{
    width: 15%;
    height: 100%;
    background-color: #5CB3FF;
    color: white;
}
.top-lnav{
    width: 100%;
    height: 20%;
    background-color: #5CB3FF;
    text-align: center;
    display: block;
    position: relative;
    line-height: 6.25rem;
    font-size: 0.875rem;
   
}
.cec{
    width: 20%;
    height: 25%;
    margin: 1.875rem auto;
    margin-left: 0.5rem;
    float: left ;
}
.bottom-lnav{
    width: 100%;
    height: 80%;
    background-color: transparent;
    text-align: center;
    color: white;
}
.dropdown {
    position: relative;
    display: inline-block;
    margin-top: 4.375rem;
    width: 100%; 
}
.dropdown h3 {
    cursor: pointer;
    margin: 1.25rem 0; 
    color: white;
    transition: transform 0.3s ease;
}
.dropdown h3:hover{
    background-color: white;
    height: 1.875rem;
    width: 100%;
    border-radius: 3.125rem;
    transform: translateX(1.25rem);
    color: black;
}
.staffProfile {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.staffProfile a {
    text-decoration: none;
    color: black;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0.5rem; 
    box-sizing: border-box;
}

.staffProfile a:hover {
    background-color: #F6F4EB;
    width: 65%; 
    border-radius: 0.625rem; 
    border: 0.0625rem solid black;
    margin-left: 1.875rem;
    margin-top: 0.125rem;
}
.button-profile {
    align-items: center;
    justify-content: center;
    display: flex;
    width: 10vw;
    text-align: center;
    margin-top: 1.875rem;
    margin-left: 1.875rem;
    border-radius: 0.625rem;
    padding: 0.9375rem 0.625rem 0.9375rem 0.625rem; /* tlbr */
    overflow: hidden;
}
.profile{
    width: 10%;
    object-fit: scale-down;
    margin-right: 1.25rem;
}
.caretdown{
    mix-blend-mode: multiply;
    width: 0.625rem;
    margin-left: 1.25rem;
}
.dropdown-content {
    display: none; 
    position: absolute;
    background-color: white;
    min-width: 11.25rem; 
    box-shadow: 0px 0.5rem 1rem 0px rgba(0,0,0,0.2);
    z-index: 1;
    left: 95%;
    top: 0;
    margin-left: 0.625rem;
}

.dropdown-content a {
    color: black;
    padding: 0.75rem 1rem;
    text-decoration: none;
    display: block;
    text-align: center;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block; 
}

.sign{
    text-decoration: none;
    color: black;
    font-size: 1.25rem;
    display: inline-block;
    margin-top: 5.625rem;
}
.sign:hover{
    background-color: #95B9C7;
    border-radius: 3.125rem;
    width: 90%;
}
.rightnav{
    width: 85%;
    height: 100%;
    background-color: #f4f4f4;
    float: right;
}
.scontainer {
width: 70%;
margin: 0 auto;
padding: 1.25rem;
background: #fff;
border-radius: 0.625rem;
box-shadow: rgba(0, 0, 0, 0.15) 0px 15px 25px, rgba(0, 0, 0, 0.05) 0px 5px 10px;
margin-top: 1.875rem;
}

.real-time {
text-align: center;
font-size: 1.25rem;
margin: 1.25rem 0;
width: 30%;
padding: none ;
background-color: #f0f6f6;
border: 0.125rem solid black;
border-radius: 1.25rem;
display: block;
margin-left: 35%;
}
.tables {
margin-bottom: 1.25rem;
margin-top: 1.875rem;
}
.table-container {
margin-bottom: 1.25rem;
}
.table-container h2 {
font-size: 1.25rem;
margin-bottom: 0.625rem;
text-align: center;
line-height: 0.625rem;
}
.data-table {
width: 100%;
border-collapse: collapse;
margin-top: 1.875rem;
}
.data-table th, .data-table td {
padding: 0.625rem;
text-align: center;
border-bottom: 1px solid #ddd;
}
.thd{
border-left: 0.125rem solid blue;

}
.tsd{
border-right: 0.125rem solid blue;
}
.data-table tr:hover {
background-color: #eff7f6;
border-left: 0.125rem solid blue;
border-right: 0.125rem solid blue;
}
.data-table .selected {
background-color: #d1e7dd;
}
.data-table th {
background-color: #3090C7;
color: white;
}
.actions {
text-align: center;
margin-top: 1.25rem;
}
.actions .btn {
border: none;
padding: 0.625rem 1.25rem;
color: #fff;
border-radius: 0.3125rem;
cursor: pointer;
transition: background-color 0.3s;
margin: 0 0.3125rem;
color: black;
}
.actions .btn.call {
background-color: #7dcfb6;
border: 0.125rem solid #7dcfb6;
border-radius: 0.625rem 0.125rem 0.625rem 0.125rem;
}
.actions .btn.call:hover{
color: white;
border-radius: 0.125rem 0.625rem 0.125rem 0.625rem;
}
.actions .btn.recall {
background-color: #00b2ca;
border: 0.125rem solid #00b2ca;
border-radius: 0.625rem 0.125rem 0.625rem 0.125rem;
}
.actions .btn.recall:hover {
color: white;
border-radius: 0.125rem 0.625rem 0.125rem 0.625rem;
}
.actions .btn.done {
background-color: #fbd1a2;
border: 0.125rem solid #fbd1a2;
border-radius: 0.625rem 0.125rem 0.625rem 0.125rem;
}
.actions .btn.done:hover {
color: white;
border-radius: 0.125rem 0.625rem 0.125rem 0.625rem;
}
.actions .btn.cancel {
background-color: #f79256;
border: 0.125rem solid #f79256;
border-radius: 0.625rem 0.125rem 0.625rem 0.125rem;
}
.actions .btn.cancel:hover {
color: white;
border-radius: 0.125rem 0.625rem 0.125rem 0.625rem;
}
.actions .btn.call:hover {
background-color: #218838;
}
.actions .btn.recall:hover {
background-color: #0056b3;
}
.actions .btn.done:hover {
background-color: #e0a800;
}
.actions .btn.cancel:hover {
background-color: #c82333;
}
@media (max-width: 1200px) {
    .leftnav {
        width: 20%;
    }
    .rightnav {
        width: 80%;
    }
}
@media (max-width: 992px) {
    .leftnav {
        width: 25%;
    }
    .rightnav {
        width: 75%;
    }
    .scontainer {
        width: 90%;
    }
}
@media (max-width: 768px) {
    .leftnav {
        width: 30%;
    }
    .rightnav {
        width: 70%;
    }
    .scontainer {
        width: 95%; 
    }
}
@media (max-width: 480px) {
    .leftnav {
        width: 20%;
    }
}

    </style>
</head>
<body>
    <div class="container">

        <div class="rightnav">
            <div class="scontainer">
            <section class="tables">
              
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
                           
                        </tbody>
                    </table>
                </div>

                <section class="real-time">
                    <p><b>Time: <span id="time"></span></b></p>
                </section>
         
                <div class="table-container">
                    <h2>PRIORITY NUMBER</h2>
                    <table id="priority-number-table" class="data-table">
                        <thead>
                            <tr>
                                <th class="thd">PRIORITY NO.</th>
                                <th>DATE</th>
                                <th>TIME</th>
                                <th>STATUS</th>
                                <th class="tsd">PURPOSE</th>
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
        
        </div>
        <div class="leftnav">
            <div class="top-lnav">
                <img src="./images/logo.png" class="cec">
                <p class="title"><br>Cebu Eastern College</p>
            </div>
            <!-- staff profile -->
            <button class="button-profile"><img src="./images/profile.png" alt=""
                    class="profile"><b>STAFF</b><img src="./images/caretdown.png" alt=""
                    class="caretdown"></button>
            <div class="staffProfile" id="staffProfile">
                <a href="#">Settings</a>
                <a href="login">Signout</a>
            </div>
            <div class="bottom-lnav">
                <div class="dropdown">
                    <h3>QUEUEING</h3>
                    <div class="dropdown-content">
                        <a href="userwindow">User Window</a>
                        <a href="counterwindow">Counter Window</a>
                    </div>
                </div>
                <div class="dropdown">
                    <h3>ENTERTAINMENT</h3>
                    <div class="dropdown-content">
                        <a href="staff/entertainment.jsp">Advertisement</a>
                        <a href="staff/entertainment.jsp" class="video-link">Add Video</a>
                    </div>
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
        });
    
        const now = new Date();
        const formattedDate = now.toLocaleDateString('en-GB'); 
        const formattedTime = now.toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit' }); 
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
    <div class="load-wrapper">
        <div class="main-loader">
            <div class="box-loader">
            </div>
        </div>
    </div>
</body>
</html>

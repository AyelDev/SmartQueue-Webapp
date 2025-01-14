<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="./scripts/fadetransition.js"></script>
            <script type="text/javascript" src="./scripts/notify.js"></script>
            <script type="text/javascript" src="./scripts/prettify.js"></script>
            <link rel="stylesheet" href="./css/loader.css">
            <link rel="stylesheet" href="./css/prettify.css">
            <link rel="stylesheet" href="./css/notify.css">
            <title>User Inquiry</title>
        </head>

        <body>
            <style>
                * {
                    margin: 0%;
                    padding: 0%;
                    font-family: arial black;
                    overflow: hidden;
                }

                .container {
                    margin: 0%;
                    padding: 0%;
                    width: 100vw;
                    height: 100vh;
                    background-color: #fff;
                    overflow: hidden;
                }

                .header {
                    width: 100%;
                    height: 18vh;
                    background-color: #00296b;
                }

                .head {
                    background-color: #fff;
                    width: 100%;
                    height: 11vh;
                    align-items: center;
                    display: flex;
                    justify-content: center;
                }

                .logo {
                    margin-left: 2%;
                    width: 10vw;
                    height: 18vh;
                    display: flex;
                    position: absolute;
                    z-index: 1;
                    top: .1%;
                }

                .name {
                    position: absolute;
                    top: 3%;
                    z-index: 2;
                    color: red;
                    letter-spacing: 80px;
                    text-align: center;
                    font-size: 26px;
                }

                .title {
                    text-align: center;
                    font-size: 47px;
                    top: 6%;
                    position: absolute;
                }

                .address {
                    margin-left: 21%;
                    color: #fff;
                    font-family: tahoma;
                    top: 15%;
                    position: absolute;
                    font-size: 13px;
                }

                .info {
                    margin-left: 55%;
                    font-family: tahoma;
                    top: 14.5%;
                    position: absolute;
                    color: #fff;
                    font-size: 10px;
                }

                /* Main Section */
                .main {
                    width: 100%;
                    height: 82vh;
                    display: flex;
                    justify-content: space-evenly;
                    align-items: center;
                    background-color: #77b6ea;
                }

                .card {
                    width: 22vw;
                    height: 45vh;
                    background-color: #f2f2f2;
                    box-shadow: -10px 25px 50px rgba(0, 0, 0, 0.3);
                    border-radius: 15px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    text-align: center;
                    transition: all 0.3s ease-in-out;
                    cursor: pointer;
                }

                .card:hover {
                    transform: scale(1.05);
                    background: #1e91d0;
                    background: linear-gradient(135deg, #1e91d0 15%, #00509d 100%);
                    color: white;
                }

                .card p {
                    font-size: .7rem;
                }

                .card h2 {
                    font-size: 1.5rem;
                    margin-top: 10px;
                }

                /* Modal Container */
                .modal {
                    display: none;
                    position: fixed;
                    z-index: 1000;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    justify-content: center;
                    align-items: center;

                }

                .modal-content {
                    background-color: #1e91d0;
                    background: rgb(72.5%, 85.5%, 95.7%);
                    padding: 20px;
                    border-radius: 10px;
                    width: 80%;
                    max-width: 600px;
                    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
                    margin-left: 30%;
                    margin-top: 3%;
                }


                .close {
                    color: #aaa;
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }

                .form {
                    margin: 30px;
                    flex-direction: column;
                    display: flex;
                    color: black;
                }

                label {
                    color: black;
                    position: relative;
                    margin-top: 20px;
                }

                .printbutton {
                    width: 6rem;
                    height: 2rem;
                    margin-top: 5%;
                    margin-left: 70%;
                }

                .student-id,
                .student-name,
                #yearLevel,
                .purpose,
                .program,
                .first-name,
                .middle-name,
                .last-name {
                    height: 5vh;
                    width: 60%;
                    text-indent: 10px;
                    text-transform: uppercase;
                }

                .generalfirst-name,
                .generalmiddle-name,
                .generallast-name {
                    height: 5vh;
                    width: 35%;
                    text-indent: 10px;
                    text-transform: uppercase;
                    margin-top: 5%;
                }

                .student-name {
                    display: flex;
                    justify-content: space-between;
                }

                .firstname-label,
                .middlename-label {
                    margin-top: .4%;
                    position: absolute;
                }

                .lastname-label {
                    margin-top: 4.7%;
                    margin-left: -25.5%;
                    position: absolute;
                }


                @media print {

                    /* Set the size for 58mm wide thermal printer */
                    body,
                    html {
                        width: 58mm;
                        margin: 0;
                        padding: 0;
                    }
                    .close{
                        display: none !important;
                    }
                    .modal-content{
                        box-shadow: none;
                        margin-left: 10%;
                        margin-top: 10%;
                        background-color: white;
                    }
                }

                #printArea {
                    width: 300px;
                    /* Small width for the receipt */
                    padding: 10px;
                    border: 1px solid #000;
                    text-align: center;
                    margin: 0 auto;
                    background-color: #fff;
                    
                }

                #printArea h3,
                #printArea h4 {
                    margin: 5px 0;
                }

                #printArea p {
                    margin: 5px 0;
                    font-size: 14px;
                }

                #printArea #queueNumberPrint {
                    font-size: 24px;
                    /* Emphasize the queue number */
                    color: #d9534f;
                }



                .slidetext {
                    display: inline-block;
                    width: 120%;
                    white-space: nowrap;
                    animation: slide 20s linear infinite;
                    margin: 0 24px;
                    position: absolute;
                    font-size: 24px;
                    color: red;
                }

                @keyframes slide {
                    from {
                        transform: translate3d(100%, 0, 0);
                    }

                    to {
                        transform: translate3d(-100%, 0, 0);
                    }
                }

                /* Media Queries for responsiveness */
                @media (max-width: 768px) {
                    .logo {
                        width: 20vw;
                        height: auto;
                    }

                    .name,
                    .first-name,
                    .middle-name,
                    .last-name {
                        letter-spacing: 40px;
                        font-size: 20px;
                    }

                    .title {
                        font-size: 30px;
                    }

                    .address,
                    .info {
                        font-size: 10px;
                        margin-left: 10%;
                    }

                    .main .box {
                        width: 35vw;
                        height: 35vh;
                    }

                    .main .box p {
                        font-size: 1rem;
                    }

                    .main .box h2 {
                        font-size: 1.2rem;
                    }
                }

                @media (max-width: 480px) {
                    .logo {
                        width: 25vw;
                    }

                    .name,
                    .first-name,
                    .middle-name,
                    .last-name {
                        letter-spacing: 20px;
                        font-size: 15px;
                    }

                    .title {
                        font-size: 24px;
                    }

                    .address,
                    .info {
                        font-size: 8px;
                        margin-left: 5%;
                    }

                    .main {
                        flex-direction: column;
                    }

                    .main .box {
                        width: 70vw;
                        height: 30vh;
                        margin-left: 0;
                    }

                    .main .box p {
                        font-size: 0.9rem;
                    }

                    .main .box h2 {
                        font-size: 1rem;
                    }
                }
            </style>
            <div class="container">
                <div class="header">
                    <p>.</p>
                    <img src="./images/logo.png" class="logo">
                    <div class="head">
                        <h2 class="name">宿务东方学院</h2>
                        <h1 class="title">CEBU EASTERN COLLEGE, INC.</h1>
                    </div>
                    <p class="address">LEON KILAT ST. CEBU CITY</p>
                    <p class="info">TEL.NOS. (032) 256-2523 FAX NO. (032) 256-2526 <br> EMAIL:
                        cebueasterncollege1915@yahoo.com
                    </p>
                </div>
                <!-- Scrolling Attention Text -->
                <div class="slidetext">
                    <span>ATTENTION! ONCE YOUR NUMBER IS CALLED AND YOU ARE NOT AROUND, YOU NEED TO GET ANOTHER PRIORITY
                        NUMBER.
                        &ensp;</span>
                </div>

                <!-- Main Inquiry Cards -->
                <div class="main">
                    <!-- Card for General -->
                    <div class="card" id="general-card">
                        <div class="box">
                            <p>-Enrollment </p>
                            <h2>General</h2>
                        </div>
                    </div>

                    <!-- Card for Records -->
                    <div class="card" id="records-card">
                        <div class="box">
                            <p>-Certifications <br>-Study Load <br>-TOR</p>
                            <h2>Records</h2>
                        </div>
                    </div>

                    <!-- Card for Archiving -->
                    <div class="card" id="archiving-card">
                        <div class="box">
                            <p>-Submit documents</p>
                            <h2>Archiving</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- General Modal -->
            <div id="general-modal" class="modal">
                <div class="modal-content" id="modal-content">
                    <span class="close">&times;</span>
                    <h2>General Inquiry Form</h2>
                    <div class="form">
                        <div class="studename">
                            <label for="studentName" class="firstname-label">First Name</label>
                            <input type="text" class="generalfirst-name" id="general-student-firstname">
                            <label for="studentName" class="middlename-label">Middle Name</label>
                            <input type="text" class="generalmiddle-name" id="general-student-middlename">
                            <label for="studentName" class="lastname-label">Last Name</label>
                            <input type="text" class="generallast-name" id="general-student-lastname">
                        </div>


                        <label for="studentIdNo" class="student-id-no-text">Student ID No.</label>
                        <input type="text" class="student-id" id="general-student-id">
                        <label for="yearLevel">Year Level</label>
                        <!-- <input type="text" class="yearLevel" id="yearLevel"> -->
                        <select name="program" id="yearLevel" class="yearLevel">
                            <option value="1st Year">1st Year (Incoming)</option>
                            <option value="1st Year">1st Year</option>
                            <option value="1st Year">2nd Year</option>
                            <option value="1st Year">3rd Year</option>
                            <option value="1st Year">4th Year</option>
                        </select>
                        <label for="options">Program</label>
                        <select name="program" id="general-program" class="program">
                            <option value="">--</option>
                        </select>
                        <label for="options">Option</label>
                        <select name="purpose" id="general-purpose" class="purpose">
                            <option value="">--</option>
                        </select>
                    </div>
                    <input type="button" class="printbutton" value="Print" onclick="printQueue('General')">
                </div>
            </div>
            </div>

            <!-- Records Modal -->
            <div id="records-modal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>Records Inquiry Form</h2>
                    <form id="form" class="form">
                        <label for="studentName">Name:</label>
                        <input type="text" class="student-name" id="records-student-name" name="name" disabled>
                        <label for="studentIdNo">Student ID No.</label>
                        <input type="text" class="student-id" id="records-student-id" required>
                        <label for="options">Option</label>
                        <select name="purpose" id="records-purpose" class="purpose">
                            <option value="">--</option>
                        </select>

                        <input type="hidden" id="serviceType">

                        <input type="button" id="recordsbutton" class="printbutton" value="Print"
                            onclick="printQueue('Records')">
                    </form>
                </div>
            </div>

            <!-- Archiving Modal -->
            <div id="archiving-modal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('archivingModal')">&times;</span>
                    <h2>Archiving Form</h2>
                    <form id="form" class="form">
                        <label for="name">First Name</label>
                        <input type="text" class="first-name" id="archiving-student-firstname"
                            onclick="SetEmptyIdField()" required>
                        <label for="name">Middle Name</label>
                        <input type="text" class="middle-name" id="archiving-student-middlename"
                            onclick="SetEmptyIdField()">
                        <label for="name">Last Name</label>
                        <input type="text" class="last-name" id="archiving-student-lastname" onclick="SetEmptyIdField()"
                            required>

                        <label for="studentIdNo">Student ID No.</label>
                        <input type="text" class="student-id" id="archiving-student-id" onclick="SetEmptyNameFields()"
                            required>
                        <label for="options">Option</label>
                        <select name="purpose" id="archiving-purpose" class="purpose">
                            <option value="">--</option>
                        </select>

                        <input type="hidden" id="serviceType">

                        <input type="button" class="printbutton" id="archivingButton" value="Print"
                            onclick="printQueue('Archiving')">
                    </form>
                </div>
            </div>

            <!-- Hidden print paper container-->
            <div id="receiptModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    <div id="receiptContainer">
                        <div id="printArea">
                            <h1 style="color: #00509d;">CEBU EASTERN COLLEGE</h1>
                            <h2 style="color: #00296b;" id="serviceNamePrint">Service:</h2>
                            <h3>Your Queue Number is:</h3>
                            <h1 id="queueNumberPrint" style="font-size: 60px; color: #d9534f;">###</h1>
                            <p id="queueDetails">Name:</p>
                            <p id="queueDateTime"></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- loader please do not remove -->
            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>

            <script>

                        /* 
                        Summary: check studentinput if it is in correct pattern
                        */
                        let generalStudentInput = document.getElementById('general-student-id');
                        const numberRegex = new RegExp("^000$");
                        let generalStudentIdNoInput = document.querySelector(".student-id-no-text");
                        generalStudentInput.addEventListener("input", checkInput);
                        function checkInput(){
                            if(generalStudentInput.value.match(numberRegex) == null){
                                generalStudentIdNoInput.style.color = "red";
                                generalStudentIdNoInput.innerHTML = "Type '000' for new student";
                            }else{
                                generalStudentIdNoInput.style.color = "black";
                                generalStudentIdNoInput.innerHTML = "Student ID No.";
                            }
                        }
                         
                       
                    

                // Get all the modals
                var generalModal = document.getElementById("general-modal");
                var recordsModal = document.getElementById("records-modal");
                var archivingModal = document.getElementById("archiving-modal");

                // Get the buttons (cards)
                var generalBtn = document.getElementById("general-card");
                var recordsBtn = document.getElementById("records-card");
                var archivingBtn = document.getElementById("archiving-card");

                // Get the close elements for each modal
                var closeButtons = document.getElementsByClassName("close");

                // Function to close modal
                function closeModal(modal) {
                    modal.style.display = "none";
                }

                // Open General modal
                generalBtn.onclick = function () {
                    generalModal.style.display = "block";
                }

                // Open Records modal
                recordsBtn.onclick = function () {
                    recordsModal.style.display = "block";
                }

                // Open Archiving modal
                archivingBtn.onclick = function () {
                    archivingModal.style.display = "block";
                }

                // Function to close modal
                function closeModal(modalId) {
                    var modal = document.getElementById(modalId);
                    modal.style.display = "none";
                }

                // Close the modal when the close (X) is clicked
                var closeButtons = document.getElementsByClassName("close");
                for (var i = 0; i < closeButtons.length; i++) {
                    closeButtons[i].onclick = function () {
                        var modal = this.closest('.modal'); // Find the closest modal container
                        modal.style.display = "none";
                    };
                }

                // Close modal when clicking outside of it
                window.onclick = function (event) {
                    var modals = document.getElementsByClassName('modal');
                    for (var i = 0; i < modals.length; i++) {
                        if (event.target == modals[i]) {
                            modals[i].style.display = "none";
                        }
                    }
                }



                //this is for setting queue limit
                let currentQueueCount = 0;

                // Function to check if the queue is still open based on the limit
                function checkQueueLimit() {
                    const limit = localStorage.getItem('dailyQueueLimit') || 200;  // Default to 200 if not set
                    if (currentQueueCount >= limit) {
                        $.notify("Sorry, the queue for today is full. Please come back tomorrow.", { color: "#fff", background: "#D44950", delay: 1000 })
                        return false;
                    }
                    return true;
                }

                // Function to print the queue and check if limit is reached
                async function printQueue(serviceType) {

                    //need to polish
                    var queueNumber = '';
                    await $.ajax({
                        url: 'JsonQueueNumberAvailableAPI?availableNumber=1',
                        type: "GET",
                        success: function (response) {
                            queueNumber = response.id;
                            sendMsg("update queue");
                        },
                        error: function (xhr, status, error) {
                            $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                        }
                    });

                    let studentName = '';
                    let studentId = '';
                    let purpose = '';
                    let charQueue = '';
                    let studentFirstname = '';
                    let studentMiddlename = '';
                    let studentLastname = '';
                    let yearLevel = ''
                    let program = '';

                    if (serviceType === 'General') {
                        studentFirstname = document.getElementById('general-student-firstname');
                        studentMiddlename = document.getElementById('general-student-middlename');
                        studentLastname = document.getElementById('general-student-lastname');
                        yearLevel = document.getElementById('yearLevel');
                        studentId = document.getElementById('general-student-id');
                        purpose = document.getElementById('general-purpose');
                        program = document.getElementById('general-program');

                        charQueue = 'G';
                    } else if (serviceType === 'Records') {
                        studentName = document.getElementById('records-student-name');
                        studentId = document.getElementById('records-student-id');
                        purpose = document.getElementById('records-purpose');
                        charQueue = 'R';
                    } else if (serviceType === 'Archiving') {
                        studentFirstname = document.getElementById('archiving-student-firstname');
                        studentMiddlename = document.getElementById('archiving-student-middlename');
                        studentLastname = document.getElementById('archiving-student-lastname');

                        studentId = document.getElementById('archiving-student-id');
                        purpose = document.getElementById('archiving-purpose');
                        charQueue = 'A';
                    }


                    // Generate random queue number and current date


                    var currentDateTime = new Date().toLocaleString();

                    studentName = studentFirstname.value + " " + studentMiddlename.value + " " + studentLastname.value;

                    if (studentName.trim() === "undefined undefined undefined") {
                        studentName = '';
                        studentName = document.getElementById('records-student-name').value;
                    }

                    // Create the receipt content
                    var receiptContent = `
                    <center><h3>CEBU EASTERN COLLEGE</h3></center>
                    <center><h4>QUEUEING NO.</h4></center>
                    <hr>
                    <h1>`+ (charQueue + queueNumber) + `</h1>
                    <hr>
                    <p><strong>Name:</strong> `+ studentName + `</p>
                    <p><strong>Student ID:</strong> `+ studentId.value + `</p>
                    <p><strong>Service Type:</strong> ` + serviceType + ` Service</p>
                    <p><strong>Purpose:</strong> `+ purpose.value + `</p>
                    <p><strong>Date & Time:</strong> `+ currentDateTime + `</p>
                    `;
                    let servetype = serviceType;

                    await $.ajax({
                        url: 'inquiry',
                        type: 'POST',
                        data: {
                            queueNum: (charQueue + queueNumber),
                            fullname: studentName,
                            studentid: studentId.value,
                            purpose: purpose.value,
                            servicetype: servetype,
                            program: program.value
                        },
                        success: function (response) {
                            $.notify(response, { color: "#fff", background: "#20D67B", delay: 500 })

                            // Inject the receipt content into the modal
                            document.getElementById('printArea').innerHTML = receiptContent;

                            // Show the modal
                            var modal = document.getElementById('receiptModal');
                            modal.style.display = "block";


                            // Automatically print the receipt content
                            setTimeout(function await() {
                                window.print();
                            }, 500); // Optional delay before printing

                            if (serviceType === 'General') {
                                studentFirstname.value = "";
                                studentMiddlename.value = "";
                                studentLastname.value = "";
                                yearLevel.value = "";
                                studentId.value = "";
                                purpose.value = "";
                                program.value = "";
                            } else if (serviceType === 'Records') {
                                studentName.value = "";
                                studentId.value = "";
                                purpose.value = "";
                            } else if (serviceType === 'Archiving') {
                                studentFirstname.value = "";
                                studentMiddlename.value = "";
                                studentLastname.value = "";
                                studentId.value = "";
                                purpose.value = "";
                            }

                        },
                        error: function (xhr, status, error) {
                            $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })

                        }
                    });



                }

                // Close the modal when the user clicks the "close" button
                function closeModal() {
                    var modal = document.getElementById('receiptModal');
                    modal.style.display = "none";
                }

                // ---------------------records 
                const recordsButton = document.getElementById("recordsbutton");
                recordsButton.addEventListener("mouseover", event => {
                    //console.log("records-student-id");
                    studentId = document.getElementById('records-student-id');
                    let studentName = document.getElementById('records-student-name');
                    $.ajax({
                        url: 'JsonStudentSearchAPI',
                        type: 'GET',
                        data: {
                            studentid: studentId.value,
                            firstname: "none",
                            middlename: "none",
                            lastname: "none"
                        },
                        success: function (response) {
                            if (response == null) {
                                studentName.value = "";
                            }
                            studentName.value = response.firstname + " " + response.middlename + " " + response.lastname;
                            console.log(response)
                            //alert('Success: ' + response.firstname + " " + response.middlename + " " + response.lastname + " " + response.course);
                        },
                        error: function (xhr, status, error) {
                            $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                            studentName.value = "";
                            //alert(error + ' : ' + xhr.responseText);
                        }
                    });
                });

                // ----------------- archiving
                archiveStudentId = document.getElementById('archiving-student-id');
                let archivingStudentFirstName = document.getElementById('archiving-student-firstname');
                let archivingStudentMiddleName = document.getElementById('archiving-student-middlename');
                let archivingStudentLastName = document.getElementById('archiving-student-lastname');

                const archivingButton = document.getElementById("archivingButton");

                archivingButton.addEventListener("mouseover", event => {
                    if (archiveStudentId.value != "") {
                        firstCall();
                    } else if (archivingStudentFirstName.value != "" && archivingStudentLastName.value != "") {
                        secondCall();
                    }

                    function firstCall() {
                        $.ajax({
                            url: 'JsonStudentSearchAPI',
                            type: 'GET',
                            data: {
                                studentid: archiveStudentId.value,
                                firstname: "none",
                                middlename: "none",
                                lastname: "none"
                            },
                            success: function (response) {
                                if (response == null) {
                                    SetEmptyNameFields();
                                }
                                archivingStudentFirstName.value = response.firstname;
                                archivingStudentMiddleName.value = response.middlename;
                                archivingStudentLastName.value = response.lastname;
                                archiveStudentId.value = response.idnumber;
                                // studentName.value = response.firstname + " " +  response.middlename + " " +  response.lastname;
                                // console.log(response)
                                //alert('Success: ' + response.idnumber + " " + response.firstname + " " + response.middlename + " " + response.lastname + " " + response.course);
                            },
                            error: function (xhr, status, error) {
                                //archivingStudentName.value = "";
                                $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                                SetEmptyNameFields();
                            }
                        });
                    }

                    function secondCall() {
                        $.ajax({
                            url: 'JsonStudentSearchAPI',
                            type: 'GET',
                            data: {
                                studentid: 999999999,
                                firstname: archivingStudentFirstName.value,
                                middlename: archivingStudentMiddleName.value,
                                lastname: archivingStudentLastName.value
                            },
                            success: function (response) {
                                if (response == null) {
                                    SetEmptyNameFields();
                                }
                                archiveStudentId.value = response.idnumber;
                                archivingStudentFirstName.value = response.firstname;
                                archivingStudentMiddleName.value = response.middlename;
                                archivingStudentLastName.value = response.lastname;
                                // studentName.value = response.firstname + " " +  response.middlename + " " +  response.lastname;
                                // console.log(response)
                                //alert('Success: ' + response.idnumber + " " + response.firstname + " " + response.middlename + " " + response.lastname + " " + response.course);
                            },
                            error: function (xhr, status, error) {
                                //archivingStudentName.value = "";
                                $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                                SetEmptyNameFields();
                            }
                        });
                    }

                });

                function SetEmptyNameFields() {
                    // archivingStudentFirstName.value = "";
                    // archivingStudentMiddleName.value = "";
                    // archivingStudentLastName.value = "";
                }


                //Selection
                //Selection
                function InquirySelection() {
                    generalitemId = 1;
                    recordsitemId = 1;
                    archivingItemId = 1;
                    $.ajax({
                        url: '/JsonServiceListAPI',
                        method: 'GET',
                        data: {},
                        dataType: 'json',
                        success: function (data) {
                            const selectGeneralProgramBody = $('#general-program');
                            const tableGeneralPurposeBody = $('#general-purpose');
                            const tableRecordsPurposeBody = $('#records-purpose');
                            const tableArchivePurposeBody = $('#archiving-purpose');

                            //selectGeneralProgramBody.empty();
                            //tableGeneralPurposeBody.empty();
                            //tableRecordsPurposeBody.empty();
                            //tableArchivePurposeBody.empty();

                            // Populate table with new data
                            data.forEach(item => {

                                if (item.course !== undefined && item.serviceType == 'GENERAL') {
                                    selectGeneralProgramBody.append(`
                                     <option value="`+ item.course + `">` + item.course + `</option>
               					`);
                                }
                                else if (item.purpose !== undefined && item.serviceType == 'GENERAL') {
                                    tableGeneralPurposeBody.append(`
									      <option value="`+ item.purpose + `">` + item.purpose + `</option>
								`);
                                }

                                if (item.purpose !== undefined && item.serviceType == 'RECORDS') {
                                    tableRecordsPurposeBody.append(`
									        <option value="`+ item.purpose + `">` + item.purpose + ` [Php` + item.amount + `.00]</option>
								`);
                                }
                                else if (item.program === undefined && item.serviceType == 'ARCHIVING') {
                                    tableArchivePurposeBody.append(`
									 <option value="`+ item.purpose + `">` + item.purpose + `</option>
								`);
                                }

                            });
                        },
                        error: function (error) {
                            $.notify("Error fetching data " + error, { color: "#fff", background: "#D44950", delay: 1000 })
                        }
                    });
                }

                InquirySelection();

                //websocket
                var wsUrl;
                if (window.location.protocol == 'http:') {
                    wsUrl = 'ws://';
                } else {
                    wsUrl = 'wss://';
                }
                var ws = new WebSocket(wsUrl + window.location.host + "/queueupdate");

                ws.onopen = function (event) {
                    console.log('WebSocket connection opened', event);
                };

                function sendMsg(response) {
                    if (response) {
                        ws.send(JSON.stringify({
                            message: response
                        }));
                        //ws.send("Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you");
                    }
                }
            </script>
        </body>

        </html>
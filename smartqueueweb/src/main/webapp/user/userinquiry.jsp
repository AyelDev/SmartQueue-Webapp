<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
        <script type="text/javascript" src="../scripts/fadetransition.js"></script>
        <link rel="stylesheet" href="../css/loader.css">
        <title>Document</title>
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
            z-index: 1;
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
            max-width: 500px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
            margin-left: 30%;
            margin-top: 5%;
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
        .purpose {
            height: 5vh;
            width: 40%;
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
            width: 100%;
            white-space: nowrap;
            animation: slide 20s linear infinite;
            margin: 0 24px;
            position: absolute;
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

            .name {
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

            .name {
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
                <img src="../images/logo.png" class="logo">
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
                    <label for="studentName">Student Name</label>
                    <input type="text" class="student-name" id="general-student-name" disabled>
                    <label for="studentIdNo">Student ID No.</label>
                    <input type="text" class="student-id" id="general-student-id">
                    <label for="yearLevel">Year Level</label>
                    <input type="text" class="yearLevel" id="yearLevel">
                    <label for="options">Option</label>
                    <select name="purpose" id="general-purpose" class="purpose">
                        <option value="">--</option>
                        <option value="enrollment">Enrollment</option>
                        <option value="assesment">Assesment</option>
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
                        <option value="Cerifications">Cerifications (150php)</option>
                        <option value="Good Moral">Good Moral (150php)</option>
                        <option value="FORM 137">FORM 137 (150php)</option>
                        <option value="TOR">Transcript of Records(TOR) (600php)</option>
                        <option value="Diploma">Diploma (600php)</option>
                        <option value="Grade Evaluation">Grade Evaluation (150php)</option>
                        <option value="GWA">GWA (200php)</option>
                        <option value="Application for Honors">Application for Honors (150php)</option>
                    </select>

                    <input type="hidden" id="serviceType">

                    <input type="button" class="printbutton" value="Print" onclick="printQueue('Records')">
                </form>
            </div>
        </div>

        <!-- Archiving Modal -->
        <div id="archiving-modal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal('archivingModal')">&times;</span>
                <h2>Archiving Form</h2>
                <form id="form" class="form">
                    <label for="name">Student Name</label>
                    <input type="text" class="student-name" id="archiving-student-name" required>
                    <label for="studentIdNo">Student ID No.</label>
                    <input type="text" class="student-id" id="archiving-student-id" required>
                    <label for="options">Option</label>
                    <select name="purpose" id="archiving-purpose" class="purpose">
                        <option value="">--</option>
                        <option value="enrollment">Enrollment</option>
                        <option value="assesment">Assesment</option>
                    </select>

                    <input type="hidden" id="serviceType">

                    <input type="button" class="printbutton" value="Print" onclick="printQueue('Archiving')">
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
                        <h2 style="color: #00296b;" id="serviceNamePrint">Service Name</h2>
                        <h3>Your Queue Number is:</h3>
                        <h1 id="queueNumberPrint" style="font-size: 60px; color: #d9534f;">###</h1>
                        <p id="queueDetails"></p>
                        <p id="queueDateTime"></p>
                    </div>
                </div>
            </div>
        </div>


        <script>
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

            // Close the modal when the close (X) is clicked
            for (var i = 0; i < closeButtons.length; i++) {
                closeButtons[i].onclick = function () {
                    closeModal(this.parentElement.parentElement);
                }
            }

            // Close modal when clicking outside of it
            window.onclick = function (event) {
                if (event.target == generalModal) {
                    closeModal(generalModal);
                }
                if (event.target == recordsModal) {
                    closeModal(recordsModal);
                }
                if (event.target == archivingModal) {
                    closeModal(archivingModal);
                }
            }




            //this is for setting queue limit
            let currentQueueCount = 0;

            // Function to check if the queue is still open based on the limit
            function checkQueueLimit() {
                const limit = localStorage.getItem('dailyQueueLimit') || 200;  // Default to 200 if not set
                if (currentQueueCount >= limit) {
                    alert('Sorry, the queue for today is full. Please come back tomorrow.');
                    return false;
                }
                return true;
            }



            // Function to print the queue and check if limit is reached
            function printQueue(serviceType) {
                let studentName = '';
                let studentId = '';
                let purpose = '';

                if (serviceType === 'General') {
                    studentName = document.getElementById('general-student-name').value;
                    studentId = document.getElementById('general-student-id').value;
                    purpose = document.getElementById('general-purpose').value;
                } else if (serviceType === 'Records') {
                    studentName = document.getElementById('records-student-name').value;
                    studentId = document.getElementById('records-student-id').value;
                    purpose = document.getElementById('records-purpose').value;
                } else if (serviceType === 'Archiving') {
                    studentName = document.getElementById('archiving-student-name').value;
                    studentId = document.getElementById('archiving-student-id').value;
                    purpose = document.getElementById('archiving-purpose').value;
                }

                if (!studentId || !purpose) {
                    alert('Please fill in all the details.');
                    return;
                }

                // Generate random queue number and current date
                var queueNumber = Math.floor(Math.random() * 900) + 100;  // Random 3-digit number
                var currentDateTime = new Date().toLocaleString();

                // Create the receipt content
                var receiptContent = `
    <h3>CEBU EASTERN COLLEGE</h3>
    <center><h4>QUEUING NO.</h4>
    <hr>
    <h1>${queueNumber}</h1>
    <hr>
    <p>${studentName}</p>
    <p>${studentId}</p></center>
    <br><br><br>        
    <h4>${serviceType} Service</h4>
    <p>Purpose: ${purpose}</p>
    
    <p>${currentDateTime}</p>
`;

                // Inject the receipt content into the modal
                document.getElementById('receiptContainer').innerHTML = receiptContent;

                // Show the modal
                var modal = document.getElementById('receiptModal');
                modal.style.display = "block";

                // Automatically print the receipt content
                setTimeout(function () {
                    window.print();
                }, 500); // Optional delay before printing
            }

            // Close the modal when the user clicks the "close" button
            function closeModal() {
                var modal = document.getElementById('receiptModal');
                modal.style.display = "none";
            }

        </script>

    </body>

    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="../css/userinquiry.css">
            <link rel="stylesheet" href="../css/loader.css">
            <link rel="stylesheet" href="../css/prettify.css">
            <link rel="stylesheet" href="../css/notify.css">
            <title>User Inquiry</title>
        </head>

        <body>
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
                            <h2>Admission</h2>
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
                    <h2>Admission Inquiry Form</h2>
                    <div class="form">
                        <div class="studename">
                            <label for="studentName" class="firstname-label">First Name</label>
                            <input type="text" class="generalfirst-name" id="general-student-firstname">
                            <label for="studentName" class="middlename-label">Middle Name</label>
                            <input type="text" class="generalmiddle-name" id="general-student-middlename">
                            <label for="studentName" class="lastname-label">Last Name</label>
                            <input type="text" class="generallast-name" id="general-student-lastname">
                        </div>


                        <label for="studentIdNo" class="student-id-no-text">Student ID No. Type '000' for new
                            student</label>
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

                        <label for="studentIdNo">Student ID No. </label>
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

            <div class="footer">© 2024 Cebu Eastern College. All Rights Reserved.</div>

            <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="../scripts/fadetransition.js"></script>
            <script type="text/javascript" src="../scripts/notify.js"></script>
            <script type="text/javascript" src="../scripts/prettify.js"></script>
            <script type="text/javascript" src="../scripts/user/userinquiry.js"></script>
        </body>

        </html>
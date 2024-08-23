<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fontawesome.com/license/free">
    <title>Records</title>
</head>

<body>
    <style>
        * {
            padding: 0%;
            margin: 0%;
            font-family: arial black;
        }

        .container {
            height: 100vh;
            width: 100%;
            background-color: antiquewhite;
        }

        .header {
            height: 18vh;
            width: 100%;
            background-color: #00296b;
            align-items: center;
            justify-content: center;
            display: flex;
        }

        .head {
            height: 11vh;
            width: 100%;
            background-color: #fff;
            align-items: center;
            display: flex;
            justify-content: center;
        }

        .title {
            text-align: center;
            font-size: 40px;
        }

        .back-arrow {
            position: absolute;
            margin-left: -40%;
            margin-top: -.9%;
        }

        .main {
            background-color: #77B6EA;
            width: 100%;
            height: 82vh;
            align-items: center;
            justify-content: center;
            display: flex;
        }

        .view-general {
            height: 68vh;
            width: 65%;
            background-color: #fff;
            background: rgb(72.5%, 85.5%, 95.7%);
        }

        .fillupform {
            margin: 30px;
            margin-top: -1%;
            flex-direction: column;
            display: flex;
            position: absolute;
            color: black;
        }

        label {
            color: black;
            position: relative;
            margin-top: 40px;
        }

        .printbutton {
            width: 6rem;
            height: 2rem;
            margin-top: 40%;
            margin-left: 82%;
        }

        .student-id,
        .student-name,
        #yearLevel,
        #purpose {
            height: 40px;
        }

        .notebox {
            margin-left: 30%;
            margin-top: 10%;
            width: 20%;
            height: 15vh;
            position: absolute;
        }
        .note{
            font-family: calibri;

        }
    </style>
    <div class="container">
        <div class="header">
            <div class="head">
                <a href="userinquiry.jsp"><svg xmlns="http://www.w3.org/2000/svg" class="back-arrow" width=30 height=30
                        viewBox="0 0 448 512">
                        <path
                            d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z" />
                    </svg></a>
                <h1 class="title">Records</h1>
            </div>
        </div>
        <div class="main">
            <div class="view-general">
                <div class="form">
                    <div class="notebox">
                        <h1 class="note">Note:</h1>
                        <p class="note">00000 = New student <br>
                            For Alumni, click year level first to input your name</p>
                    </div>

                    <div class="fillupform">
                        <label for="studentIdNo">Student ID No.</label>
                        <input type="text" class="student-id" id="student-id">
                        <label for="studentName">Student Name</label>
                        <input type="text" class="student-name" id="student-name" disabled>
                        <label for="yearLevel">Year Level</label>
                        <select name="yearLevel" id="yearLevel">
                            <option value="">--</option>
                            <option value="firstyear">1st Year</option>
                            <option value="secondyear">2nd Year</option>
                            <option value="thirdyear">3rd Year</option>
                            <option value="fourthyear">4th Year</option>
                            <option value="alumni">Alumni</option>
                        </select>
                        <label for="purpose">Purpose</label>
                        <select name="purpose" id="purpose">
                            <option value="">--</option>
                            <option value="enrollment">Cerifications (150php)</option>
                            <option value="assesment">Good Moral (150php)</option>
                            <option value="assesment">FORM 137 (150php)</option>
                            <option value="assesment">Transcript of Records(TOR) (600php)</option>
                            <option value="assesment">Diploma (600php)</option>
                            <option value="assesment">Grade Evaluation (150php)</option>
                            <option value="assesment">GWA (200php)</option>
                            <option value="assesment">Application for Honors (150php)</option>
                        </select>
                    </div>
                    <input type="button" name="printbutton" id="printbutton" class="printbutton" value="Print">
                </div>
            </div>
        </div>
    </div>
</body>

</html>
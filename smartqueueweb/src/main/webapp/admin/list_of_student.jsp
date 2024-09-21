<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="./scripts/fadetransition.js"></script>
    <link rel="stylesheet" href="./css/loader.css">
    <title>Admin | List of Student</title>
</head>

<body>
    <style>
        :root {
            --primary-color: #1e91d0;
            --secondary-color: #00509d;
            --body-fonts: Arial, Helvetica black;
            --background-color: #F6F4EB;
            --select-text-color: #B4B4B8;
            --text-color: #272829;
        }

        body {
            width: 100%;
            height: 100%;
            font-family: Arial, Helvetica black;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            height: 100%;
            background-color: white;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            align-items: center;
            justify-content: center;

        }

        .main {
            width: 100vw;
            height: 100vh;
            background-color: var(--background-color);
            display: flex;
        }

        .navbar {
            width: 15vw;
            height: 100vh;
            background-color: var(--primary-color);
            position: fixed;
            justify-content: center;
            align-items: center;
            left: 0;

        }

        .logoContainer {
            width: 100%;
            text-align: center;
        }

        .logo {
            width: 50%;
            max-width: 100%;
            object-fit: contain;
        }

        .title {
            color: var(--background-color);
            font-size: 0.8em;
        }

        .adminProfile {
            margin-left: 2.5rem;
            position: absolute;
            background-color: var(--background-color);
            width: 9.5vw;
            align-items: center;
            justify-content: center;
            text-align: center;
            z-index: 1;
            display: none;
        }

        .adminProfile a,
        .dropdown-dashboard a {
            text-decoration: none;
            color: var(--background-color);
            overflow: hidden;
            color: black;
            width: 9.5vw;
            height: 20%;
            text-align: center;
            align-items: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: .5rem 0 0 0;
            height: 2rem;
        }

        .adminProfile a:hover {
            background-color: var(--select-text-color);
        }

        .button-profile {
            align-items: center;
            justify-content: center;
            display: flex;
            width: 10vw;
            margin-top: 30px;
            margin-left: 36px;
            border-radius: 10px;
            padding: 15px 10px 15px 10px;
            /*tlbr*/
            overflow: hidden;
            cursor: pointer;
        }

        .profile {
            width: 10%;
            object-fit: scale-down;
            margin-right: 20px;
        }

        .caretdown {
            mix-blend-mode: multiply;
            width: 10px;
            margin-left: 20px;
        }

        /* navbar */
        .menu-navbar {
            margin-top: 2rem;
            display: flex;
            flex-direction: column;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-dashboard {
            display: none;
            position: absolute;
            background-color: var(--background-color);
            min-width: 160px;
            top: 100%;
            left: 80%;
            z-index: 1;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border-radius: 4px;
        }

        .dropdown-dashboard a {
            display: block;
            text-decoration: none;
            color: var(--text-color);
            padding: 12px 16px;
            text-align: center;
        }

        .dropdown-dashboard a:hover {
            background-color: var(--select-text-color);
        }

        .dropdown-btn {
            background: none;
            padding: 20px;
            display: flex;
            align-items: center;
            width: 20vw;
            border: 0;
            font-size: 15px;
            color: #F6F4EB;
            border-radius: 15px;
            padding-right: 60px;
            margin-left: 10px;
            cursor: pointer;
            position: relative;
        }

        .dropdown:hover .dropdown-dashboard {
            display: block;
        }

        .dropdown-btn:hover {
            background-color: var(--background-color);
            width: 18vw;
            color: var(--text-color);
            font-weight: bold;
        }

        .dropdown-btn:hover+.dropdown-dashboard {
            display: block;
        }

        .dashboard-icon,
        .users-icon,
        .display-icon,
        .entertainment-icon,
        .counter-icon {
            object-fit: scale-down;
            width: 10%;
        }

        .dashboard-icon,
        .users-icon,
        .display-icon,
        .entertainment-icon,
        .counter-icon {
            margin-right: 17px;
        }

        .dashboard-caretright {
            margin-left: 50px;
        }

        .caretright {
            object-fit: scale-down;
            width: 5%;
            right: 5.5rem;
            position: absolute;
        }

        .studentlist-section {
            width: 85vw;
            height: 100vh;
            background-color: var(--background-color);
            float: right;
            margin-left: 15%;
            align-items: center;
            display: flex;
            justify-content: center;
        }


        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            /* Ensures the border radius applies to the table */
        }

        thead {
            background-color: #3498db;
            color: #ffffff;
        }

        th {
            padding: 12px 15px;
            text-align: left;
            font-size: 16px;
            font-weight: 600;
            border-bottom: 3px solid #2980b9;
        }

        tbody tr {
            transition: background-color 0.3s, transform 0.3s;
        }

        tbody tr:hover {
            background-color: #ecf0f1;
            transform: translateY(-2px);
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #e1e5ea;
            font-size: 14px;
            color: #555;
            text-align: center;
            /* Center-align text in cells */
        }

        tr:first-child td {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        tr:last-child td {
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        button {
            border: none;
            padding: 8px 12px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn.update {
            background-color: #3498db;
            color: #ffffff;
        }

        .btn.update:hover {
            background-color: #2980b9;
        }

        .btn.delete {
            background-color: #e74c3c;
            color: #ffffff;
        }

        .btn.delete:hover {
            background-color: #c0392b;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {

            table,
            thead,
            tbody,
            th,
            td,
            tr {
                display: block;
                width: 100%;
            }

            th,
            td {
                position: relative;
                padding-left: 50%;
                text-align: right;
            }

            th::before,
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 50%;
                padding-left: 10px;
                font-weight: bold;
                text-align: left;
                background: #f7f9fc;
                border-right: 1px solid #ddd;
                white-space: nowrap;
            }

            td::before {
                content: "";
            }
        }

        .studentlist-content {
            width: 90%;
            max-width: 1000px;
            margin: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
        }
    </style>

    <body>
        <div class="container">
            <div class="navbar">
                <div class="logoContainer">
                    <img src="./images/cec.png" alt="" class="logo">
                    <p class="title">Cebu Eastern College
                    <p>
                </div>
                <!-- admin profile -->
                <button class="button-profile" id="button-profile"><img src="../images/profile.png" alt=""
                        class="profile">ADMIN<img src="../images/caretdown.png" alt="" class="caretdown"></button>
                <div class="adminProfile" id="adminProfile">
                    <a href="">Settings</a>
                    <a href="login">Signout</a>
                </div>

                <div class="menu-navbar">
                    <div class="dropdown">
                        <button class="dropdown-btn"><img src="../images/dashboard.png" alt=""
                                class="dashboard-icon">Dashboard<img src="./images/caretright.png" alt=""
                                class="caretright"></button>
                        <div class="dropdown-dashboard">
                            <a href="dashboard">Dashboard</a>
                            <a href="">Total of Counter</a>
                            <a href="">Total of Students</a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <button class="dropdown-btn"><img src="../images/counter.png" alt=""
                                class="counter-icon">Counter<img src="./images/caretright.png" alt=""
                                class="caretright"></button>
                        <div class="dropdown-dashboard">
                            <a href="">Add Counter</a>
                            <a href="listofcounter">List of Counter</a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <button class="dropdown-btn"><img src="../images/users.png" alt="" class="users-icon">Users<img
                                src="./images/caretright.png" alt="" class="caretright"></button>
                        <div class="dropdown-dashboard">
                            <a href="">Add Student</a>
                            <a href="">Add Staff</a>
                            <a href="studentlist">List of Student</a>
                            <a href="stafflist">List of Staff</a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <button class="dropdown-btn"><img src="../images/entertainment.png" alt=""
                                class="entertainment-icon">Entertainment<img src="./images/caretright.png" alt=""
                                class="caretright"></button>
                        <div class="dropdown-dashboard">
                            <a href="">Video advertisement</a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <button class="dropdown-btn"><img src="../images/display.png" alt=""
                                class="display-icon">Display<img src="./images/caretright.png" alt=""
                                class="caretright"></button>
                        <div class="dropdown-dashboard">
                            <a href="">User Inquiry</a>
                            <a href="">User Window</a>
                            <a href="">Counter Window</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="studentlist-section">
                <div class="studentlist-content">
                    <h1>Student List</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Course</th>
                                <th>Options</th> <!-- Added Options Header -->
                            </tr>
                        </thead>
                        <tbody id="tablelist">
                            <tr>
                                <td>Loading...</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <script>
                var dropdown = document.getElementsByClassName("button-profile");
                var i;

                for (i = 0; i < dropdown.length; i++) {
                    dropdown[i].addEventListener("click", function () {

                        var dropdownContent = this.nextElementSibling;
                        if (dropdownContent.style.display === "block") {
                            dropdownContent.style.display = "none";
                        } else {
                            dropdownContent.style.display = "block";
                        }
                    });
                }

                var staffListInfo = document.getElementById("tablelist");

                function updateData() {
                    var request = new XMLHttpRequest();
                    request.open('GET', 'http://localhost:8080/smartqueueweb/JsonStudentListAPI');
                    request.onload = function () {
                        var data = JSON.parse(request.responseText);
                        renderHTML(data);
                    }
                    request.send();
                }

                function renderHTML(data) {
                    var htmlString = ``;

                    for (var i = 0; i < data.length; i++) {

                        htmlString += "<tr>";
                        htmlString += "<td>" + data[i].idnumber + "</td>";
                        htmlString += "<td>" + data[i].firstname + " " + data[i].middlename + " " + data[i].lastname + " </td>";
                        htmlString += "<td>" + data[i].course + "</td>";
                        htmlString += '<td><a href="update?staffId=' + data[i].staffID + '"><button class="update" style="background-color: #97BE5A;">Update</button></a> ';
                        htmlString += '<a href="delete?staffId=' + data[i].staffID + '"><button class="delete" style="background-color: #EE4E4E;">Delete</button></a>';
                        htmlString += "</tr>";
                    }

                    staffListInfo.innerHTML = htmlString;
                }

                setInterval(updateData, 2000);


            </script>

            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>

    </body>

</html>
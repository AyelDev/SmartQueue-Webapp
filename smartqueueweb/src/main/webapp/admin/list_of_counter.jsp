<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <title>List of counter</title>
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
                    width: 15vw;
                    height: 7%;
                    align-items: center;
                    display: flex;
                    justify-content: center;
                    margin-top: 10px;
                }

                .title {
                    margin-left: 10px;
                    color: var(--background-color);
                    font-size: .8em;
                }

                .logo {
                    width: 25%;
                    max-width: 100%;
                    object-fit: scale-down;
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
            </style>

            <body>
                <div class="container">
                    <div class="navbar">
                        <div class="logoContainer">
                            <img src="../images/cec.png" alt="" class="logo">
                            <p class="title">Cebu Eastern College
                            <p>
                        </div>
                        <!-- admin profile -->
                        <button class="button-profile" id="button-profile"><img src="../images/profile.png" alt=""
                                class="profile">ADMIN<img src="../images/caretdown.png" alt=""
                                class="caretdown"></button>
                        <div class="adminProfile" id="adminProfile">
                            <a href="">Settings</a>
                            <a href="#">Signout</a>
                        </div>

                        <div class="menu-navbar">
                            <div class="dropdown">
                                <button class="dropdown-btn"><img src="../images/dashboard.png" alt=""
                                        class="dashboard-icon">Dashboard<img src="./images/caretright.png" alt=""
                                        class="caretright"></button>
                                <div class="dropdown-dashboard">
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
                                    <a href="admin/list_of_counter.jsp">List of Counter</a>
                                </div>
                            </div>

                            <div class="dropdown">
                                <button class="dropdown-btn"><img src="../images/users.png" alt=""
                                        class="users-icon">Users<img src="./images/caretright.png" alt=""
                                        class="caretright"></button>
                                <div class="dropdown-dashboard">
                                    <a href="">Add Student</a>
                                    <a href="">Add Staff</a>
                                    <a href="">List of Student</a>
                                    <a href="">List of Staff</a>
                                </div>
                            </div>

                            <div class="dropdown">
                                <button class="dropdown-btn"><img src="../images/entertainment.png" alt=""
                                        class="entertainment-icon">Entertainment<img src="./images/caretright.png"
                                        alt="" class="caretright"></button>
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
                    <div class="counter-section">
                        <div class="counter-content">
                            <table>

                            </table>
                        </div>
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


                </script>
            </body>

        </html>

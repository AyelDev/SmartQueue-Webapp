<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Entertainment</title>
</head>
<style>
    @import url('./admin/fonts.css');

    :root {
        --primary-color: #1e91d0;
        --secondary-color: #00509d;
        --body-fonts: "Roboto Condensed", sans-serif;
        --background-color: #F6F4EB;
        --select-text-color: #B4B4B8;
        --text-color: #3D3C42;
        font-optical-sizing: auto;
        font-style: normal;
    }

    * {
        font-family: var(--body-fonts);
        padding: 0;
        margin: 0;
    }

    body {
        width: 100%;
        height: 100%;
        font-family: var(--body-fonts);
        margin: 0;
        padding: 0;
        font-optical-sizing: auto;
        font-style: normal;
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


    /*Navbar section*/
    .navbar {
        width: 15vw;
        height: 100vh;
        background-image: linear-gradient(90deg, #1e91d0 15%, #1477d4fb 100%);
        position: fixed;
        justify-content: center;
        align-items: center;
        left: 0;
        float: left;
    }

    .logoContainer {
        width: 100%;
        text-align: center;
    }

    .logo {
        width: 50%;
        max-width: 100%;
        object-fit: contain;
        margin-top: 50px;
    }

    .title {
        color: var(--background-color);
        font-size: 0.8em;
    }

    /* menu */
    .menu-navbar {
        margin-top: 3rem;
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
        width: 120px;
        top: 100%;
        left: 70%;
        z-index: 1;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        border-radius: 4px;
        padding: 10px;
        overflow-x: hidden;
    }

    .dropdown-dashboard a {
        display: flex;
        text-decoration: none;
        color: black;
        text-align: center;
        align-items: center;
        justify-content: center;
        font-size: 11px;
        flex-direction: column;
        padding: 10px;
    }

    .dropdown-dashboard a:hover {
        background-color: var(--select-text-color);
        border-radius: 4px;
        color: black;
        border-radius: 4px;
        padding: 10px;
        width: 120px;
        margin-left: -7.2%;
    }

    .dropdown-btn {
        background: none;
        padding: 20px;
        display: flex;
        align-items: center;
        width: 20vw;
        border: 0;
        font-size: 15px;
        border-radius: 16px 0 0 16px;
        padding-right: 60px;
        margin-left: 10px;
        cursor: pointer;
        position: relative;
        color: #F6F4EB;
    }

    .dropdown-btn::after {
        content: '';
        border-radius: 50%;
    }

    .dropdown-btn a {
        text-decoration: none;
        color: #F6F4EB;
    }

    .dropdown-btn a:hover {
        color: black;
        font-weight: bold;
    }

    .dropdown:hover .dropdown-dashboard {
        display: block;
    }

    .dropdown {
        color: var(--background-color);
    }

    .dropdown:hover {
        color: black;
        font-weight: bold;
    }

    .dropdown-btn a:hover,
    .dropdown-btn:hover,
    .active {
        color: var(--text-color);
        font-weight: bold;
    }

    .active,
    .dropdown-btn:hover {
        background-color: var(--background-color);
        width: 14.5vw;
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

    /*Video Entertainment*/
    .video-entertainment{
        width: 85vw;
        height: 100%;
        float: right;
      
    }
</style>

<body>
    <div class="navbar">
        <div class="logoContainer">
            <img src="../images/logo.png" alt="" class="logo">
            <p class="title">Cebu Eastern College
            <p>
        </div>

        <div class="menu-navbar">
            <div class="dropdown">
                <button class="dropdown-btn"><img src="../images/dashboard.png" alt=""
                    class="dashboard-icon"></i><a
                        href="">Dashboard</a>
                </button>

            </div>

            <div class="dropdown">
                <button class="dropdown-btn"><img src="../images/counter.png" alt=""
                        class="counter-icon">Counter</button>
                <div class="dropdown-dashboard">
                    <a href="">Add Counter</a>
                    <a href="listofcounter">List of Counter</a>
                </div>
            </div>

            <div class="dropdown">
                <button class="dropdown-btn"><img src="../images/users.png" alt="" class="users-icon">Users</button>
                <div class="dropdown-dashboard">
                    <a href="">Add Student</a>
                    <a href="">Add Staff</a>
                    <a href="studentlist">List of Student</a>
                    <a href="stafflist">List of Staff</a>
                </div>
            </div>

            <div class="dropdown">
                <button class="dropdown-btn"><img src="../images/entertainment.png" alt="" class="entertainment-icon"><a
                        href="video_ads.jsp">Entertainment</a>
                </button>
            </div>

            <div class="dropdown">
                <button class="dropdown-btn"><img src="../images/display.png" alt=""
                        class="display-icon">Display</button>
                <div class="dropdown-dashboard">
                    <a href="">User Inquiry</a>
                    <a href="">User Window</a>
                    <a href="">Counter Window</a>
                </div>
            </div>
        </div>
    </div>
    <div class="video-entertainment">
        <h2>Video Entertainment - Admin</h2>
        <hr>

    </div>
</body>

</html>
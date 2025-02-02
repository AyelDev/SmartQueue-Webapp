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
    <link rel="stylesheet" href="./css/admincounterwindow.css">
    <title>Counter window</title>
</head>

<body>
    <div class="container">
        <div class="navbar">
            <div class="logoContainer">
                <img src="./images/logo.png" alt="" class="logo">
                <p class="title">Cebu Eastern College
                <p>
            </div>

            <div class="menu-navbar">
                <div class="dropdown">
                    <button class="dropdown-btn" onclick="window.location.href = 'dashboard';"><svg class="dashboard-icon"
                            fill="#ffffff" width="64px" height="64px" viewBox="-2 0 19 19"
                            xmlns="http://www.w3.org/2000/svg" class="cf-icon-svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <path
                                    d="M13.55 15.256H1.45a.554.554 0 0 1-.553-.554V3.168a.554.554 0 1 1 1.108 0v10.98h11.544a.554.554 0 0 1 0 1.108zM3.121 13.02V6.888a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v6.132zm2.785 0V3.507a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v9.513zm2.785 0V6.888a.476.476 0 0 1 .475-.475h.786a.476.476 0 0 1 .475.475v6.132zm2.786 0v-2.753a.476.476 0 0 1 .475-.475h.785a.476.476 0 0 1 .475.475v2.753z">
                                </path>
                            </g>
                        </svg>
                        Dashboard
                    </button>

                </div>

                <div class="dropdown">
                    <button class="dropdown-btn" onclick="window.location.href='counterlist';"><svg class="counter-icon"
                            width="64px" height="64px" viewBox="0 0 24 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg" transform="rotate(90)">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <path
                                    d="M4.5 3.75L4.5 20.25C4.5 20.6642 4.16421 21 3.75 21C3.33579 21 3 20.6642 3 20.25V3.75C3 3.33579 3.33579 3 3.75 3C4.16421 3 4.5 3.33579 4.5 3.75Z"
                                    fill="#ffffff"></path>
                                <path d="M16 5.25C16 4.00736 15.1046 3 14 3H10C8.89543 3 8 4.00736 8 5.25V8L16 8V5.25Z"
                                    fill="#ffffff"></path>
                                <path d="M8 14.5V9.5L16 9.5V14.5L8 14.5Z" fill="#ffffff"></path>
                                <path
                                    d="M8 16V18.75C8 19.9926 8.89543 21 10 21H14C15.1046 21 16 19.9926 16 18.75V16L8 16Z"
                                    fill="#ffffff"></path>
                                <path
                                    d="M21 20.25V3.75C21 3.33579 20.6642 3 20.25 3C19.8358 3 19.5 3.33579 19.5 3.75V20.25C19.5 20.6642 19.8358 21 20.25 21C20.6642 21 21 20.6642 21 20.25Z"
                                    fill="#ffffff"></path>
                            </g>
                        </svg>Counter</button>
                </div>

                <div class="dropdown">
                    <button class="dropdown-btn"><svg class="users-icon" fill="#ffffff" width="64px" height="64px"
                            viewBox="0 -64 640 640" xmlns="http://www.w3.org/2000/svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <path
                                    d="M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2zm-223.7-13.4C161.5 263.1 145.6 256 128 256H64c-35.3 0-64 28.7-64 64v32c0 17.7 14.3 32 32 32h65.9c6.3-47.4 34.9-87.3 75.2-109.4z">
                                </path>
                            </g>
                        </svg>Users</button>
                    <div class="dropdown-dashboard">
                        <a href="studentlist">Student</a>
                        <a href="stafflist">Staff</a>
                    </div>
                </div>

                <div class="dropdown">
                    <button class="dropdown-btn" onclick="window.location.href = 'videoads';"><svg
                            class="entertainment-icon" width="64px" height="64px" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg" fill="none">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <path fill="#ffffff" fill-rule="evenodd"
                                    d="M5 5a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3v-1.586l2.293 2.293A1 1 0 0 0 22 16V8a1 1 0 0 0-1.707-.707L18 9.586V8a3 3 0 0 0-3-3H5z"
                                    clip-rule="evenodd"></path>
                            </g>
                        </svg>
                        Entertainment
                    </button>
                </div>

                <div class="dropdown">
                    <button class="dropdown-btn"><svg class="display-icon" fill="#ffffff" width="64px" height="64px"
                            viewBox="0 0 256 256" id="Flat" xmlns="http://www.w3.org/2000/svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <path
                                    d="M232,62.9209v112a24.0275,24.0275,0,0,1-24,24H48a24.0275,24.0275,0,0,1-24-24v-112a24.0275,24.0275,0,0,1,24-24H208A24.0275,24.0275,0,0,1,232,62.9209Zm-72,152H96a8,8,0,1,0,0,16h64a8,8,0,0,0,0-16Z">
                                </path>
                            </g>
                        </svg>Display</button>
                    <div class="dropdown-dashboard">
                        <a href="userinquiry">User Inquiry</a>
                        <a href="userwindow">User Window</a>
                        <a href="admincounterwindow">Counter Window</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="dashboard-section">
            <div class="dashboard-head">
                <div class="icon-container">
                    <svg class="bell-icon" id="notifications" width="30px" height="64px" viewBox="0 0 24.00 24.00" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC"
                            stroke-width="0.048"></g>
                        <g id="SVGRepo_iconCarrier">
                            <path
                                d="M9.00195 17H5.60636C4.34793 17 3.71872 17 3.58633 16.9023C3.4376 16.7925 3.40126 16.7277 3.38515 16.5436C3.37082 16.3797 3.75646 15.7486 4.52776 14.4866C5.32411 13.1835 6.00031 11.2862 6.00031 8.6C6.00031 7.11479 6.63245 5.69041 7.75766 4.6402C8.88288 3.59 10.409 3 12.0003 3C13.5916 3 15.1177 3.59 16.2429 4.6402C17.3682 5.69041 18.0003 7.11479 18.0003 8.6C18.0003 11.2862 18.6765 13.1835 19.4729 14.4866C20.2441 15.7486 20.6298 16.3797 20.6155 16.5436C20.5994 16.7277 20.563 16.7925 20.4143 16.9023C20.2819 17 19.6527 17 18.3943 17H15.0003M9.00195 17L9.00031 18C9.00031 19.6569 10.3435 21 12.0003 21C13.6572 21 15.0003 19.6569 15.0003 18V17M9.00195 17H15.0003"
                                stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            </path>
                        </g>
                    </svg>
                    <div class="notification-badge" id="notificationBadge">3</div>
                    <!-- <svg class="chat-icon" width="64px" height="30px" viewBox="-2.4 -2.4 28.80 28.80" fill="none"
                        xmlns="http://www.w3.org/2000/svg" stroke="#ffffff">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"
                            stroke="#ffffff030303" stroke-width="0.336">
                            <path
                                d="M7 4C4.79086 4 3 5.79073 3 7.9997V13.2642C3 15.4732 4.79086 17.2639 7 17.2639L7 19.8998C7 19.9834 7.09639 20.0301 7.16197 19.9783L10.6 17.2639H17C19.2091 17.2639 21 15.4732 21 13.2642V7.99971C21 5.79073 19.2091 4 17 4H7Z"
                                stroke="#ffffff" stroke-width="0.552" stroke-linecap="round"></path>
                            <path
                                d="M9 11C9 11.5523 8.55228 12 8 12C7.44772 12 7 11.5523 7 11C7 10.4477 7.44772 10 8 10C8.55228 10 9 10.4477 9 11Z"
                                fill="#ffffff"></path>
                            <path
                                d="M13 11C13 11.5523 12.5523 12 12 12C11.4477 12 11 11.5523 11 11C11 10.4477 11.4477 10 12 10C12.5523 10 13 10.4477 13 11Z"
                                fill="#ffffff"></path>
                            <path
                                d="M17 11C17 11.5523 16.5523 12 16 12C15.4477 12 15 11.5523 15 11C15 10.4477 15.4477 10 16 10C16.5523 10 17 10.4477 17 11Z"
                                fill="#ffffff"></path>
                        </g>
                        <g id="SVGRepo_iconCarrier">
                            <path
                                d="M7 4C4.79086 4 3 5.79073 3 7.9997V13.2642C3 15.4732 4.79086 17.2639 7 17.2639L7 19.8998C7 19.9834 7.09639 20.0301 7.16197 19.9783L10.6 17.2639H17C19.2091 17.2639 21 15.4732 21 13.2642V7.99971C21 5.79073 19.2091 4 17 4H7Z"
                                stroke="#ffffff" stroke-width="1.608" stroke-linecap="round"></path>
                            <path
                                d="M9 11C9 11.5523 8.55228 12 8 12C7.44772 12 7 11.5523 7 11C7 10.4477 7.44772 10 8 10C8.55228 10 9 10.4477 9 11Z"
                                fill="#ffffff"></path>
                            <path
                                d="M13 11C13 11.5523 12.5523 12 12 12C11.4477 12 11 11.5523 11 11C11 10.4477 11.4477 10 12 10C12.5523 10 13 10.4477 13 11Z"
                                fill="#ffffff"></path>
                            <path
                                d="M17 11C17 11.5523 16.5523 12 16 12C15.4477 12 15 11.5523 15 11C15 10.4477 15.4477 10 16 10C16.5523 10 17 10.4477 17 11Z"
                                fill="#ffffff"></path>
                        </g>
                    </svg> -->
                </div>



                <!-- admin profile -->
                <button class="profilebutton" id="profilebutton"><svg class="profile" width="64px" height="64px"
                    viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                    <g id="SVGRepo_iconCarrier">
                        <path
                            d="M16.19 2H7.81C4.17 2 2 4.17 2 7.81V16.19C2 19 3.29 20.93 5.56 21.66C6.22 21.89 6.98 22 7.81 22H16.19C17.02 22 17.78 21.89 18.44 21.66C20.71 20.93 22 19 22 16.19V7.81C22 4.17 19.83 2 16.19 2ZM20.5 16.19C20.5 18.33 19.66 19.68 17.97 20.24C17 18.33 14.7 16.97 12 16.97C9.3 16.97 7.01 18.32 6.03 20.24H6.02C4.35 19.7 3.5 18.34 3.5 16.2V7.81C3.5 4.99 4.99 3.5 7.81 3.5H16.19C19.01 3.5 20.5 4.99 20.5 7.81V16.19Z"
                            fill="#ffffff"></path>
                        <path
                            d="M12.0019 8C10.0219 8 8.42188 9.6 8.42188 11.58C8.42188 13.56 10.0219 15.17 12.0019 15.17C13.9819 15.17 15.5819 13.56 15.5819 11.58C15.5819 9.6 13.9819 8 12.0019 8Z"
                            fill="#ffffff"></path>
                    </g>
                </svg>ADMIN<svg class="caretdown" width="64px" height="64px" viewBox="0 0 24 24" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                    <g id="SVGRepo_iconCarrier">
                        <path
                            d="M19 9L14 14.1599C13.7429 14.4323 13.4329 14.6493 13.089 14.7976C12.7451 14.9459 12.3745 15.0225 12 15.0225C11.6255 15.0225 11.2549 14.9459 10.9109 14.7976C10.567 14.6493 10.2571 14.4323 10 14.1599L5 9"
                            stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"
                            stroke-linejoin="round"></path>
                    </g>
                </svg></button>
                <div class="adminProfile" id="adminProfile">
                    <a href="adminsettings">Settings</a>
                    <a href="logout">Signout</a>
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
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
                                    <td>
                                        <div class="tloader"></div>
                                    </td>
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
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                        <td>
                                            <div class="tloader"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="namecall">
                            <input type="text" class="custom-call" placeholder="Enter name to queue">
                        </div>

                        <section class="actions">
                            <button id="call-button" onclick="transferRow()" class="btn call"><b>CALL</b></button>
                            <button id="recall-button" onclick="recall()" class="btn recall"><b>RECALL</b></button>
                            <button id="done-button" onclick="removeRow()" class="btn done"><b>DONE</b></button>
                        </section>

                </div>

                <!--notification dropdown-->
				<div class="notificationdropdown" id="notificationDropdown">
					<div class="notificationdropdown-header">
						<span>Notifications</span>
						<button id="markAllRead" class="text-blue-600 text-sm">Mark all as read</button>
					</div>
					<div class="notificationdropdown-item unread" data-id="1">
						<img src="https://via.placeholder.com/40" alt="Profile">
						<div>
							<div class="notification-text">You have a new message.</div>
							<div class="notification-time">2h ago</div>
						</div>
					</div>
					<div class="notificationdropdown-item unread" data-id="2">
						<img src="https://via.placeholder.com/40" alt="Profile">
						<div>
							<div class="notification-text">Your document has been approved.</div>
							<div class="notification-time">6h ago</div>
						</div>
					</div>
					<div class="notificationdropdown-item" data-id="3">
						<img src="https://via.placeholder.com/40" alt="Profile">
						<div>
							<div class="notification-text">Your password has been reset.</div>
							<div class="notification-time">1d ago</div>
						</div>
					</div>
				</div>

                <script>
                    // document.addEventListener("DOMContentLoaded", function () {
                    //     var dropdownButton = document.querySelector(".button-profile");
                    //     var staffProfile = document.getElementById("staffProfile");

                    //     staffProfile.style.display = "none";

                    //     dropdownButton.addEventListener("click", function () {
                    //         if (staffProfile.style.display === "block") {
                    //             staffProfile.style.display = "none";
                    //         } else {
                    //             staffProfile.style.display = "block";
                    //         }
                    //     });
                    // });
                    function updateTime() {
                        const now = new Date();
                        document.getElementById('date').textContent = now.toLocaleDateString();
                        document.getElementById('time').textContent = now.toLocaleTimeString();
                    }
                    updateTime();
                    setInterval(updateTime, 1000);

                    let counterList = document.getElementById("counter-list");
                    document.addEventListener("DOMContentLoaded", event => {
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

                        document.getElementById("priority-number-table").innerHTML = `
                           <tr>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                            </tr>
                        `;

                        document.getElementById("counter-access-table").innerHTML = `
                           <tr>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                                <td><div class="tloader"></div></td>
                                            </tr>
                        `;

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

                    //setInterval(counterChangeListOnChange, 5000); change to websocket

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

                        counterChangeListOnChange();
                    }

                    var ws2 = new WebSocket(wsUrl + window.location.host + "/queueupdate");

                    ws2.addEventListener("message", async (message) => {
                        await $.notify("loading new requests...", { color: "#fff", background: "#20D67B", delay: 1000 })
                        await CounterList(counterList.value, "QUEUE", '#priority-number-table');
                    })


                    var dropdown = document.getElementsByClassName("profilebutton");
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



 //notification
 const notificationIcon = document.getElementById('notifications');
 const notificationDropdown = document.getElementById('notificationDropdown');
 const notificationBadge = document.getElementById('notificationBadge');
 const markAllRead = document.getElementById('markAllRead');
 const unreadItems = document.querySelectorAll('.dropdown-item.unread');

 // Toggle dropdown visibility
 notifications.addEventListener('click', () => {
     notificationDropdown.classList.toggle('active');
 });

 // Close dropdown when clicking outside
 document.addEventListener('click', (event) => {
     if (!notifications.contains(event.target) && !notificationDropdown.contains(event.target)) {
         notificationDropdown.classList.remove('active');
     }
 });

 // Update badge count
 const updateBadgeCount = () => {
     const unreadCount = document.querySelectorAll('.dropdown-item.unread').length;
     notificationBadge.textContent = unreadCount;
     notificationBadge.style.display = unreadCount > 0 ? 'flex' : 'none';
 };

 // Mark all notifications as read
 markAllRead.addEventListener('click', () => {
     unreadItems.forEach(item => item.classList.remove('unread'));
     updateBadgeCount();
 });

 // Initialize badge count
 updateBadgeCount();


    //                 /* <summary>
    //                 CHARTJS.....	
    //                 </summary>*/
    //                 let hsNum, shsNum, Num;
    //                 let BSIT = 0;
    //                 let BEED = 0;
    //                 let DEVCOM = 0;
    //                 let BSTM = 0;
    //                 let BSHM = 0;
    //                 Promise.all([
    //                     fetch('/JsonStaffListAPI'),
    //                     fetch('/JsonStudentListAPI')
    //                     // fetch('http://localhost:8080/smartqueueweb/JsonInquiryListAPI')
    //                 ])
    //                     .then(responses => {
    //                         responses.forEach(response => {
    //                             if (!response.ok) {
    //                                 throw new Error('Network response problem' + response.statusText);
    //                             }
    //                         });
    //                         return Promise.all(responses.map(response => response.json()));
    //                     })
    //                     .then(data => {
    //                         staffNum = data[0].length; // Staff count
    //                         studentNum = data[1].length; // Student count
    //                         inquiryNum = 10; // Inquiry count

    //                         data[1].forEach(item => {
    //                             if (item.course.includes('BSIT')) {
    //                                 BSIT++;
    //                             }
    //                             if (item.course.includes('BEED')) {
    //                                 BEED++
    //                             }
    //                             if (item.course.includes('DEVCOM')) {
    //                                 DEVCOM++
    //                             }
    //                             if (item.course.includes('BSTM')) {
    //                                 BSTM++
    //                             }
    //                             if (item.course.includes('BSHM')) {
    //                                 BSHM++
    //                             }
    //                         });

    //                         document.getElementById("total-student").innerHTML = studentNum;
    //                         document.getElementById("total-staff").innerHTML = staffNum;
    //                         document.getElementById("total-transaction").innerHTML = inquiryNum;


    //                         //count 0 to n animation
    //                         $('.total-count').each(function () {
    //                             $(this).prop('Counter', 0).animate({
    //                                 Counter: $(this).text()
    //                             }, {
    //                                 duration: 2000,
    //                                 easing: 'swing',
    //                                 step: function (now) {
    //                                     $(this).text(Math.ceil(now));
    //                                 }
    //                             });
    //                         });

    //                         console.log(studentNum, staffNum, inquiryNum); // Use as needed

    //                         myChart(studentNum, staffNum, inquiryNum);
    //                         PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM)
    //                     })
    //                     .catch(error => {
    //                         console.error('There was a problem with the fetch operation:', error);
    //                     });

    //                 let delayed;
    //                 function myChart(studentNum, staffNum, inquiryNum) {
    //                     const ctx = document.querySelector('#myChart');


    //                     new Chart(ctx, {
    //                         type: 'bar',
    //                         data: {
    //                             labels: ['Students', 'Staff', 'Inquiry Today'],
    //                             datasets: [{
    //                                 labels: ['Students', 'Staff', 'Inquiry'],
    //                                 data: [studentNum, staffNum, inquiryNum],
    //                                 backgroundColor: [
    //                                     '#A0E9FF',
    //                                     '#2f5f98',
    //                                     '#2d8bba'
    //                                 ],
    //                                 borderWidth: 2
    //                             }]
    //                         },
    //                         options: {
    //                             animation: {
    //                                 onComplete: () => {
    //                                     delayed = true;
    //                                 },
    //                                 delay: (context) => {
    //                                     let delay = 0;
    //                                     if (context.type === 'data' && context.mode === 'default' && !delayed) {
    //                                         delay = context.dataIndex * 2000 + context.datasetIndex * 400;
    //                                     }
    //                                     return delay;
    //                                 },
    //                             },
    //                             scales: {
    //                                 y: {
    //                                     beginAtZero: true
    //                                 }
    //                             }
    //                         }
    //                     });
    //                 }

    //                 function PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM) {
    //                     const ctz = document.querySelector('#myPie');
    //                     let pattern;
    //                     new Chart(ctz, {
    //                         type: 'doughnut',
    //                         data: {
    //                             labels: ['BSIT', 'BEED', 'DEVCOM', 'BSTM', 'BSHM'],
    //                             datasets: [{
    //                                 data: [BSIT, BEED, DEVCOM, BSTM, BSHM],
    //                                 backgroundColor: [
    //                                     '#31356e',
    //                                     '#2f5f98',
    //                                     '#2d8bba',
    //                                     '#41b8d5',
    //                                     '#6ce5e8'
    //                                 ]
    //                             }],


    //                         },
    //                         options: {
    //                             animation: {
    //                                 onComplete: () => {
    //                                     delayed = true;
    //                                 },
    //                                 delay: (context) => {
    //                                     let delay = 0;
    //                                     if (context.type === 'data' && context.mode === 'default' && !delayed) {
    //                                         delay = context.dataIndex * 300 + context.datasetIndex * 200;
    //                                     }
    //                                     return delay;
    //                                 },
    //                             }
    //                         }
    //                     });
    //                 }

    //                 var btns = document.getElementsByClassName("dropdown-btn");
    //                 var dropdowns = document.getElementsByClassName("dropdown-dashboard");

    //                 for (var i = 0; i < btns.length; i++) {
    //                     btns[i].addEventListener("click", function () {
    //                         // Remove "active" class from all buttons
    //                         for (var j = 0; j < btns.length; j++) {
    //                             btns[j].classList.remove("active");
    //                         }

    //                         // Hide all dropdowns
    //                         for (var k = 0; k < dropdowns.length; k++) {
    //                             dropdowns[k].style.display = "none";
    //                         }

    //                         // Add "active" class to the clicked button
    //                         this.classList.add("active");

    //                         // Show the related dropdown
    //                         var dropdownContent = this.nextElementSibling;
    //                         if (dropdownContent && dropdownContent.classList.contains("dropdown-dashboard")) {
    //                             dropdownContent.style.display = "block";
    //                         }
    //                     });
    //                 }

    //                 // Optional: Hide dropdowns and remove active states when clicking outside the navbar
    //                 document.addEventListener("click", function (event) {
    //                     var isClickInsideNavbar = event.target.closest(".navbar");
    //                     if (!isClickInsideNavbar) {
    //                         // Remove active class from all buttons
    //                         for (var j = 0; j < btns.length; j++) {
    //                             btns[j].classList.remove("active");
    //                         }

    //                         // Hide all dropdowns
    //                         for (var k = 0; k < dropdowns.length; k++) {
    //                             dropdowns[k].style.display = "none";
    //                         }
    //                     }
    //                 });

    //                 async function AddInfoError() {
    //                     await $.notify("Please fill out the required field/fields", { color: "#fff", background: "#D44950", delay: 1000 })
    //                 }

    //                 function emptyFieldError(title, addOrDelete) {
    //                     //empty fields in General - Program
    //                     if (title == (addOrDelete + ' Program for General') && $('#program').val().trim() === '') {
    //                         AddInfoError();
    //                         return true;
    //                     }

    //                     //empty fields in General - Purpose
    //                     if (title == (addOrDelete + ' Purpose for General') && $('#program').val().trim() === '') {
    //                         AddInfoError();
    //                         return true;
    //                     }

    //                     //empty fields in Records - Purpose
    //                     if (title == (addOrDelete + ' Document for Records') && ($('#program').val().trim() === '' || $('#amount').val().trim() === '')) {
    //                         AddInfoError();
    //                         return true;
    //                     }

    //                     //empty fields in Archiving - Purpose
    //                     if (title == (addOrDelete + ' Purpose for Archiving') && $('#program').val().trim() === '') {
    //                         AddInfoError();
    //                         return true;
    //                     }
    //                 }

    //                 function updateAttribute(id, programPurpose, amount) {
    //                     return [id, programPurpose, amount];
    //                 }

    //                 // Show Modal
    //                 function ModalInfo(title, context, formId, serviceType, method, updateAttribute) {

    //                     let recordContent = ``;

    //                     if (title == 'Add Document for Records') {
    //                         recordContent = `
    //     <label for="Amount">Amount</label>
    //      <input type="number" id="amount" name="Amount" placeholder="Enter amount">
    // `;
    //                     }

    //                     if (title == 'Update Document for Records') {
    //                         recordContent = `
    //     <label for="Amount">Amount</label>
    //      <input type="number" id="amount" name="Amount" value="`+ updateAttribute[2] + `" placeholder="Enter amount">
    // `;
    //                     }
    //                     if (title == 'Delete Document for Records') {
    //                         recordContent = `
    //     <label for="Amount">Amount</label>
    //      <input type="number" id="amount" name="Amount" value="`+ updateAttribute[2] + `" placeholder="Enter amount" disabled>
    // `;
    //                     }


    //                     //add contents
    //                     let addContents =
    //                         `
    //     <form id="`+ formId + `">
    //     <label for="servicetype">Service Type</label>
    //     <input type="text" id="servicetype" name="servicetype" value="`+ serviceType + `" disabled>
    //     <label for="`+ context + `">` + context + `</label>
    //     <input type="text" id="program" name="`+ context + `" placeholder="Enter ` + context + `">
    //     `+ recordContent + `
    //     </form>
    //     `;

    //                     //update contents
    //                     let updatecontents =
    //                         `
    //     <form id="`+ formId + `">
    //     <label for="servicetype">Id No.</label>
    //     <input type="text" id="servicetype" name="idNo" value="`+ updateAttribute[0] + `" disabled>
    //     <label for="`+ context + `">` + context + `</label>
    //     <input type="text" id="program" name="`+ context + `" value="` + updateAttribute[1] + `" placeholder="Enter ` + context + `">
    //     `+ recordContent + `
    //     </form>
    //     `;

    //                     //delete contents
    //                     let deletecontents =
    //                         `
    //      <form id="`+ formId + `">
    //      <label for="servicetype">Id No.</label>
    //      <input type="text" id="servicetype" name="idNo" value="`+ updateAttribute[0] + `" disabled>
    //      <label for="`+ context + `">` + context + `</label>
    //      <input type="text" id="program" name="`+ context + `" value="` + updateAttribute[1] + `" placeholder="Enter ` + context + `" disabled>
    //      `+ recordContent + `
    //      </form>
    //      `;

    //                     if (title.includes('Add'))
    //                         HttpRequest(addContents, title, formId, method, 'btn-green', 'Add', 'AddServices_Servlet');

    //                     if (title.includes('Update'))
    //                         HttpRequest(updatecontents, title, formId, method, 'btn-blue', 'Update', 'UpdateService_Servlet');

    //                     if (title.includes('Delete')) {
    //                         HttpRequest(deletecontents, title, formId, method, 'btn-red', 'Delete', 'DeleteServices_Servlet');
    //                     }

    //                 }
    //                 function HttpRequest(contents, title, formId, method, btnClass, text, url) {
    //                     $.confirm({
    //                         type: 'blue',
    //                         boxWidth: '30%',
    //                         useBootstrap: false,
    //                         title: title,
    //                         content: contents,
    //                         buttons: {
    //                             formField: {
    //                                 text: text,
    //                                 btnClass: btnClass,
    //                                 action: async function () {
    //                                     let form = $('#' + formId);

    //                                     if (emptyFieldError(title, 'Add'))
    //                                         return false;

    //                                     if (emptyFieldError(title, 'Update'))
    //                                         return false;

    //                                     if (emptyFieldError(title, 'Delete'))
    //                                         return false;


    //                                     //set disable to true before sending request
    //                                     $('#servicetype').prop('disabled', false);


    //                                     await $.ajax({
    //                                         url: url,
    //                                         method: method,
    //                                         data: form.serialize(),
    //                                         beforeSend: function () {
    //                                             $.notify('processing request', { color: "#fff", background: "#20D67B", delay: 1000 })
    //                                         },
    //                                         success: function (response) {
    //                                             $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 })
    //                                             updateRecordsGeneralArchivingDatas()
    //                                         },
    //                                         error: function (xhr, status, error) {
    //                                             $.notify("an error occured " + error, { color: "#fff", background: "#D44950", delay: 1000 })
    //                                         }
    //                                     });
    //                                 }
    //                             },
    //                             Close: function () {
    //                                 //do nothing.
    //                             }
    //                         }
    //                     });
    //                 }

    //                 function DeleteInfo(idNumber) {
    //                     $.confirm({
    //                         title: 'Delete id no?' + idNumber,
    //                         content: 'This dialog will automatically trigger \'cancel\' in 6 seconds if you don\'t respond.',
    //                         autoClose: 'cancelAction|8000',
    //                         buttons: {
    //                             deleteUser: {
    //                                 text: 'delete user',
    //                                 action: function () {
    //                                     $.alert('Deleted the user!');
    //                                 }
    //                             },
    //                             cancelAction: function () {
    //                                 $.alert('action is canceled');
    //                             }
    //                         }
    //                     });
    //                 }

                   


    //                 //fetch data for general records and archiving
    //                 function updateRecordsGeneralArchivingDatas() {
    //                     generalitemId = 1;
    //                     generalitempurposeId = 1;
    //                     recordsitemId = 1;
    //                     archivingItemId = 1;

    //                     $.ajax({
    //                         url: '/JsonServiceListAPI',
    //                         method: 'GET',
    //                         data: {},
    //                         dataType: 'json',
    //                         success: function (data) {
    //                             const tableGeneralProgramBody = $('#general-program-tablelist');
    //                             const tableGeneralPurposeBody = $('#general-purpose-tablelist');
    //                             const tableRecordsPurposeBody = $('#records-purpose-tablelist');
    //                             const tableArchivePurposeBody = $('#archiving-purpose-tablelist');

    //                             tableGeneralProgramBody.empty();
    //                             tableGeneralPurposeBody.empty();
    //                             tableRecordsPurposeBody.empty();
    //                             tableArchivePurposeBody.empty();

    //                             // Populate table with new data
    //                             data.forEach(item => {

    //                                 if (item.course !== undefined && item.serviceType == 'GENERAL') {
    //                                     tableGeneralProgramBody.append(`
    //                 <tr>
    //                         <td>`+ (generalitemId++) + `</td>
    //                         <td>`+ item.course + `</td>
    //                         <td>
    //                         <button class="update-btn"onclick="ModalInfo('Update Program for General', 'Program', 'GeneralProgramForm', 'general', 'GET', updateAttribute(`+ item.id + `, '` + item.course + `', ` + item.amount + `))">Update</button>
    //                         <button class="delete-btn" onclick="ModalInfo('Delete Program for General', 'Program', 'GeneralProgramForm', 'general', 'GET', updateAttribute(`+ item.id + `, '` + item.course + `', ` + item.amount + `))">Delete</button>
    //                         </td>
    //                     </tr>
    //                `);
    //                                 }
    //                                 else if (item.purpose !== undefined && item.serviceType == 'GENERAL') {
    //                                     tableGeneralPurposeBody.append(`
    //                     <tr>
    //                         <td>`+ (generalitempurposeId++) + `</td>
    //                         <td>`+ item.purpose + `</td>
    //                         <td><button class="update-btn" onclick="ModalInfo('Update Purpose for General', 'Purpose', 'GeneralPurposeForm', 'general', 'GET', updateAttribute(`+ item.id + `, '` + item.purpose + `', ` + item.amount + `))">Update</button>
    //                             <button class="delete-btn" onclick="ModalInfo('Delete Purpose for General', 'Purpose', 'GeneralPurposeForm', 'general', 'GET', updateAttribute(`+ item.id + `, '` + item.purpose + `', ` + item.amount + `))">Delete</button>
    //                         </td>
    //                     </tr>
    //             `);
    //                                 }

    //                                 if (item.purpose !== undefined && item.serviceType == 'RECORDS') {
    //                                     tableRecordsPurposeBody.append(`
    //                 <tr>
    //                     <td>`+ (recordsitemId++) + `</td>
    //                         <td>`+ item.purpose + `</td>
    //                         <td><button class="update-btn" onclick="ModalInfo('Update Document for Records', 'Document', 'RecordsPurposeForm', 'records', 'GET', updateAttribute(`+ item.id + `, '` + item.purpose + `', ` + item.amount + `))">Update</button>
    //                             <button class="delete-btn" onclick="ModalInfo('Delete Document for Records', 'Document', 'RecordsPurposeForm', 'records', 'GET', updateAttribute(`+ item.id + `, '` + item.purpose + `', ` + item.amount + `))">Delete</button>
    //                         </td>
    //                     </tr>
    //             `);
    //                                 }
    //                                 else if (item.program === undefined && item.serviceType == 'ARCHIVING') {
    //                                     tableArchivePurposeBody.append(`
    //                 <tr>
    //                         <td>`+ (archivingItemId++) + `</td>
    //                         <td>`+ item.purpose + `</td>
    //                         <td><button class="update-btn" onclick="ModalInfo('Update Purpose for Archiving', 'Purpose', 'ArchivingPurposeForm', 'archiving', 'GET', updateAttribute(`+ item.id + `, '` + item.purpose + `', ` + item.amount + `))">Update</button>
    //                             <button class="delete-btn" onclick="ModalInfo('Delete Purpose for Archiving', 'Purpose', 'ArchivingPurposeForm', 'archiving', 'GET', updateAttribute(`+ item.id + `, '` + item.purpose + `', ` + item.amount + `))">Delete</button>
    //                         </td>
    //                     </tr>
    //             `);
    //                                 }

    //                             });
    //                         },
    //                         error: function (error) {
    //                             console.error('Error fetching data:', error);
    //                         }
    //                     });
    //                 }
    //                 updateRecordsGeneralArchivingDatas();
                </script>

                <div class="load-wrapper">
                    <div class="main-loader">
                        <div class="box-loader">
                        </div>
                    </div>
                </div>
</body>

</html>
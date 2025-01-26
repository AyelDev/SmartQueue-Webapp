<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff | Setting</title>
</head>
<style>
    @import url('../css/fonts.css');

    * {
        margin: 0;
        padding: 0;
        font-family: "Roboto Condensed", sans-serif;
    }
    body {
        background-color: #fff;
        width: 100%;
        height: 100%;
        overflow: hidden;
    }
    .container {
        width: 100%;
        height: 100%;
        background-color: #fff;
        position: absolute;
        top: 0;
    }
    .left-navigation {
        width: 20%;
        height: 100%;
        background-color: #F2EFE7;
        padding: 20px;
        border-right: 1px solid #ccc;
        position: relative;
    }
    .back-button {
        position: absolute;
        top: 10px;
        left: 10px;
        cursor: pointer;
        font-size: 18px;
    }
    .left-navigation h2 {
        font-size: 20px;
        margin-top: 40px;
        text-align: center;
        margin-bottom: 20px;
    }
    .profile-display {
        text-align: center;
        margin-bottom: 20px;
        margin-left: 2%;
    }
    .profile-display img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        display: block;
        margin: 0 auto 10px;
        border: 2px solid #ccc;
    }
    .profile-display p {
        margin: 0;
        font-weight: bold;
    }
    .left-navigation ul {
        list-style: none;
        padding: 0;
    }
    .left-navigation ul li {
        margin-bottom: 15%;
        cursor: pointer;
        margin-left: 30%;
    }
    .left-navigation ul li.active {
        font-weight: bold;
        color: #007bff;
    }
    .right-navigation {
        width: 70%;
        height: 100%;
        float: right;
        top: 0;
        background-color: #fff;
        flex-grow: 1;
        padding: 20px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group-section {
        width: 60%;
        height: 70%;
        background-color: #fff;
        justify-content: center;
        align-content: center;
        margin-left: 20%;
        margin-top: 5%;
    }
    .form-group-section h3 {
        margin-left: 45%;
    }
    .change-photo {
        margin-left: 43%;
    }
    .upload {
        margin-left: 37%;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input {
        width: 70%;
        padding: 8px;
    }
    .password {
        margin-left: 35%;
    }
    .profile-picture {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        display: block;
        margin: 10px 0;
        border: 2px solid #ccc;
        justify-content: center;
        align-items: center;
        margin-left: 42%;
    }
    .button-group {
        margin-top: 20px;
        justify-content: center;
        align-items: center;
    }
    .button-group button {
        padding: 10px 15px;
        margin-right: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .button-group button.save {
        background-color: #007bff;
        color: white;
    }
    .button-group button.cancel {
        background-color: #f4f4f4;
        color: black;
    }
    .edit-link {
        color: #007bff;
        text-decoration: underline;
        cursor: pointer;
        font-size: 14px;
    }
    .change-link {
        color: #007bff;
        text-decoration: underline;
        cursor: pointer;
    }
    .edit-form {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .navigation-section {
        position: fixed;
        top: 0;
        left: -200px;
        width: 200px;
        height: 100%;
        background-color: #1E91D0;
        color: white;
        transition: left 0.3s ease;
        z-index: 1001;
        padding: 1rem;
    }
    .navigation-section.active {
        left: 0;
    }
    .navigation-section .top-lnav {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 2rem;
    }
    .cec {
        width: 50%;
        max-width: 100%;
        object-fit: contain;
        margin-top: 15px;
        margin-bottom: 5px;
    }
    .navigation-section .close-btn {
        position: absolute;
        top: 1rem;
        right: 2rem;
        background: none;
        color: white;
        border: none;
        font-size: 1.5rem;
        cursor: pointer;
    }
    .bottom-lnav {
        width: 100%;
        height: 80%;
        background-color: transparent;
        text-align: center;
        padding-top: 4px;
    }
    .bottom-lnav a {
        display: block;
        margin: 1rem 0;
        color: white;
        text-decoration: none;
        font-size: 1.2rem;
        transition: color 0.3s ease;
        margin-top: 40px;
        margin-left: 10%;
        text-align: start;
    }
    .bottom-lnav a:hover {
        padding: 15px 20px;
        width: 12.8vw;
        background-color: white;
        position: relative;
        margin-left: 2px;
        color: black;
        border-top-left-radius: 15px;
        border-bottom-left-radius: 15px;
    }
    .bottom-lnav img {
        width: 20px;
        height: 20px;
        object-fit: contain;
        margin-right: 10px;
        filter: invert(1);
    }
    .bottom-lnav a:hover img {
        filter: brightness(0) saturate(100%) hue-rotate(200deg); /*blue color*/
        transform: scale(1.2);
    }

    .menu-btn {
        background: none;
        color: black;
        border: none;
        cursor: pointer;
        font-size: 2rem;
    }

    /* menu button (3-lines) */
    .menu-btn span {
        display: block;
        width: 15px;
        height: 2px;
        background-color: black;
        margin: 2px 0;
        margin-left: 1rem;
    }
    
</style>
<body>
    <div class="container">
        <div class="navigation-section" id="leftnav">
            <button class="close-btn" id="close-btn">&times;</button>
            <div class="top-lnav">
                <img src="./images/logo.png" class="cec" alt="CEC Logo">
                <p class="title"><strong>Cebu Eastern College</strong></p>
            </div>
            <div class="bottom-lnav">
                <b><a href="staffpage"><img src="./images/dashboard.png" alt="">Dashboard</a></b>
                <b><a href="userwindow"><img src="./images/display.png" alt="">User Window</a></b>
                <b><a href="counterwindow"><img src="./images/counter.png" alt="">Counter Window</a></b>
                <b><a href="addstudent"><img src="./images/studentlist.png" alt="">Student List</a></b>
                <b><a href="entertainment"><img src="./images/entertainment.png" alt="">Entertainment</a></b>
    </div>
        </div>

        <div class="right-navigation" id="content-area">
            <!-- Dynamic content will be displayed here -->
        </div>

        <div class="left-navigation">
            <button class="menu-btn" id="menu-btn">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <h2>Settings</h2>
            <div class="profile-display">
                <img id="left-profile-picture" src="" alt="">
                <p id="left-profile-name">Irish Cabanero</p>
            </div>
            <ul id="menu">
                <li id="profile-tab" class="active" onclick="renderContent('profile')">Profile</li>
                <li id="address-tab" onclick="renderContent('address')">Address</li>
                <li id="password-tab" onclick="renderContent('password')">Change Password</li>
            </ul>
        </div>
    </div>

    <script>
        const leftnav = document.getElementById('leftnav');
        const menuBtn = document.getElementById('menu-btn');
        const closeBtn = document.getElementById('close-btn');
        const contentArea = document.getElementById('content-area');
        const menu = document.getElementById('menu');

        const tabs = {
            profile: `
            <div class="form-group-section">
                <h3>Profile</h3>
                <div class="form-group">
                    <img id="profile-picture" class="profile-picture" src="" alt="">
                    <label for="photo" class="change-photo">Change Photo</label>
                    <input type="file" id="photo" accept="image/*" onchange="previewImage(event)" class="upload">
                    <span id="cancel-upload" class="change-link" onclick="cancelUpload()" style="display: none;">Cancel</span>
                    <button id="save-photo" class="save" onclick="savePhoto()" style="display: none;">Save</button>
                </div>
                <div class="form-group edit-form">
                    <div>
                        <label for="username">Username</label>
                        <span id="username-display">irish_cabanero02</span>
                    </div>
                    <div><span class="edit-link" onclick="editField('username')">Edit</span></div>
                </div>
                <div class="form-group edit-form">
                    <div>
                        <label for="name">Name</label>
                        <span id="name-display">Irish Cabanero</span>
                    </div>
                    <div><span class="edit-link" onclick="editField('name')">Edit</span></div>
                </div>
                <div class="form-group edit-form">
                    <div>
                        <label for="email">Email</label>
                        <span id="email-display">irishcabanero@gmail.com</span>
                    </div>
                    <div><span class="change-link" onclick="editField('email')">Change</span></div>
                </div>
                <div class="form-group edit-form">
                    <div>
                        <label for="phone">Phone</label>
                        <span id="phone-display">09638741477</span>
                    </div>
                    <div><span class="change-link" onclick="editField('phone')">Change</span></div>
                </div>
            </div>
            `,
            address: `
            <div class="form-group-section">
                <h3>Address</h3>
                <div id="address-view">
                    <p id="address-text">Mambaling Cebu City</p>
                    <span class="edit-link" onclick="editAddress()">Edit</span>
                </div>
                <div id="address-edit" style="display: none;">
                    <div class="form-group">
                        <label for="address-input"></label>
                        <input type="text" id="address-input" value="Mambaling Cebu City">
                    </div>
                    <div class="button-group">
                        <button class="save" onclick="saveAddress()">Save</button>
                        <button class="cancel" onclick="cancelEditAddress()">Cancel</button>
                    </div>
                </div>
            </div>
            `,
            password: `
            <div class="form-group-section">
                <h3>Change Password</h3>
                <div class="form-group">
                    <label for="current-password" class="label-password">Current Password</label>
                    <input type="password" id="current-password" class="password">
                </div>
                <div class="form-group">
                    <label for="new-password" class="label-password">Enter New Password</label>
                    <input type="password" id="new-password" class="password">
                </div>
                <div class="form-group">
                    <label for="confirm-password" class="label-password">Confirm New Password</label>
                    <input type="password" id="confirm-password" class="password">
                </div>
                <div class="button-group">
                    <button class="save" onclick="savePassword()">Save</button>
                    <button class="cancel">Cancel</button>
                </div>
            </div>
            `
        };

        // Left navigation toggle
        menuBtn.addEventListener('click', () => {
            leftnav.classList.add('active');
        });

        closeBtn.addEventListener('click', () => {
            leftnav.classList.remove('active');
        });

        function renderContent(tab) {
            document.querySelectorAll('#menu li').forEach(li => li.classList.remove('active'));
            document.getElementById(`${tab}-tab`).classList.add('active');
            contentArea.innerHTML = tabs[tab];
        }

        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('profile-picture').src = e.target.result;
                    document.getElementById('cancel-upload').style.display = 'inline';
                    document.getElementById('save-photo').style.display = 'inline';
                };
                reader.readAsDataURL(file);
            }
        }

        function cancelUpload() {
            document.getElementById('profile-picture').src = '';
            document.getElementById('cancel-upload').style.display = 'none';
            document.getElementById('save-photo').style.display = 'none';
        }

        function savePhoto() {
            const newPhoto = document.getElementById('profile-picture').src;
            document.getElementById('left-profile-picture').src = newPhoto;
            document.getElementById('cancel-upload').style.display = 'none';
            document.getElementById('save-photo').style.display = 'none';
        }

        function saveProfile() {
            const name = document.getElementById('name-display').textContent;
            document.getElementById('left-profile-name').textContent = name;
            alert('Profile updated successfully!');
        }

        function editAddress() {
            document.getElementById('address-view').style.display = 'none';
            document.getElementById('address-edit').style.display = 'block';
        }

        function cancelEditAddress() {
            document.getElementById('address-view').style.display = 'block';
            document.getElementById('address-edit').style.display = 'none';
        }

        function saveAddress() {
            const addressInput = document.getElementById('address-input').value;
            document.getElementById('address-text').textContent = addressInput;
            document.getElementById('address-view').style.display = 'block';
            document.getElementById('address-edit').style.display = 'none';
            alert('Address updated successfully!');
        }

        function editField(field) {
            const fieldDisplay = document.getElementById(`${field}-display`);
            const currentValue = fieldDisplay.textContent;
            fieldDisplay.innerHTML = `<input type="text" id="${field}-input" value="${currentValue}">`;
            const editLinks = document.querySelectorAll('.edit-link, .change-link');
            editLinks.forEach(link => link.style.display = 'none');
            const saveCancelBtns = document.createElement('div');
            saveCancelBtns.innerHTML = `
                <button class="save" onclick="saveField('${field}')">Save</button>
                <button class="cancel" onclick="cancelField('${field}')">Cancel</button>
            `;
            fieldDisplay.appendChild(saveCancelBtns);
        }

        function cancelField(field) {
            const fieldDisplay = document.getElementById(`${field}-display`);
            fieldDisplay.innerHTML = document.getElementById(`${field}-input`).value;
            document.querySelectorAll('.edit-link, .change-link').forEach(link => link.style.display = 'inline');
        }

        function saveField(field) {
            const inputValue = document.getElementById(`${field}-input`).value;
            const fieldDisplay = document.getElementById(`${field}-display`);
            fieldDisplay.innerHTML = inputValue;
            alert(`${field} updated successfully!`);
            document.querySelectorAll('.edit-link, .change-link').forEach(link => link.style.display = 'inline');
        }

        function savePassword() {
            const currentPassword = document.getElementById('current-password').value;
            const newPassword = document.getElementById('new-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;

            if (newPassword !== confirmPassword) {
                alert('New passwords do not match!');
                return;
            }

            alert('Password updated successfully!');
        }

        // Initialize default tab
        renderContent('profile');
    </script>
</body>
</html>

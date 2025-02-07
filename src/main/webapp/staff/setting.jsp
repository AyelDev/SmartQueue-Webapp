<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${empty sessionScope.sessionStaff && empty sessionScope.sessionAdmin.getUsername()}">
            <c:redirect url="/" />
        </c:if>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff | Settings</title>
    <link rel="stylesheet" href="../css/prettify.css">
    <link rel="stylesheet" href="../css/notify.css">
    <link rel="stylesheet" href="../css/jquery-confirm.min.css">
    <link rel="stylesheet" href="../css/loader.css">
    <link rel="stylesheet" href="../css/setting.css">
    <script type="text/javascript" src="https://cdn.lordicon.com/lordicon.js"></script>
			<script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
			<script type="text/javascript" src="../scripts/jquery-confirm.min.js"></script>
			<script type="text/javascript" src="../scripts/notify.js"></script>
			<script type="text/javascript" src="../scripts/prettify.js"></script>
			<script type="text/javascript" src="../scripts/ping.js"></script>
			<script type="text/javascript" src="../scripts/fadetransition.js"></script>
			<script type="text/javascript" src="../scripts/chart.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="navigation-section" id="leftnav">
            <div class="top-lnav">
                <img src="./images/logo.png" class="cec" alt="CEC Logo">
                <p class="title"><strong>Cebu Eastern College</strong></p>
            </div>
            <div class="bottom-lnav">
                <b><a href="staffdashboard"><img src="./images/dashboard.png"
                            alt="">Dashboard</a></b>
                <b><a href="userwindow"><img src="./images/display.png" alt="">User
                        Window</a></b>
                <b><a href="counterwindow"><img src="./images/counter.png" alt="">Counter
                        Window</a></b>
                <b><a href="addstudent"><img src="./images/studentlist.png" alt="">Student
                        List</a></b>
                <b><a href="entertainment"><img src="./images/entertainment.png"
                            alt="">Entertainment</a></b>
            </div>
        </div>

        <div class="menu-section">
            <div class="left-navigation">
                <h2>Settings</h2>
                <div class="profile-display">
                    <img id="left-profile-picture" src="" alt="">
                    <p id="left-profile-name">
                        <c:out value="${sessionScope.sessionStaff.firstname}"/> 
                        <c:out value="${sessionScope.sessionStaff.lastname}"/> 
                    </p>
                </div>
                <ul id="menu">
                    <li id="profile-tab" class="active" onclick="renderContent('profile')">Profile</li>
                    <li id="password-tab" onclick="renderContent('password')">Change Password</li>
                </ul>
            </div>
            <div class="right-navigation" id="content-area">
                <!-- Dynamic content will be displayed here -->
            </div>
        </div>
    </div>

    <div class="load-wrapper">
        <div class="main-loader">
            <div class="box-loader">
            </div>
        </div>
    </div>

    <script>
        const contentArea = document.getElementById('content-area');
        const menu = document.getElementById('menu');

        const tabs = {
            profile: `
             <div class="form-group">
                <div class="profile-section">
                <label for="photo">Profile Photo</label>
                <img id="photo-preview" src="" alt="Profile Preview" style="display: none; width: 100px; height: 100px; border-radius: 50%; margin-top: 10px; margin-right: 40%">
                <input type="file" id="photo" accept="image/*" onchange="previewImage(event)" style="margin-right: 40%">
                <div class="save-cancel-btn">
                    <button id="save-photo" style="display: none;" onclick="savePhoto()" class="save">Save</button>
                    <button id="cancel-upload" style="display: none;" onclick="cancelUpload()" class="cancel">Cancel</button>
                </div>
                </div>
            </div>
         
            <div class="form-group">
                <label for="username">Username</label>
                <div class="edit-form">
                    <span id="username-display"><c:out value="${sessionScope.sessionStaff.username}"/></span>
                    <span class="edit-link" onclick="editField('username')">Edit</span>
                </div>
            </div>
         
            <div class="form-group">
                <label for="name">Name</label>
                <div class="edit-form">
                    <span id="name-display">
                        <c:out value="${sessionScope.sessionStaff.firstname}"/>
                         <c:out value="${sessionScope.sessionStaff.lastname}"/>
                        </span>
                    <span class="edit-link" onclick="editField('name')">Edit</span>
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <div class="edit-form">
                    <span id="email-display"><c:out value="${sessionScope.sessionStaff.email}"/></span>
                    <span class="edit-link" onclick="editField('email')">Change</span>
                </div>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <div class="edit-form">
                    <span id="phone-display"><c:out value="${sessionScope.sessionStaff.contactNumber}"/></span>
                    <span class="edit-link" onclick="editField('phone')">Change</span>
                </div>
            </div>
            `,
            password: `
            <div class="form-group">
                <label for="current-password" class="passtext">Old Password</label>
                <input type="password" id="current-password" value='<c:out value="${sessionScope.sessionStaff.contactNumber}"/>'>
            </div>
            <div class="form-group">
                <label for="new-password" class="passtext">New Password</label>
                <input type="password" id="new-password">
            </div>
            <div class="form-group">
                <label for="confirm-password" class="passtext">Confirm New Password</label>
                <input type="password" id="confirm-password">
            </div>
            <div class="button-group">
                <button class="save" onclick="savePassword()">Save</button>
                <button class="cancel" onclick="cancelPassword()">Cancel</button>
            </div>
            `
        };

        function renderContent(tab) {
            document.querySelectorAll('#menu li').forEach(li => li.classList.remove('active'));
            document.getElementById(tab+`-tab`).classList.add('active');
            contentArea.innerHTML = tabs[tab];
        }

        function editField(field) {
            const fieldDisplay = document.getElementById(field+`-display`);
            const currentValue = fieldDisplay.textContent;
            const inputField = `<input type="text" id="`+field+`-input" value="`+currentValue+`">`;

            fieldDisplay.innerHTML = inputField;

            const buttonGroup = `
                <div class="save-cancel-buttons">
                    <button class="save" onclick="saveField('`+field+`')">Save</button>
                    <button class="cancel" onclick="cancelField('`+field+`', '`+currentValue+`')">Cancel</button>
                </div>
            `;
            
            fieldDisplay.innerHTML += buttonGroup;
        }

        function saveField(field) {
            const newValue = document.getElementById(field+`-input`).value;
            document.getElementById(field+`-display`).textContent = newValue;
            if (field === 'name') {
                document.getElementById('left-profile-name').textContent = newValue;
            }
        }

        function cancelField(field, originalValue) {
            document.getElementById(field+`-display`).textContent = originalValue;
        }

        function previewImage(event) {
            const file = event.target.files[0];
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('photo-preview').src = e.target.result;
                document.getElementById('photo-preview').style.display = 'block';
                document.getElementById('save-photo').style.display = 'block';
                document.getElementById('cancel-upload').style.display = 'block';
            };
            reader.readAsDataURL(file);
        }

        function savePhoto() {
    // Get the uploaded image's source
    const photoPreview = document.getElementById('photo-preview').src;
    
    // Update the left navigation profile picture
    document.getElementById('left-profile-picture').src = photoPreview;
    
    // Simulate a successful save
    alert('Do you want to saved Profile photo?');
    
    // Hide save/cancel buttons after saving
    document.getElementById('save-photo').style.display = 'none';
    document.getElementById('cancel-upload').style.display = 'none';
}

        function cancelUpload() {
            document.getElementById('photo').value = '';
            document.getElementById('photo-preview').style.display = 'none';
            document.getElementById('save-photo').style.display = 'none';
            document.getElementById('cancel-upload').style.display = 'none';
        }

        window.jstlData = {
            staffId: '<c:out value="${sessionScope.sessionStaff.staffID}"/>',
            username: '<c:out value="${sessionScope.sessionStaff.username}"/>',
            password: '<c:out value="${sessionScope.sessionStaff.password}"/>',
            firstname: '<c:out value="${sessionScope.sessionStaff.firstname}"/>',
            lastname: '<c:out value="${sessionScope.sessionStaff.lastname}"/>',
            email: '<c:out value="${sessionScope.sessionStaff.email}"/>',
            contactnum: '<c:out value="${sessionScope.sessionStaff.contactNumber}"/>',
            islocked: '<c:out value="${sessionScope.sessionStaff.isLocked}"/>',
            pin: '<c:out value="${sessionScope.sessionStaff.pin}"/>',
            requestId: '<c:out value="${sessionScope.sessionStaff.requestId}"/>',
            requestPassCreated: '<c:out value="${sessionScope.sessionStaff.requestedPassCreated}"/>',
            profilePic: '<c:out value="${sessionScope.sessionStaff.profilePicture}"/>'
        };

        let newPassword = '';
        let confirmPassword = '';
        function savePassword() {
            // Handle password save logic
            newPassword = document.querySelector("#new-password");
            confirmPassword = document.querySelector("#confirm-password");
            
            if(newPassword.value !== confirmPassword.value){
                alert("confirm password does not matched");
                return false;
            }

            updateStaffRequest(window.jstlData.staffId,
                            window.jstlData.firstname,
                            window.jstlData.lastname,
                            window.jstlData.email,
                            window.jstlData.contactnum,
                            window.jstlData.username,
                            newPassword.value,
                            window.jstlData.islocked);
        
        }

        function cancelPassword() {
            // Handle cancel logic
            alert('Password change cancelled!');
        }

        function updateStaffRequest(idNo, firstname, lastname, email, contactno, username, password, isLocked){
            $.ajax({
                    url: 'UpdateStaff_Servlet?idNo=' + idNo + '&firstname=' + firstname + '&lastname=' + lastname + '&email=' + email + '&contactno=' + contactno + '&username=' + username + '&password=' + password + '&islocked=' + isLocked, // Replace with your endpoint
                    type: 'PUT', // Send the ID as data
                    success: function (response) {      
                        $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 });       
                    },
                    error: function (xhr) {
                        $.notify(xhr.statusText,{ color: "#fff", background: "#D44950", delay: 1000 });
                    }
            });
        }

        // Initialize with profile content
        renderContent('profile');
    </script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff | Settings</title>
    <link rel="stylesheet" href="./css/loader.css"> 
    <link rel="stylesheet" href="../css/setting.css">
</head>

<body>
    <div class="container">
        <div class="navigation-section" id="leftnav">
            <div class="top-lnav">
                <img src="logo.png" class="cec" alt="CEC Logo">
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
                    <p id="left-profile-name">Irish Cabanero</p>
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
                    <span id="username-display">irish_cabanero02</span>
                    <span class="edit-link" onclick="editField('username')">Edit</span>
                </div>
            </div>
         
            <div class="form-group">
                <label for="name">Name</label>
                <div class="edit-form">
                    <span id="name-display">Irish Cabanero</span>
                    <span class="edit-link" onclick="editField('name')">Edit</span>
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <div class="edit-form">
                    <span id="email-display">irishcabanero@gmail.com</span>
                    <span class="edit-link" onclick="editField('email')">Change</span>
                </div>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <div class="edit-form">
                    <span id="phone-display">09638741477</span>
                    <span class="edit-link" onclick="editField('phone')">Change</span>
                </div>
            </div>
            `,
            password: `
            <div class="form-group">
                <label for="current-password" class="passtext">Old Password</label>
                <input type="password" id="current-password">
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
            document.getElementById(`${tab}-tab`).classList.add('active');
            contentArea.innerHTML = tabs[tab];
        }

        function editField(field) {
            const fieldDisplay = document.getElementById(`${field}-display`);
            const currentValue = fieldDisplay.textContent;
            const inputField = `<input type="text" id="${field}-input" value="${currentValue}">`;

            fieldDisplay.innerHTML = inputField;

            const buttonGroup = `
                <div class="save-cancel-buttons">
                    <button class="save" onclick="saveField('${field}')">Save</button>
                    <button class="cancel" onclick="cancelField('${field}', '${currentValue}')">Cancel</button>
                </div>
            `;
            
            fieldDisplay.innerHTML += buttonGroup;
        }

        function saveField(field) {
            const newValue = document.getElementById(`${field}-input`).value;
            document.getElementById(`${field}-display`).textContent = newValue;
            if (field === 'name') {
                document.getElementById('left-profile-name').textContent = newValue;
            }
        }

        function cancelField(field, originalValue) {
            document.getElementById(`${field}-display`).textContent = originalValue;
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

        function savePassword() {
            // Handle password save logic
            alert('Password changed successfully!');
        }

        function cancelPassword() {
            // Handle cancel logic
            alert('Password change cancelled!');
        }

        // Initialize with profile content
        renderContent('profile');
    </script>
</body>
</html>

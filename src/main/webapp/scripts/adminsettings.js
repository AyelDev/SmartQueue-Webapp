window.onload = function () {
    FetchImage();
};

const fileInput = document.getElementById('profilePicInput');
document.getElementById('changePhotoBtn').addEventListener('click', function () {
    fileInput.click();
});

fileInput.addEventListener('change', function () {
    const file = fileInput.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('profileImage').src = e.target.result;

            uploadPhoto(file);

        };
        reader.readAsDataURL(file);
    }
});

// Function to upload the photo to the server (optional backend functionality)
function uploadPhoto(file) {
    const formData = new FormData();
    formData.append('profilePhoto', file);

    fetch('ChangeProfilePhoto', {
        method: 'POST',
        body: formData,
    })
    .then((response) => response.text())
    .then((data) => {
            $.notify("Profile updated successfully", { color: "#fff", background: "#20D67B", delay: 1000 })
    })
    .catch((error) => {
            $.notify("an error occured " + error,{ color: "#fff", background: "#D44950", delay: 1000 })
    });
}

let pass = document.querySelector("#new-password");
let confirmpass = document.querySelector("#confirm-password");
let username = window.adminCreds.username;
let id = window.adminCreds.id;

function updateAdminPass() {

    if (pass.value != confirmpass.value) {
        alert("confirm password not matched");
        return false;
    }

    $.ajax({
        url: '/UpdateAdmin',
        method: 'POST',
        data: {
            id: id,
            password: pass.value,
            username: username
        }
    }).done(function (response) {
        $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 })
        pass.value = ``;
        confirmpass.value = ``;
    }).fail(function (jqXHR, error) {
        //notify
        $.notify(jqXHR.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
    });
}




function previewImage(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = function (e) {
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


//-------------------------------------------------------------------FETCHES IMAGE
async function FetchImage() {
    return await fetch(window.location.origin + "/myimage")
        .then((res) => res.blob())
        .then((blob) => {

            let BlobUrl = URL.createObjectURL(blob);

            document.querySelector("#left-profile-picture").src = BlobUrl;
            document.querySelector("#profileImage").src = BlobUrl;
        })
        .catch((error) => {
            console.error('Error fetching image:', error);
        });
}

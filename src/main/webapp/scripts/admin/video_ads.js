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


document.getElementById('uploadButton').addEventListener('click', async function () {
    const videoFiles = document.getElementById('videoFiles').files;
    const previewContainer = document.getElementById('videoPreview');
    const videoList = document.getElementById('videoList');

    previewContainer.innerHTML = ''; // Clear previous previews
    videoList.innerHTML = ''; // Clear the sidebar list

    if (videoFiles.length > 0) {
        for (const file of videoFiles) {

            await $('#VideoUploadForm').submit();

            const videoURL = URL.createObjectURL(file);
            // Create a video element
            const videoElement = document.createElement('video');
            videoElement.src = videoURL;
            videoElement.controls = true;
            previewContainer.appendChild(videoElement);

            // Add file name to the sidebar list
            const listItem = document.createElement('li');
            listItem.textContent = file.name;
            videoList.appendChild(listItem);

         

        }
    } else {
        previewContainer.innerHTML = '<p>No video files selected.</p>';
        videoList.innerHTML = '<li>No files uploaded.</li>';
    }
});

$(document).ready(function(){   
    $('#VideoUploadForm').on('submit', function(event){
        event.preventDefault();
        let formData = new FormData($(this)[0]);

        $.ajax({
            url:'MediaUpload',
            type:'POST',
            data: formData,
            contentType: false,
            enctype: false,
            processData: false,
            beforeSend: function(){
                $.notify('processing request', { color: "#fff", background: "#20D67B", delay: 1000})
            },
            success: function(response){
                $.notify(response, { color: "#fff", background: "#20D67B", delay: 2000})
            },
            error: function(xhr, status, error){
                $.notify('error : ' + xhr.responseText, { color: "#fff", background: "#D44950", delay: 2000 })
            }
        });

      
    });
});

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



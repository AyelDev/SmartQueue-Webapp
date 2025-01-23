
const videoUpload = document.getElementById('videoUpload');
    const uploadBtn = document.getElementById('uploadBtn');
    const videoList = document.getElementById('videoList');
    const videoPlayer = document.getElementById('videoPlayer');
    const videoSource = document.getElementById('videoSource');
    const videoContainer = document.getElementById('videoContainer');
    const minimizeBtn = document.getElementById('minimizeBtn');
    const maximizeBtn = document.getElementById('maximizeBtn');
    const closeBtn = document.getElementById('closeBtn');

    let isMaximized = false;
    let videos = [];

    // Upload button functionality
    uploadBtn.onclick = function () {
        const file = videoUpload.files[0];
        if (file) {
            const url = URL.createObjectURL(file);
            videos.push({ name: file.name, url: url });
            updateVideoList();
            videoUpload.value = '';
        }
    };

    function updateVideoList() {
        videoList.innerHTML = '';
        videos.forEach((video) => {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.textContent = video.name;
            cell.onclick = function () {
                playVideo(video.url);
            };
            row.appendChild(cell);
            videoList.appendChild(row);
        });
    }

    function playVideo(url) {
        videoSource.src = url;
        videoContainer.style.display = 'block';
        videoPlayer.style.width = `${videoContainer.clientWidth}px`;
        videoPlayer.style.height = `${videoContainer.clientHeight - 50}px`; // Adjust height for header space
        videoPlayer.load();
        videoPlayer.play();
    }

    // Close button functionality
    closeBtn.onclick = function () {
        videoContainer.style.display = 'none';
        videoPlayer.pause();
    };

    // Minimize button functionality
    minimizeBtn.onclick = function () {
        videoPlayer.style.display = 'none';
    };

    // Maximize button functionality
    maximizeBtn.onclick = function () {
        if (isMaximized) {
            videoContainer.style.width = '700px';
            videoContainer.style.height = 'auto';
        } else {
            videoContainer.style.width = '100%';
            videoContainer.style.height = '100%';
        }
        isMaximized = !isMaximized;
    };

    // Make the video player draggable
    dragElement(videoContainer);

    function dragElement(elmnt) {
        let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        const header = elmnt.querySelector(".video-header");

        if (header) {
            header.onmousedown = dragMouseDown;
        }

        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            pos3 = e.clientX;
            pos4 = e.clientY;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
            elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }

document.addEventListener("DOMContentLoaded", function () {
    var dropdownButton = document.querySelector(".button-profile");
    var staffProfile = document.getElementById("staffProfile");

    staffProfile.style.display = "none";

    dropdownButton.addEventListener("click", function () {
        if (staffProfile.style.display === "block") {
            staffProfile.style.display = "none";
        } else {
            staffProfile.style.display = "block";
        }
    });
});
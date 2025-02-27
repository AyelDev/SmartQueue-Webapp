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
    //videoList.innerHTML = ''; // Clear the sidebar list

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
            // const listItem = document.createElement('li');
            // listItem.textContent = file.name;
            // videoList.appendChild(listItem);

        }
    } else {
        previewContainer.innerHTML = '<p>No video files selected.</p>';
        videoList.innerHTML = '<li>No files uploaded.</li>';
    }
});

$(document).ready(function () {
    $('#VideoUploadForm').on('submit', function (event) {
        event.preventDefault();
        let formData = new FormData($(this)[0]);

        $.ajax({
            url: 'MediaUpload',
            type: 'POST',
            data: formData,
            contentType: false,
            enctype: false,
            processData: false,
            beforeSend: function () {
                $.notify('processing request', { color: "#fff", background: "#20D67B", delay: 1000 })
            },
            success: function (response) {
                $.notify(response, { color: "#fff", background: "#20D67B", delay: 2000 })
                updateData();
            },
            error: function (xhr, status, error) {
                $.notify('error : ' + xhr.responseText, { color: "#fff", background: "#D44950", delay: 2000 })
            }
        });
    });
});

//--------------------------------FETCH VIDEOS
function updateData() {

    Promise.all([
        fetch('/JsonVideoListAPI'),
    ])
        .then(responses => {
            responses.forEach(response => {
                if (!response.ok) {
                    throw new Error('Network response problem' + response.statusText);
                }
            });
            return Promise.all(responses.map(response => response.json()));
        })
        .then(data => {

            const tableBody = document.querySelector('#videoListBody');
            tableBody.innerHTML = '';
            // Loop through the data and create a row for each item
            data[0].forEach(item => {

                let row = document.createElement('tr');
                let cell1 = document.createElement('td');
                cell1.id = 'videoList';
                cell1.classList.add('video-list');
                let cell1Child = document.createElement('li');
                cell1Child.textContent = item.fileName;
                cell1.appendChild(cell1Child);
                row.appendChild(cell1);

                let cell2 = document.createElement('td');
                let cell2Button = document.createElement('button');
                cell2Button.classList.add('video-removebtn');
                cell2Button.addEventListener('click', function () {
                    DeleteVideos(item.id);
                });
                cell2Button.textContent = 'Remove';
                cell2.appendChild(cell2Button);
                row.appendChild(cell2);
                tableBody.appendChild(row);

            });

        })

}

function DeleteVideos(id) {
    $.ajax({

        url: window.location.origin + "/deletevideo",
        type: 'GET',
        data: {
            'id' : id
        },
        success: function(response){
            $.notify("Video deleted", { color: "#fff", background: "#20D67B", delay: 1000 })
            updateData()
        },
        error: function(request, error){
            console.log("request" + error);
        }

    });
}


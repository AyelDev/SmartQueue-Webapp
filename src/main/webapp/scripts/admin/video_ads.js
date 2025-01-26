document.getElementById('button-profile').addEventListener('click', function () {
    this.classList.toggle('active');
    document.getElementById('adminProfile').classList.toggle('show');
});

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
                $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000})
                videoListPreview();
            },
            error: function(xhr, status, error){
                $.notify('error : ' + xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                videoListPreview();
            }
        });

      
    });
});


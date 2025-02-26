async function FetchImage(imageClassOrIdTag) {
    return await fetch(window.location.origin + "/myimage")
        .then((res) => res.blob())
        .then((blob) => {

            let BlobUrl = URL.createObjectURL(blob);

            document.querySelector(imageClassOrIdTag).src = BlobUrl;
        })
        .catch((error) => {
            console.error('Error fetching image:', error);
        });
}
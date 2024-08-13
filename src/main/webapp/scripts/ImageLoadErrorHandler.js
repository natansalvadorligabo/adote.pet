const img = document.getElementById('img');

img.addEventListener('error', function handleError() {
    img.src = "ImageNotFound.jpg";
    img.alt = 'Default image';
});
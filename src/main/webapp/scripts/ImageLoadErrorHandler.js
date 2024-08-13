const img = document.getElementsByClassName('img');

img.forEach(element => element.addEventListener('error', function handleError() {
    element.src = "ImageNotFound.jpg";
    element.alt = 'Default image';
}));
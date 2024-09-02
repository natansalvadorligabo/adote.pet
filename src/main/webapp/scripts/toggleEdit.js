const imageUploader = document.getElementById('imageUploader');
const userImage = document.getElementById('image');
const submitBtn = document.getElementById('submitEdit');

function toggleEdit(button) {
    const cardBody = button.parentNode.parentNode;
    const inputs = cardBody.querySelectorAll('input');
    const selects = cardBody.querySelectorAll('select');

    inputs.forEach(input => {
        input.classList.remove('pointer-events-none');
        input.classList.add('input-bordered');
        input.readOnly = false;
        if(imageUploader) imageUploader.classList.remove('hidden');
    });

    selects.forEach(select => {
        select.classList.remove('pointer-events-none');
        select.classList.add('select-bordered');
    })
    button.classList.add('hidden');
    submitBtn.classList.remove('hidden');
}

function previewImage(event) {
    const figure = document.getElementById('profileIcon');
    const initials = document.getElementById('initials');
    let previewImage = document.getElementById('photoPreview');

    if(userImage) userImage.classList.add('hidden');

    if(!previewImage){
        const outputImageElement = document.createElement('img');
        figure.appendChild(outputImageElement);
        outputImageElement.id = 'photoPreview';
        previewImage = outputImageElement;
    }
    if(initials){
        initials.classList.add('hidden');
    }

    const reader = new FileReader();

    reader.onload = function() {
        previewImage.src = reader.result;
    };

    reader.readAsDataURL(event.target.files[0]);
}
const disablerButton = document.querySelector('.message-alert-button');
const reseterButton = document.querySelector('.status-reseter-button');

const messageDiv = document.querySelector('.message-alert');

if(disablerButton){
    disablerButton.addEventListener('click', () => {
        messageDiv.style.display = 'none';
    });
}

if(reseterButton){
    reseterButton.addEventListener('click', () => {
        messageDiv.style.display = ' ';
    })
}


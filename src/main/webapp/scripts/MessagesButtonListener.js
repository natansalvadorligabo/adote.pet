const disablerButton = document.querySelector('.message-alert-button');
const reseterButton = document.querySelector('.status-reseter-button');

const messageDiv = document.querySelector('.message-alert');

disablerButton.addEventListener('click', () => {
    messageDiv.style.display = 'none';
});

reseterButton.addEventListener('click', () => {
    messageDiv.style.display = ' ';
})
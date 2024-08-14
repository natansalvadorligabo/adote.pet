"use strict";

window.onload = initPage;

function initPage() {
    let form = document.querySelector('form');

    form.noValidate = true;

    form.addEventListener('submit', function(e) {
        let valid = processValidity(this);
        if (!valid) {
            e.preventDefault();
        }
    });
}

function processValidity(form) {
    let valid;
    validatePassword(form);
    validateCPF(form);
    validatePhoneNumber(form);
    valid = applyValidity(form);
    return valid;
}

function applyValidity(form) {
    let valid = true;
    let count = 0;
    let elements = form.elements;

    for (let i = 0; i < elements.length - 1; i++) {
        let element = elements[i];
        let span = document.getElementById('error-' + element.id);

        if (!element.validity.valid) {
            span.innerHTML = element.validationMessage;
            span.classList.remove('hidden');
            count++;
        } else {
            span.innerHTML = "";
            span.classList.add('hidden');
        }
    }

    if (count > 0) {
        valid = false;
    }

    return valid;
}

function validatePassword(form) {
    let password = form.querySelector('#password');
    let confirmPassword = form.querySelector('#confirmPassword');

    if (password.value !== confirmPassword.value) {
        password.setCustomValidity('Os valores dos campos de senha e confirmação de senha são diferentes.');
    } else {
        password.setCustomValidity('');
    }
}

function validateCPF(form) {
    let cpf = form.querySelector('#cpf');
    let cpfPattern = /^[0-9]{11}$/;

    if (!cpfPattern.test(cpf.value)) {
        cpf.setCustomValidity('O CPF deve conter 11 dígitos.');
    } else {
        cpf.setCustomValidity('');
    }
}

function validatePhoneNumber(form) {
    let phoneNumber = form.querySelector('#phoneNumber');
    let phonePattern = /^[0-9]{2}[0-9]{5}[0-9]{4}$/;

    if (!phonePattern.test(phoneNumber.value)) {
        phoneNumber.setCustomValidity('Número de telefone inválido. Formato correto: (xx)xxxxx-xxxx.');
    } else {
        phoneNumber.setCustomValidity('');
    }
}

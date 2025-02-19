// created by Shreejana Shrestha

document.addEventListener('DOMContentLoaded', () => {
    const email = document.getElementById('email');
    const confirmEmail = document.getElementById('confirm-email');
    const firstName = document.getElementById('first_name');
    const lastName = document.getElementById('last_name');
    const stateCode = document.getElementById('state_code');
    const zipCode = document.getElementById('zipcode');
    const submitBtn = document.getElementById('submitBtn');
    const form = document.getElementById('registration-form');
    const formInputError = document.getElementById('formInputError');

    const emailInputError = document.getElementById('emailInputError');
    const confirmEmailInputError = document.getElementById('confirmEmailInputError');
    const firstNameInputError = document.getElementById('firstNameInputError');
    const lastNameInputError = document.getElementById('lastNameInputError');
    const stateCodeInputError = document.getElementById('stateCodeInputError');
    const zipCodeInputError = document.getElementById('zipCodeInputError');

    const validateEmail = () => email.value === confirmEmail.value;
    const validateName = (name) => /^[a-zA-Z]+$/.test(name.value);
    const validateStateCode = () => /^[a-zA-Z]{2}$/.test(stateCode.value);
    const validateZipCode = () => /^[a-zA-Z]\d[a-zA-Z]\d[a-zA-Z]$/.test(zipCode.value);

    const validateForm = () => {
        let isValid = true;

        emailInputError.style.display = email.checkValidity() ? 'none' : 'block';
        confirmEmailInputError.style.display = validateEmail() ? 'none' : 'block';
        firstNameInputError.style.display = validateName(firstName) ? 'none' : 'block';
        lastNameInputError.style.display = validateName(lastName) ? 'none' : 'block';
        stateCodeInputError.style.display = validateStateCode() ? 'none' : 'block';
        zipCodeInputError.style.display = validateZipCode() ? 'none' : 'block';

        if (!email.checkValidity() || !validateEmail()) isValid = false;
        if (!validateName(firstName) || !validateName(lastName)) isValid = false;
        if (!validateStateCode()) isValid = false;
        if (!validateZipCode()) isValid = false;

        submitBtn.disabled = !isValid;
        formInputError.style.display = isValid ? 'none' : 'block';
    };

    form.addEventListener('input', validateForm);

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        if (submitBtn.disabled) {
            formInputError.style.display = 'block';
        } else {
            formInputError.style.display = 'none';
            const welcomeMessage = `Welcome ${firstName.value} ${lastName.value}!`;
            document.getElementById('welcomeMessage').textContent = welcomeMessage;
            form.reset();
            submitBtn.disabled = true;
        }
    });

    document.getElementById('reset-button').addEventListener('click', () => {
        form.reset();
        formInputError.style.display = 'none';
        emailInputError.style.display = 'none';
        confirmEmailInputError.style.display = 'none';
        firstNameInputError.style.display = 'none';
        lastNameInputError.style.display = 'none';
        stateCodeInputError.style.display = 'none';
        zipCodeInputError.style.display = 'none';
        submitBtn.disabled = true;
        submitBtn.classList.add('not-allowed');
    });
});
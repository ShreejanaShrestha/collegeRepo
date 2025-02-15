/* created by Shreejana Shrestha || 
   Student Id: C0930321
*/

/************ Question 1 js code logic *************/

const age1 = document.getElementById('age1');
const age2 = document.getElementById('age2');
const age3 = document.getElementById('age3');
const submitBtn = document.getElementById('submitBtn');
const formInputError = document.getElementById('formInputError');
const form = document.getElementById('puppyAgeForm');
const output = document.getElementById('output');

function validateInputs() {
    if (age1.value && age2.value && age3.value) {
        submitBtn.disabled = false;
        formInputError.style.display = 'none';
    } else {
        submitBtn.disabled = true;
        formInputError.style.display = 'block';
    }
}

age1.addEventListener('input', validateInputs);
age2.addEventListener('input', validateInputs);
age3.addEventListener('input', validateInputs);

form.addEventListener('submit', function(event) {
    event.preventDefault();
    if (!age1.value || !age2.value || !age3.value) {
        formInputError.style.display = 'block';
    } else {
        formInputError.style.display = 'none';
        const dogAge1 = age1.value * 7;
        const dogAge2 = age2.value * 7;
        const dogAge3 = age3.value * 7;
        output.innerHTML = `
            <p>Your doggie 1 is ${dogAge1} years old in dog years!</p>
            <p>Your doggie 2 is ${dogAge2} years old in dog years!</p>
            <p>Your doggie 3 is ${dogAge3} years old in dog years!</p>
        `;
    }
});


/************ Question 4 js code logic *************/

function calculate(type){
    let mapping = {
        'celsiusToFahrenheit': 'celsius',
        'fahrenheitToCelsius': 'fahrenheit'
    }
    let valueType = mapping[type]
    let inputValue = parseFloat(document.getElementById(valueType).value)

    let  value = type =='celsiusToFahrenheit' ? celsiusToFahrenheit(inputValue) : fahrenheitToCelsius(inputValue)
    let result = document.getElementById('result')
    result.textContent = value

}

function celsiusToFahrenheit(celsius) {
    let celsiusToFarenheit = (celsius*9)/5 + 32;
    let convertedText = celsius + '°C is ' + celsiusToFarenheit.toFixed(2) + '°F';
    return convertedText
}

function fahrenheitToCelsius(fahrenheit) {
    var fahrenheitToCelsius = ((fahrenheit - 32)*5)/9;
    let convertedText = fahrenheit + '°F is ' + fahrenheitToCelsius.toFixed(2) + '°C';
    return convertedText
}

/* created by Shreejana Shrestha || 
   Student Id: C0930321
*/

// ***********************************************
// calculation program js logic
// ***********************************************

let resultDisplayDiv = document.getElementById("result");
let firstNumber = document.getElementById("firstNumber");
let secondNumber = document.getElementById("secondNumber");

function calculate(operation) {
  resultDisplayDiv.innerHTML = '';
  let firstNumberValue = firstNumber.value.trim();
  let secondNumberValue = secondNumber.value.trim();
  let firstNumberError = document.getElementById("firstNumberError");
  let secondNumberError = document.getElementById("secondNumberError");

  firstNumberError.innerHTML = "";
  secondNumberError.innerHTML = "";
  firstNumber.classList.remove("input-error");
  secondNumber.classList.remove("input-error");

  if (firstNumberValue === '') {
    firstNumberError.innerHTML = "Please enter a number";
    firstNumber.classList.add("input-error");
    return;
  }

  if (secondNumberValue === '') {
    secondNumberError.innerHTML = "Please enter a number";
    secondNumber.classList.add("input-error");
    return;
  }

  if (operation === 'divide' && secondNumberValue === '0') {
    secondNumberError.innerHTML = "Denominator cannot be zero";
    secondNumber.classList.add("input-error");
    return;
  }

  var result = operation === 'multiply' ? parseFloat(firstNumberValue) * parseFloat(secondNumberValue) : parseFloat(firstNumberValue) / parseFloat(secondNumberValue);
  resultDisplayDiv.innerHTML = "<h4>The result is: " + result + "</h4>";
}

// ***********************************************
// guess program js logic
// ***********************************************

// generating a random integer between 1 and 10
let randomNumber = Math.floor(Math.random() * 10) + 1;

console.log("Random number", randomNumber);
function checkUserGuess() {
    let guessNumber = document.getElementById("guessNumber");
    let guessNumberError = document.getElementById("guessNumberError");
    let guessNumberValue = parseInt(guessNumber.value);
    let result = document.getElementById("result");

    guessNumberError.innerHTML = "";
    guessNumber.classList.remove("input-error");

// checking if the entered value is valid or not
    if (guessNumberValue === "" || guessNumberValue < 1 || guessNumberValue > 10) {
        guessNumberError.textContent = "Please enter a number between 1 and 10.";
        guessNumber.classList.add("input-error");
        return;
    }
// checking the entered value with the random number
    if (guessNumberValue == randomNumber) {
        result.textContent = "Good Work";
        result.className = "text-success";
    } else {
        result.textContent = "Not matched";
        result.className = "text-danger";
    }
}

// ***********************************************
// fortune teller js logic
// ***********************************************

function tellFortune(numChildren, partnerName, geoLocation, jobTitle) {
    console.log(partnerName);
    partnerName = partnerName || "Prabs";
    return `You will be a ${jobTitle} in ${geoLocation}, and married to ${partnerName} with ${numChildren} kids.`;
}

function displayFortune() {
    const fortunes = [
        tellFortune(2, "P", "Nepal", "Software Engineer"),
        tellFortune(3, null, "Canada", "Project Manager"),
        tellFortune(11, "", "Australia", "CEO"),
    ];

    let fortuneContainer = document.getElementById("fortune");
    fortuneContainer.innerHTML = ''
    fortunes.forEach(fortune => {
        let p = document.createElement('p');
        let line = document.createElement('hr')
        p.textContent = fortune;
        fortuneContainer.appendChild(p);
        p.appendChild(line);
    });
}

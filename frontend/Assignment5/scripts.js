// Created by shreejana shrestha

// Question 1
// *****************************

const today = new Date();
const currentDate = today.getFullYear();
const startDate = new Date(today.getFullYear(), 0, 1)
const options = {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit'
};
function daysPassedFunction() {
    const timeDifference = today - startDate
    return Math.floor(timeDifference / (1000 * 60 * 60 * 24));
    // console.log(timeDifference)
}
const daysPassed = daysPassedFunction()
document.getElementById("current_date").textContent = `Current Date and Time: ${today.toLocaleDateString(undefined, options)}`;
const daysPassedHeading = document.getElementById("days_passed_info")
daysPassedHeading.textContent = `Days passed till today in this year: ${daysPassed} days passed in ${currentDate}!`;
daysPassedHeading.style.color = "#149649";

// Question 2
// *****************************

// remove characters function
function removeCharacters() {
    document.write("hello world")
    let string = document.getElementById('user_input_string')
    let stringValue = string.value.trim()
    let numberOfChars = parseFloat(document.getElementById('input_num_of_characters').value)
    let resultQ2 = document.getElementById('result_question2')
    // logic to remove the user entered number of characters
    if (numberOfChars < stringValue.length) {
        value = stringValue.substring(numberOfChars);
        resultQ2.textContent = "The resulting string is: " + value;

    } else {
        resultQ2.textContent = "The number of characters in the string is less than or equal to the number of characters you want to remove";
    }
}


// Question 3
// *****************************

function capitalizeFirstLetterOfEachWord(str) {
    var words = str.split(" ");
    var capitalizedWords = words.map(word => {
        return word.charAt(0).toUpperCase() + word.slice(1);
    });
    return capitalizedWords.join(" ");
}

function capitalizeWords() {
    const inputStringData = document.getElementById('input_string_data').value;
    const resultString = capitalizeFirstLetterOfEachWord(inputStringData);
    document.getElementById('result_question3').textContent = `Result: ${resultString}`;
}

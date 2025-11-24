// Generate a random number between 1 and 100
const number = Math.floor(Math.random() * 100) + 1;

// Number of attempts left
let attempts = 3; 

// Get DOM elements
const guessInput = document.getElementById('guessInput');
const submitGuess = document.getElementById('submitGuess');
const message = document.getElementById('message');
const attemptsLeft = document.getElementById('attemptsLeft');

// Add event listener for the submit button
submitGuess.addEventListener('click', function () {
    const guess = parseInt(guessInput.value, 10);

    // Validate input
    if (isNaN(guess) || guess < 1 || guess > 100) {
        message.textContent = "Please enter a valid number between 1 and 100.";
        message.className = "wrong";
        return;
    }

    // Check the guess
    if (guess === number) {
        message.textContent = "Congratulations! You guessed it!";
        message.className = "correct";
        guessInput.disabled = true;
        submitGuess.disabled = true;
    } else {
        attempts--;
        if (attempts > 0) {
            message.textContent = guess < number ? "Too low!" : "Too high!";
            message.className = "wrong";
            attemptsLeft.textContent = `Attempts Left: ${attempts}`;
        } else {
            message.textContent = `Game Over! The correct number was ${number}.`;
            message.className = "wrong";
            guessInput.disabled = true;
            submitGuess.disabled = true;
        }
    }

    // Clear input field
    guessInput.value = "";
});

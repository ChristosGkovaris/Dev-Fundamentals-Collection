// Select the form and message elements
const loginForm = document.getElementById('loginForm');
const message = document.getElementById('message');

// Add event listener to the form submission
loginForm.addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent page refresh

    // Get the values of email and password inputs
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Simple validation logic
    if (email === "test@example.com" && password === "password123") {
        message.style.color = "green";
        message.textContent = "Login successful!";
    } else {
        message.style.color = "red";
        message.textContent = "Invalid email or password.";
    }
});

// Select the form and result container
const tipForm = document.getElementById('tipForm');
const result = document.getElementById('result');

// Add event listener to the form submission
tipForm.addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent page refresh

    // Get the bill amount and tip percentage
    const billAmount = parseFloat(document.getElementById('billAmount').value);
    const tipPercentage = parseFloat(document.getElementById('tipPercentage').value);

    // Validate the inputs
    if (isNaN(billAmount) || billAmount <= 0) {
        result.textContent = "Please enter a valid bill amount.";
        result.style.color = "red";
        return;
    }

    // Calculate the tip and total amount
    const tip = billAmount * tipPercentage;
    const total = billAmount + tip;

    // Display the result
    result.style.color = "green";
    result.innerHTML = `
        <p>Tip: $${tip.toFixed(2)}</p>
        <p>Total Amount: $${total.toFixed(2)}</p>
    `;
});

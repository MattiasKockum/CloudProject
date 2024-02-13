document.addEventListener('DOMContentLoaded', () => {
    const generateButton = document.getElementById('generateButton');
    generateButton.addEventListener('click', async () => {
        try {
            const response = await fetch('http://localhost:8081/get-random-number.php');
            const data = await response.json();
            console.log('Response:', data); // Log the entire response

            const randomNumber = data['number'];
            const randomNumberElement = document.getElementById('randomNumber');
            if (randomNumberElement) {
                randomNumberElement.textContent = `Random Number: ${randomNumber}`;
            } else {
                console.error('Element with ID "randomNumber" not found');
            }
        } catch (error) {
            console.error('Error generating random number:', error);
        }
    });
});

// script.js

// Add interactive features like hover effects, transitions, or animations here
// Example: Adding a simple hover effect to product images
document.querySelectorAll('.product-gallery img').forEach(img => {
    img.addEventListener('mouseover', () => {
        img.style.transform = 'scale(1.1)';
        img.style.transition = 'transform 0.3s ease-in-out';
    });

    img.addEventListener('mouseout', () => {
        img.style.transform = 'scale(1)';
    });
});

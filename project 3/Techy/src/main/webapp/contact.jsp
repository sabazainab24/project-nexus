<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Techy Software</title>
    <link rel="stylesheet" href="styles.css">
    <meta name="description" content="Get in touch with Techy Software for more information about our products and services.">
    <meta name="keywords" content="Techy Software, contact, software solutions">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </nav>
    </header>

    <section id="contact" class="contact-section">
        <h2>Contact Us</h2>
        <form action="backend-url" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>
            <button type="submit">Send</button>
        </form>
    </section>

    <footer>
        <div class="social-media">
            <a href="https://twitter.com/techysoftware">Twitter</a>
            <a href="https://facebook.com/techysoftware">Facebook</a>
            <a href="https://linkedin.com/company/techysoftware">LinkedIn</a>
        </div>
        <p>&copy; 2024 Techy Software. All rights reserved.</p>
    </footer>
</body>
</html>

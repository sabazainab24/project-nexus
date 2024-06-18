<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Techy Software</title>
    <link rel="stylesheet" href="styles.css">
    <meta name="description" content="Techy Software - Your partner in innovative software solutions.">
    <meta name="keywords" content="Techy Software, software solutions, innovative software, software company">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="Dashboard.jsp">Homepage</a></li>
                <li><a href="#home">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="Feedback.jsp">Feedback</a></li>
                
            </ul>
        </nav>
    </header>

    <section id="home" class="hero-section">
        <div class="hero-content">
            <h1>Welcome to Techy Software</h1>
            <p>Your partner in innovative software solutions.</p>
        </div>
    </section>

    <section id="about" class="about-section">
        <h2>About Us</h2>
        <p>Techy Software specializes in developing cutting-edge software solutions that drive business success.</p>
    </section>

    <section id="products" class="products-section">
        <h2>Our Products</h2>
        <div class="product-gallery">
            <img src="images (5).jpg" alt="Product 1">
            <img src="images (6).jpg" alt="Product 2">
            <img src="images (7).jpg" alt="Product 3">
        </div>
    </section>

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

    <script src="script.js"></script>
</body>
</html>

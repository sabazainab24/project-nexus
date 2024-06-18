<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('images (3).jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .feedback-form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1);
        }

        .feedback-form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        select,
        textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            padding: 20px;
            border: none;
            border-radius: 10px;
            background-color: #5cb85c;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="feedback-form-container">
        <h2>Feedback Form</h2>
        <form id="feedbackForm" method="post">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="rating">Rating</label>
            <select id="rating" name="rating" required>
                <option value="1">1 - Very Poor</option>
                <option value="2">2 - Poor</option>
                <option value="3">3 - Average</option>
                <option value="4">4 - Good</option>
                <option value="5">5 - Excellent</option>
            </select>

            <label for="comments">Comments</label>
            <textarea id="comments" name="comments" rows="4" required></textarea>

            <button type="submit">Submit</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#feedbackForm").submit(function(e) {
                e.preventDefault();
                var formData = $(this).serialize();
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/TechyAPI/FeedbackServlet',
                    data: formData,
                    success: function(response) {
                        var jsonObject = JSON.parse(response);
                        var message = jsonObject.message;
                        alert(message);
                    },
                    error: function() {
                        alert('Failed to call servlet.');
                    }
                });
            });
        });
    </script>
</body>
</html>

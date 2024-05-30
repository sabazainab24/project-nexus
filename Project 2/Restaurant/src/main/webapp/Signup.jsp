<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="author" content="Muhamad Nauval Azhar">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="This is a login page template based on Bootstrap 5">
    <title>Bootstrap 5 Register Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<style>
        body, html {
            height: 100%;
            margin: 0;
        }

        .bg {
            /* Full height */
            height: 100%; 

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .container-bg {
            background-image: url('resturantimage.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>

</head>

<body>
    <section class="h-100">
        <div class="container h-100 container-bg">
            <div class="row justify-content-sm-center h-100">
                <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
                            <form id="register" method="POST" enctype="application/x-www-form-urlencoded" class="needs-validation" novalidate="" autocomplete="off">
                                <div class="mb-3">
                                    <label class="mb-2 text-muted" for="name">Name</label>
                                    <input id="name" type="text" class="form-control" name="sname" required autofocus>
                                    <div class="invalid-feedback">Name is required</div>
                                </div>
                                <div class="mb-3">
                                    <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                    <input id="email" type="email" class="form-control" name="email" required>
                                    <div class="invalid-feedback">Email is invalid</div>
                                </div>
                                <div class="mb-3">
                                    <label class="mb-2 text-muted" for="password">Password</label>
                                    <input id="password" type="password" class="form-control" name="password" required>
                                    <div class="invalid-feedback">Password is required</div>
                                </div>
                                <p class="form-text text-muted mb-3">By registering you agree with our terms and condition.</p>
                                <div class="align-items-center d-flex">
                                    <button type="submit" class="btn btn-primary ms-auto">Register</button>
                                </div>
                            </form>
                            <div id="status"></div> <!-- Display status message -->
                        </div>
                        <div class="card-footer py-3 border-0">
                            <div class="text-center">
                                Already have an account? <a href="Login.jsp" class="text-dark">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        console.log("Document ready!");

        $("#register").submit(function(e) {
            e.preventDefault();

            if (validateForm()) {
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/RestaurantAPI/RegistrationServlet',
                    data: $("#register").serialize(),
                    success: function(response) {
                        try {
                            var jsonObject = JSON.parse(response);
                            var message = jsonObject.message;
                            $('#status').html(message);
                            console.log("Success: " + message);
                            window.location.href = 'Login.jsp'; // Redirect after successful registration
                        } catch (e) {
                            console.error('Error parsing JSON: ', e);
                            $('#status').html('Server response is not in JSON format.');
                        }
                    },
                    error: function(xhr, status, error) {
                        var errorMessage = xhr.status + ': ' + xhr.statusText;
                        console.error('Error - ' + errorMessage);
                        $('#status').html('Failed to call servlet. Error: ' + errorMessage);
                    }
                });
            }
        });

        function validateForm() {
            var isValid = true;

            var nameInput = $("#name");
            if (nameInput.val().trim() === "") {
                nameInput.addClass("is-invalid");
                isValid = false;
            } else {
                nameInput.removeClass("is-invalid");
            }

            var emailInput = $("#email");
            var email = emailInput.val().trim();
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                emailInput.addClass("is-invalid");
                isValid = false;
            } else {
                emailInput.removeClass("is-invalid");
            }

            var passwordInput = $("#password");
            if (passwordInput.val().trim() === "") {
                passwordInput.addClass("is-invalid");
                isValid = false;
            } else {
                passwordInput.removeClass("is-invalid");
            }

            return isValid;
        }
    });
    </script>
</body>
</html>

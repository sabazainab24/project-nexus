<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="author" content="Muhamad Nauval Azhar">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="This is a login page template based on Bootstrap 5">
    <title>Bootstrap 5 Login Page</title>
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
                    <div class="text-center my-5">
                       
                    </div>
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <h1 class="fs-4 card-title fw-bold mb-4">Login</h1>
                            <form id="loginForm" method="POST" class="needs-validation" novalidate="" autocomplete="off">
                                <div class="mb-3">
                                    <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                    <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                                    <div class="invalid-feedback">
                                        Email is invalid
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="mb-2 w-100">
                                        <label class="text-muted" for="password">Password</label>
                                        <a href="forgot.html" class="float-end">
                                            Forgot Password?
                                        </a>
                                    </div>
                                    <input id="password" type="password" class="form-control" name="password" required>
                                    <div class="invalid-feedback">
                                        Password is required
                                    </div>
                                </div>

                                <div class="d-flex align-items-center">
                                    <div class="form-check">
                                        <input type="checkbox" name="remember" id="remember" class="form-check-input">
                                        <label for="remember" class="form-check-label">Remember Me</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary ms-auto">
                                        Login
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer py-3 border-0">
                            <div class="text-center">
                                Don't have an account? <a href="Signup.jsp" class="text-dark">Create One</a>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-5 text-muted">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript">
   function validate() {
       var x = document.getElementById('email').value;
       var y = document.getElementById('password').value;
       if (x === "") {
           alert("Please enter your email");
           return false;
       }
       if (y === "") {
           alert("Please enter your password");
           return false;
       }
       return true;
   }

   $(document).ready(function () {
	   alert("hi");
       $("#loginForm").submit(function (e) {
    	   alert("login");
           e.preventDefault();
           if (validate()) {
        	   alert("hu");
               $.ajax({
                   type: 'POST',
                   url: 'http://localhost:8080/RestaurantAPI/LoginServlet',
                   data: $("#loginForm").serialize(),
                   success: function (response) {
                	   alert(response);
                	
                       if (response === "Valid User") {
                    	   //alert("success");
                    	window.location.href = "Dashboard.jsp?email=" + $("#email").val();
                       } else {
                           alert("Invalid email or password");
                       }
                   },
                   error: function () {
                       alert('Failed to call servlet.');
                   }
               });
           }
       });
   });
</script>
</body>
</html>
    
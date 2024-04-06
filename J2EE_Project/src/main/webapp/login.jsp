<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn Page</title>
<link rel="icon" href="webImages/log-in.png">
<!-- Style CSS -->
<link rel="stylesheet" href="styles/signInSignUp.css">

<!-- Font-awesome Link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")  %>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="webImages/log-in.png" style="width:1000px; height: 300px" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link"><i class="fa-solid fa-plus" style="margin-right: 10px;"></i>Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign In</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i class="fa-solid fa-envelope"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="password"><i class="fa-solid fa-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
     var status = document.getElementById("status").value;
     if(status == "failed"){
    	 swal("Sorry","Wrong username and Password!",	"failed");
     }
	</script>
</body>
</html>
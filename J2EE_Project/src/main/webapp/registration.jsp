<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="icon" href="webImages/book.png">
<title>Sign Up Form</title>
<script>
	function disableSubmit() {
		document.getElementById("signup").disabled = true;
	}

	function activateButton(element) {

		if (element.checked) {
			document.getElementById("signup").disabled = false;
		} else {
			document.getElementById("signup").disabled = true;
		}

	}
</script>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Font-awesome Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Main css -->
<link rel="stylesheet" href="styles/signInSignUp.css">
</head>
<body onload="disableSubmit()">
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>

						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i class="fa-solid fa-user"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name"
									required />
							</div>
							<div class="form-group">
								<label for="email"><i class="fa-solid fa-envelope"></i></label>
								<input type="email" name="email" id="email"
									placeholder="Your Email" required />
							</div>
							<div class="form-group">
								<label for="pass"><i class="fa-solid fa-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password"
									required />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="fa-solid fa-lock" style="color: #c0c0c0;"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required />
							</div>
							<div class="form-group">
								<label for="contact"><i class="fa-solid fa-phone"></i></label> <input
									type="text" name="contact" id="contact"
									placeholder="Contact no" required />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" onchange="activateButton(this)" /> <label
									for="agree-term" class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" onclick="myalert()"
									class="term-service">Terms of service</a></label>



								<script>
									function myalert() {
										alert("Data Privacy and Security:\n" + 
												"- We are committed to protecting your privacy and ensuring the security of your data.\n" + 
												"- Your personal information and financial data related to the wallet function are collected, stored, and protected according to industry-standard security measures, including encryption protocols and regular security audits.\n" +
												"- We do not share your data with third parties without your consent, except as required by law or as necessary for the functioning of our services. You have options to control your data sharing preferences through your account settings.\n");
									}
								</script>
							</div>
							<div class="form-group form-button">

								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="webImages/book.png" style="width: 500px; height: 250px"
								alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
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
		if (status == "success") {
			swal("Congrats", "Account created successfully!", "success");
		} else if(status == "notSame") {
			swal("Passwords do not match!")
		} else if (status == "failed") {
			swal("The account has already registrated!");
		}
	</script>




</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
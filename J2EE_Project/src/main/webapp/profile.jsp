<%@page import="model.User"%>
<%@page import="java.util.*"%>
<%@page import="static util.DBConnection.*"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="styles/style.css">
<link rel="icon" href="webImages/user.png">

<!-- Fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.profile_container {
	height: auto;
}

.inputContainer {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.profile_setting button {
	border: 0px;
	background-color: transparent;
	font-family: 'Times New Roman', Times, serif;
	font-size: 15px;
}

.inputPwd {
	border: 1px solid #000000;
	width: 350px;
	height: 40px;
	margin: 10px 0px;
	padding: 10px;
	border-radius: 10px;
	display: block;
}

.submit_btn {
	width: 150px;
	height: 30px;
	border-radius: 10px;
	border: 0px;
	background-color: lightblue;
}
</style>
</head>
<body>

	<%!double usrAmount = 0.0;
	String usrName = "";
	String usrEmail = "";
	String usrPhoneNo = "";
	String imgFileName = "";%>

	<%
	ServletContext context = request.getServletContext();
	int usrID = (int) context.getAttribute("id");
	List<User> userList = dbUserData(usrID);
	for (User user : userList) {
		usrName = user.getUsrName();
		usrEmail = user.getUsrEmail();
		usrPhoneNo = user.getUsrPhoneNo();
		imgFileName = user.getImgFileName();
	}
	%>
	

	<!-- Profile -->
	<section class="profile_page">
	
		<div class="profile_container" style="padding: 30px;">
		<a style="text-decoration: none;" href="index.jsp"><i class="fa-solid fa-house" style="font-size: 40px; position: absolute; color: #000000"></i></a>
			<div class="profile_section">



				<form action="AddImage" method="post" enctype="multipart/form-data">

					<div
						style="display: flex; align-items: center; flex-direction: column;">
						<img alt="" src="images/<%=imgFileName%>"> <label
							for="edit_profile" style="font-size: 20px; margin-bottom: 10px;">Edit</label>
						<input type="file" name="image" id="edit_profile"
							style="display: none;"> <input
							style="width: 100px; height: 30px; color: black; background-color: #3C91E6; border-radius: 10px"
							type="submit" value="Upload">
					</div>

				</form>
			</div>

			<div class="profile_detail">
				<div class="sub_detail">
					<span>
						<h3>Your Name</h3>
						<p><%=usrName%></p>
					</span>
				</div>

				<div class="sub_detail">
					<span>
						<h3>Email</h3>
						<p><%=usrEmail%></p>
					</span>
				</div>

				<div class="sub_detail">
					<span>
						<h3>Phone Number</h3>
						<p><%=usrPhoneNo%></p>
					</span>
				</div>
			</div>

			<div class="profile_detail" style="border: 0px; padding: 0px;">
				<h3>Security</h3>

				<div class="profile_setting">
					<div class="inputContainter">
						<button onclick="changePwd()" class="setting_key">Change
							password</button>
						<div id="input_field" style="display: none">
							<form action="changePwdControl" method="POST">
								<input name="curPassword" id="curPassword" class="inputPwd"
									type="password"
									placeholder="Current password" required> <input
									name="newPassword" id="newPassword" class="inputPwd"
									type="password"
									placeholder="New password" required> <input
									name="repPassword" id="repPassword" class="inputPwd"
									type="password"
									placeholder="Retype password" required>
								<button type="submit" value="Save" class="submit_btn"
									onclick="messageAlert()"
									style="color: #ffffff; background-color: blue;" onclick="messageAlert()">Submit</button>
							</form>
						</div>
					</div>
				</div>

				<div class="profile_setting">
					<button class="setting_key" onclick="delAcc()">Delete
						account</button>
					<div id="submitField" style="display: none">
						<form action="deleteAccControl" method="POST">
							<input name="delPassword" id="delAcc" class="inputPwd"
								type="password" placeholder="Submit password to delete" required>
							<button type="submit" value="Save" class="submit_btn"
								onclick="messageAlert()"
								style="color: #ffffff; background-color: blue;">Submit</button>
						</form>
					</div>
				</div>
				<input type="text" id="showMessage" style="text-align: center; margin: auto; border: 0px; font-size: 20px; display: block; width: 100%; background-color: transparent;" value="<%=request.getAttribute("MSG")%>">
			</div>

		</div>
	</section>
	<!-- Profile -->


	<script>
		function messageAlert() {
			var x = document.getElementById("messageAlert");
			if (x.style.display === "block") {
				x.style.display = "none";
			} else {
				x.style.display = "block";
			}
		}
	</script>

	<script>
		function changePwd() {
			var x = document.getElementById("input_field");
			if (x.style.display === "block") {
				x.style.display = "none";
			} else {
				x.style.display = "block";
			}
		}
	</script>

	<script>
		function delAcc() {
			var x = document.getElementById("submitField");
			if (x.style.display === "block") {
				x.style.display = "none";
			} else {
				x.style.display = "block";
			}
		}
	</script>
	
	<script>
		var x = document.getElementById('showMessage').value;
		var y = document.getElementById('showMessage');
		if(x === "null") {
			y.style.display = "none";
		} else if(x === "Something was wrong!" || x === "Passwords do not match!") {
			y.style.color = "red";
		} else if(x === "Successfully changed!") {
			y.style.color = "green";
		}
	</script>



</body>
</html>
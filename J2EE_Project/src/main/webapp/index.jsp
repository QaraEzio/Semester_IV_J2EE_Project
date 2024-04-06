<%@page import="dao.WalletDAO"%>
<%@page import="model.User"%>
<%@page import="util.DBConnection"%>
<%@page import="java.util.*"%>
<%@page import="static model.User.*"%>
<%@page import="java.sql.*"%>
<%@page import="static dao.WalletDAO.*"%>
<%@page import="static util.DBConnection.*"%>

<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
ServletContext context = request.getServletContext();
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="webImages/wallet.png" rel="icon">

<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<!-- My CSS -->
<link rel="stylesheet" href="styles/style.css">
<link rel="stylesheet" href="styles/homeStyle.css">

<!-- Fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>AgendaPurse</title>
<style>
::-webkit-scrollbar {
	display: none;
}
.side-menu{
	flex-direction: column;
}
</style>

</head>

<body>

	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand"> <i class='bx bxs-smile'></i> <span
			class="text">AgendaPurse </span>
		</a>
		<ul class="side-menu top">
			<li class="active"><a href="#home"> <i class='bx bxs-group'></i>
					<span class="text">Home</span>
			</a></li>

			<li id="contentMenu"><a href="#content_us"> <i
					class='bx bxs-dashboard'></i> <span class="text">Contact us</span>
			</a></li>
			<li><a href="#wallet"> <i class='bx bxs-shopping-bag-alt'></i>
					<span class="text">Wallet</span>
			</a></li>
<!-- 			<li><a href="#"> <i class='bx bxs-doughnut-chart'></i> <span
					class="text">To Do List</span>
			</a></li> -->
			<li><a href="#history"> <i class='bx bxs-message-dots'></i>
					<span class="text">History</span>
			</a></li>
		</ul>
		<ul class="side-menu">
			<li><a href="./profile.jsp"> <i class='bx bx-user'></i> <span
					class="text">Profile</span>
			</a></li>
			<li id="showManage"><a href="./main.jsp"> <i
					class='bx bxs-cog'></i> <span class="text">Manage</span>
			</a></li>
			<input style="display: none;" type="text" id="positionSubmit"
				style="" value="<%=context.getAttribute("positionAlert")%>" readonly>
			<li><a href="login.jsp" class="logout"> <i
					class='bx bxs-log-out-circle'></i> <span class="text">Logout</span>
			</a></li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav id="profile">
			<i class='bx bx-menu'></i> <a href="#" class="nav-link">Categories</a>
			<!-- 			<form action="#">
<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn">
						<i class='bx bx-search'></i>
					</button>
				</div>
			</form> -->
			<!-- 	<input type="checkbox" id="switch-mode" hidden> <label
				for="switch-mode" class="switch-mode"></label> <a href="#"
				class="notification">
			</a> <a href="#" class="profile"> -->
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- Home -->
		<div class="boxx" id="home" style="background-color: transparent;">
			<section class="hero" style="margin-bottom: 100px">

				<h1 style="font-size: 40px; margin-bottom: 40px;">Welcome to AgendaPurse</h1>
				<img class="img" src="webImages/image.png" />
				<div class="container">
					<div class="hero-content">
						<p>
							Our platform empowers users to efficiently manage budget and
							 facilitating a more organized and fulfilling life.<br>
							<br>Join us on our journey to take control of your time and
							money like never before.
						</p>
					</div>

				</div>
			</section>
		</div>

		<div class="shadowbox" id="content_us" style="background: transparent;">
			<section class="contact">

				<div class="box1">
					<div>
						<div class="content">
							<h2>Contact With Us</h2>
							<p>Free free to contact us any time. We will get back to you
								as soon as we can!</p>
						</div>

						<div class="container0">

							<div class="container1">

								<div class="contactForm">
									<form action="message" method="POST"
										onsubmit="emailSend(); reset(); return false;">
										<h2>Send Message</h2>
										<div class="inputBox">
											<input type="text" id="msg" name="msg" required="required">
											<span>Type Your Message...</span>
										</div>
										<div class="inputBox">
											<input type="submit" name="send" value="SEND">
										</div>
										<input type="text"
											style="border: 0px; background-color: transparent; width: 100%;"
											id="messageAlert" value="<%=request.getAttribute("msg")%>"
											readonly>
									</form>
								</div>

								<script>
									var x = document
											.getElementById('messageAlert').value;
									var y = document
											.getElementById('messageAlert');
									if (x === "null") {
										y.style.display = "none";
									}
								</script>

							</div>
						</div>
					</div>

					<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
					<script src="https://smtpjs.com/v3/smtp.js">
						
					</script>
					<script src="Contact form to email.js"></script>

					<div class="container2">

						<div class="contactInfo">
							<h2>Info</h2>
							<a href="https://maps.app.goo.gl/MGN6ZtFyB2qZ1Qim7" class="box" style="color: #000000;">
								<div class="icon">
									<i class="fa-solid fa-location-dot"></i>
								</div>
								<div class="text">
									<h3>Address</h3>
									<p>UCSY, Campus</p>
								</div>
							</a>
							<a href="tel:+959796000227" class="box" style="color: #000000;">
								<div class="icon">
									<i class="fa fa-phone"></i>
								</div>
								<div class="text">
									<h3>Phone</h3>
									<p>+95123456789</p>
								</div>
							</a>
							<a href="mailto:kukue014@gmail.com" class="box" style="color: #000000;">
								<div class="icon">
									<i class="fa-solid fa-envelope"></i>
								</div>
								<div class="text">
									<h3>Email</h3>
									<p>agendapurse.team@ucsy.edu.mm</p>
								</div>
							</a>
						</div>
					</div>

				</div>
			</section>
		</div>



		<%!double usrAmount = 0.0;
	String usrName = "";
	String usrEmail = "";
	String usrPhoneNo = "";
	String imgFileName = "";%>

		<%
		int usrID = (int) context.getAttribute("id");
		usrAmount = WalletDAO.showAmount(usrID);
		List<User> userList = dbUserData(usrID);
		for (User user : userList) {
			usrName = user.getUsrName();
			usrEmail = user.getUsrEmail();
			usrPhoneNo = user.getUsrPhoneNo();
			imgFileName = user.getImgFileName();
		}
		%>

		<!-- MAIN -->
		<main>
			<div class="head-title" id="wallet">
				<div class="left">
					<h1>Wallet</h1>
				</div>
			</div>

			<ul class="box-info">
				<li style="width: 85%; background-color: lightblue;">
					<div
						style="display: flex; justify-content: space-between; width: 100%;">
						<div>
							<i class='bx bxs-dollar-circle'></i> <span class="text">
								<p>Your balance</p>
								<h3><%=usrAmount%>
									MMK
								</h3>
								<p>Total Amount</p>
						</div>
						<div id="editAmount" style="display: none; align-items: center;">
							<form action="editAmount" method="POST">
								<input type="text" name="editAmount"
									placeholder="Edit your initial amount!"
									style="height: 50px; width: 200px; border-radius: 8px; border: 0px; padding-left: 20px; font-size: 14px;">
								<input type="submit" value="Submit"
									style="height: 50px; width: 80px; border-radius: 8px; background-color: #ffffff; border: 0px;">
							</form>
						</div>
						</span>
						<script>
							function editAmount() {
								var x = document.getElementById("editAmount");
								if (x.style.display === "block") {
									x.style.display = "none";
								} else {
									x.style.display = "block";
								}
							}
						</script>
					</div>
				</li>

				<li
					style="display: flex; flex-direction: column; justify-content: space-around;">
					<div>
						<i class="fa-solid fa-wallet" style="font-size: 50px;"></i>
					</div>
					<button
						style="background-color: #B5C0D0; border: 0px; border-radius: 8px; line-height: 30px; font-size: 12px;"
						class="box-info-key" onclick="editAmount()">Edit Amount</button>
				</li>

				<li
					style="display: flex; flex-direction: column; justify-content: space-around; background-color: #000000a9;">
					<div>
						<i class="fa-solid fa-clock-rotate-left" style="font-size: 40px;"></i>
					</div> <a href="#history" style="background-color: transparent;"
					class="box-info-key">History</a>
				</li>
			</ul>

			<section class="wallet">
				<div class="tabContainer">
					<input type="text" id="showMessage"
						style="text-align: center; margin: auto; display: block; width: 100%; height: 30px; font-size: 20px; border: 0px; background-color: transparent;"
						value="<%=request.getAttribute(" status")%>" readonly>
					<div class="buttonContainer">
						<button onclick="showPanel(0, '#B7C9F2')">Expense</button>
						<button onclick="showPanel(1, '#B7C9F2')">Income</button>
						<button onclick="showPanel(2, '#B7C9F2')">Transfer</button>
					</div>

					<script>
						var x = document.getElementById('showMessage').value;
						var y = document.getElementById('showMessage');
						if (x === "null") {
							y.style.display = "none";
						} else if (x === "User is not avaliable!") {
							y.style.color = "red";
						} else if (x === "Transfer process is done successfully!"
								|| x === "Income process is done successfully!"
								|| x === "Expense process is done successfully!") {
							y.style.color = "green";
						}
					</script>

					<!-- Location Script -->
					<script>
						const x = document.getElementById("demo1");

						function getLocation() {
							if (navigator.geolocation) {
								navigator.geolocation
										.getCurrentPosition(showPosition);
							} else {
								x.innerHTML = "Geolocation is not supported by this browser.";
							}
						}

						function showPosition(position) {
							x.innerHTML = "Done!";
						}
					</script>
					<div class="tabPanel">
						<form action="expense" method="POST">
							<div class="sub_tabPanel">
								<h3>MMK</h3>
								<input type="number" placeholder="-0" class="showMoney"
									style="color: red;" name="exp_amount" required>
							</div>
							<h4
								style="background-color: #322c2c; text-align: left; height: 80px; font-weight: lighter; line-height: 80px; padding: 20px;">
								General</h4>

							<div class="options">
								<div>
									<i class="fa-solid fa-list"></i> <label for="category">Category</label>
								</div>
								<select name="exp_category" id="category" class="inputs"
									required>
									<option value="Food & Drink">Food & Drink</option>
									<option value="Transportation">Transportation</option>
									<option value="Shopping">Shopping</option>
									<option value="Housing">Housing</option>
									<option value="Life & Entertainment">Life &
										Entertainment</option>
									<option value="Communication">Communication</option>
									<option value="Financial Expenses">Financial Expenses</option>
									<option value="Investment">Investment</option>
									<option value="Income">Income</option>
									<option value="Others">Others</option>
								</select>
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-regular fa-calendar-days"></i> <label
										for="category">Date & Time</label>
								</div>
								<input type="datetime-local" class="inputs" name="exp_date_time"
									required>
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-solid fa-pencil"></i> <label for="category">Note</label>
								</div>
								<textarea name="exp_note" id="" cols="40" rows="5"
									style="background-color: #00000033; resize: none; padding: 10px; font-size: 15px;"></textarea>
							</div>
							<hr>
							<h4
								style="background-color: #322c2c; height: 40px; margin: 10px 0px;">
							</h4>
							<input type="submit" value="Save" class="save-btn"
								onclick="processAlert()">
						</form>
					</div>

					<div class="tabPanel">
						<form action="income" method="POST">
							<div class="sub_tabPanel">
								<h3>MMK</h3>
								<input type="number" placeholder="+0" class="showMoney"
									style="color: green;" name="in_amount" required>
							</div>
							<h4
								style="background-color: #322c2c; text-align: left; height: 80px; font-weight: lighter; line-height: 80px; padding: 20px;">
								General</h4>

							<div class="options">
								<div>
									<i class="fa-solid fa-list"></i> <label for="category">Category</label>
								</div>
								<select name="in_category" id="category" class="inputs" required>
									<option value="Food & Drink">Food & Drink</option>
									<option value="Transportation">Transportation</option>
									<option value="Shopping">Shopping</option>
									<option value="Housing">Housing</option>
									<option value="Life & Entertainment">Life &
										Entertainment</option>
									<option value="Communication">Communication</option>
									<option value="Financial Expenses">Financial Expenses</option>
									<option value="Investment">Investment</option>
									<option value="Income">Income</option>
									<option value="Others">Others</option>
								</select>
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-regular fa-calendar-days"></i> <label
										for="category">Date & Time</label>
								</div>
								<input type="datetime-local" class="inputs" name="in_date_time"
									required>
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-solid fa-pencil"></i> <label for="category">Note</label>
								</div>
								<textarea name="in_note" id="" cols="40" rows="5"
									style="background-color: #00000033; resize: none; padding: 10px; font-size: 15px;"></textarea>
							</div>
							<hr>
							<h4
								style="background-color: #322c2c; height: 40px; margin: 10px 0px;">
							</h4>
							<input type="submit" value="Save" class="save-btn">
						</form>
					</div>

					<div class="tabPanel">
						<form action="transfer" method="POST">
							<div class="sub_tabPanel">
								<h3>MMK</h3>
								<input type="number" placeholder="0" class="showMoney"
									style="color: #ffffff;" name="tr_amount" required>
							</div>
							<h4
								style="background-color: #322c2c; text-align: left; height: 80px; font-weight: lighter; line-height: 80px; padding: 20px;">
								General</h4>

							<div class="options">
								<div>
									<i class="fa-solid fa-money-bill-transfer"></i> <label
										for="category">Transfer to</label>
								</div>
								<input type="text" class="inputs"
									placeholder="Enter phone number."
									style="border: 1px solid #00000033; font-size: 15px; padding: 10px;"
									name="transferTo">
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-solid fa-list"></i> <label for="category">Category</label>
								</div>
								<select name="tr_category" id="category" class="inputs" required>
									<option value="Food & Drink">Food & Drink</option>
									<option value="Transportation">Transportation</option>
									<option value="Shopping">Shopping</option>
									<option value="Housing">Housing</option>
									<option value="Life & Entertainment">Life &
										Entertainment</option>
									<option value="Communication">Communication</option>
									<option value="Financial Expenses">Financial Expenses</option>
									<option value="Investment">Investment</option>
									<option value="Income">Income</option>
									<option value="Others">Others</option>
								</select>
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-regular fa-calendar-days"></i> <label
										for="category">Date & Time</label>
								</div>
								<input type="datetime-local" class="inputs" name="tr_date_time"
									required>
							</div>
							<hr>
							<div class="options">
								<div>
									<i class="fa-solid fa-pencil"></i> <label for="category">Note</label>
								</div>
								<textarea name="tr_note" id="" cols="40" rows="5"
									style="background-color: #00000033; resize: none; padding: 10px; font-size: 15px;"></textarea>
							</div>
							<hr>
							<h4
								style="background-color: #322c2c; height: 40px; margin: 10px 0px;">
							</h4>
							<input type="submit" value="Save" class="save-btn">
						</form>
					</div>
					<script src="scripts/script2.js"></script>
				</div>
			</section>
			<script src="scripts/script.js"></script>
		</main>
		<!-- MAIN -->

		<main>
			<!-- History -->

			<section id="history" style="padding: 50px;">
				<h1>
					<i class="fa-solid fa-clock-rotate-left" style="margin: 0px 10px;"></i>History
				</h1>

				<div>
					<p>Total balance</p>
					<h3
						style="font-size: 50px; display: inline-block; color: rgb(68, 227, 68);"><%=usrAmount%></h3>
					<sub style="font-size: 20px;">MMK</sub>
				</div>
				<div
					style="width: 100%; background-color: #0000008b; border-radius: 10px; overflow-y: scroll; height: 500px;">
					<table style="width: 100%;" class="history_tbl">
						<tbody></tbody>

						<tr>
							<th style="font-size: 25px; height: 80px;" colspan="2">Wallet
								History</th>
						</tr>

						<tr>
							<th style="font-size: 20px;">Amount</th>
							<th style="font-size: 20px;">Category</th>
							<th style="font-size: 20px;">Date</th>
							<th style="font-size: 20px;">Note</th>
							<th style="font-size: 20px;">Receive From</th>
							<th style="font-size: 20px;">Send To</th>
						</tr>

						<%!Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;%>
						<%
						try {
							String sql = "SELECT * FROM wallet where user_id =" + session.getAttribute("id");
							connection = openConnection();
							statement = connection.createStatement();
							resultSet = statement.executeQuery(sql);

							while (resultSet.next()) {
						%>
						<tr>
							<td style="text-align: center;"><%=resultSet.getString("wallet_amount")%></td>
							<td style="text-align: center;"><%=resultSet.getString("category")%></td>
							<td style="text-align: center;"><%=resultSet.getString("datetime")%></td>
							<td style="text-align: center;"><%=resultSet.getString("note")%></td>
							<td style="text-align: center;"><%=resultSet.getString("receive_from")%></td>
							<td style="text-align: center;"><%=resultSet.getString("send_to")%></td>
						</tr>
						<%
						}

						} catch (Exception e) {

						}
						%>
						</tbody>
					</table>
				</div>
			</section>

		</main>
		<!-- History -->
	</section>
	<!-- CONTENT -->

	<script>
		var x = document.getElementById('positionSubmit').value;
		var y = document.getElementById('showManage');
		if (x === "member") {
			y.style.display = "none";
		} else if (x === "admin") {
			y.style.display = "block";
		}
	</script>

	<script>
		var x = document.getElementById('positionSubmit').value;
		var y = document.getElementById('content_us');
		var z = document.getElementById('contentMenu');
		if (x === "member") {
			y.style.display = "block";
			z.style.display = "block";
		} else if (x === "admin") {
			y.style.display = "none";
			z.style.display = "none";
		}
	</script>

</body>

</html>
<%@page import="model.User"%>
<%@page import="java.util.*"%>
<%@page import="static util.DBConnection.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<title>Admin</title>
<link rel="stylesheet" href="styles/manageStyle.css">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
	a{
	text-decoration: none;
	color: #ffffff;
	}
	i{
	font-size: 40px;
	}
	.menu{
	display: flex;
	flex-direction: column;
	align-items: center;
	}
	</style>
</head>

<body>
	<%!Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String imgFileName = "";
	String usrName = "";%>

	<%
	ServletContext context = request.getServletContext();
	int usrID = (int) context.getAttribute("id");
	List<User> userList = dbUserData(usrID);
	for (User user : userList) {
		usrName = user.getUsrName();
		imgFileName = user.getImgFileName();
	}
	%>
	<input type="checkbox" id="menu-toggle">
	<div class="sidebar">
		<div class="side-header">
			<h3>
				L<span>ogo</span>
			</h3>
		</div>

		<div class="side-content">
			<div class="profile">
				<img src="images/<%=imgFileName%>" class="profile-img bg-img">
				<h4><%=usrName%></h4>
				<small>Admin</small>
			</div>

			<div class="side-menu">
				<ul>
					<li><a href="main.jsp"><div  class="menu"><i class="fa-solid fa-address-card"></i>
							<small>Dashboard</small></div>
					</a></li>

					<li><a href="#" class="active"> <div class="menu"><i class="fa-solid fa-inbox"></i><small>Mailbox</small></div>
					</a></li>
					<li><a href="index.jsp">
							<div class="menu">
								<i class="fa-solid fa-house"></i><small>Home</small>
							</div>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="main-content">

		<header>
			<div class="header-content">
				<label for="menu-toggle"> <span class="las la-bars"></span>
				</label>

				<div class="header-menu">
					<div class="user">
						<div class="bg-img" style="background-image: url()"></div>
					</div>
				</div>
			</div>
		</header>


		<main>

			<div>
				<table style="width: 100%; padding: 20px;">
					<thead>
						<tr>
							<th>Name</th>
							<th style="width: 60%;">MailBoxReports</th>
							<th>Date/ Time</th>
						</tr>
					</thead>
					<tbody>
						<%
						try {
							connection = openConnection();
							statement = connection.createStatement();
							resultSet = statement.executeQuery("SELECT uname, message, datetime FROM users, feedback WHERE users.id = feedback.user_id;");
							while (resultSet.next()) {
						%>
						<tr>
							<td><%=resultSet.getString("uname")%></td>
							<td style="text-align: justify;"><%=resultSet.getString("message")%></td>
							<td><%=resultSet.getTimestamp("datetime")%></td>
						</tr>
						<%
						}
						} catch (Exception e) {
						}
						%>
					</tbody>
				</table>
			</div>
		</main>
	</div>


</body>

</html>
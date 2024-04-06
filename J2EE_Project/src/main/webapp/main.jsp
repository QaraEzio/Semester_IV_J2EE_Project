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
<title>Manage</title>
<link rel="stylesheet" href="styles/manageStyle.css">
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
a {
	text-decoration: none;
	color: #ffffff;
}

i {
	font-size: 40px;
}

.menu {
	display: flex;
	flex-direction: column;
	align-items: center;
}
</style>
</head>

<body>

	<%!String imgFileName = "";
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
				<h4>
					<%=usrName%>
				</h4>
				<small>Admin</small>
			</div>

			<div class="side-menu">
				<ul>
					<li><a href="#" class="active"><div class="menu">
								<i class="fa-solid fa-address-card"></i> <small>Dashboard</small>
							</div> </a></li>

					<li><a href="mailbox.jsp">
							<div class="menu">
								<i class="fa-solid fa-inbox"></i><small>Mailbox</small>
							</div>
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

		<%!Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;
	int countUsr = 0;
	int countMail = 0;
	String sql = "SELECT * FROM users;";
	String sql1 = "SELECT * FROM feedback;";%>
		<%
		try {
			connection = openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (resultSet.getString("position").equals("admin")) {
			continue;
				}
				countUsr++;
			}
			resultSet = statement.executeQuery(sql1);
			while(resultSet.next()) {
				countMail++;
			}
		} catch (Exception e) {

		}
		%>

		<main>

			<div class="page-header">
				<h1>ADMIN Dashboard</h1>
				<small>Home / Dashboard</small>
			</div>

			<div class="page-content">

				<div class="analytics">

					<div class="card">
						<div class="card-head">
							<h2><%=countUsr%>
								People
								<%
							countUsr = 0;
							%>
							</h2>
							<span class="las la-user-friends"></span>
						</div>
						<div class="card-progress">
							<small>Number of Users</small>

						</div>
					</div>





					<div class="card">
						<div class="card-head">
							<h2><%=countMail %> Mails <%countMail = 0; %><h2>
							<span class="las la-envelope"></span>
						</div>
						<div class="card-progress">
							<small>Total mails received</small>

						</div>
					</div>

				</div>


				<div class="records table-responsive">

					<div class="record-header">
<!-- 

						<div class="browse">
							<input type="search" placeholder="Search" class="record-search">

						</div> -->
					</div>

					<div>
						<table width="100%">
							<thead>
								<tr>
									<th>Name</th>
									<th>Userpics</th>
									<th>Contact</th>
									<th>Email</th>
									<th>BALANCE</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									int eachID = 0;
									connection = openConnection();
									statement = connection.createStatement();
									resultSet = statement.executeQuery(sql);
									while (resultSet.next()) {
										if (resultSet.getString("position").equals("admin")) {
									continue;
										}
								%>
								<tr>
									<td><%=resultSet.getString("uname")%></td>
									<td>
										<div class="client">
											<img src="images/<%=imgFileName%>" class="client-img bg-img">
											<div class="client-info">
												<h4></h4>
												<small></small>
											</div>
										</div>
									</td>
									<td><%=resultSet.getString("umobile")%></td>
									<td><%=resultSet.getString("uemail")%></td>
									<td><%=resultSet.getString("amount")%></td>
								</tr>
								<%
								}
								} catch (Exception e) {
								}
								%>
							</tbody>
						</table>
					</div>
				</div>

			</div>

		</main>

	</div>
</body>

</html>
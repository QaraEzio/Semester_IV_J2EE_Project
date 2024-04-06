<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="profile_setting">
					<div class="inputContainter">
						<button onclick="changePwd()" class="setting_key">Change
							password</button>
						<div id="input_field" style="display: none">
							<form action="changePwdControl" method="POST">
								<input name="curPassword" id="curPassword" class="inputPwd"
									type="password" placeholder="Current password" required>
								<input name="newPassword" id="newPassword" class="inputPwd"
									type="password" placeholder="New password" required> <input
									name="repPassword" id="repPassword" class="inputPwd"
									type="password" placeholder="Retype password" required>
								<button type="submit" value="Save" class="submit_btn"
									onclick="messageAlert()"
									style="color: #ffffff; background-color: blue;">Submit</button>
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
				<input id="message" type="text"
					value="<%=request.getAttribute("MSG")%>" style="display: none;">
			</div>
</body>
</html>
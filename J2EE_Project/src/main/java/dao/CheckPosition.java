package dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import static util.DBConnection.dbUserData;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class CheckPosition
 */
public class CheckPosition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static String checkPosition(int usrID) {
		String position = "";
		List<User> usersList = dbUserData(usrID);
		for(User user : usersList) {
			position = user.getPosition();
		}
		return position;
	}

}

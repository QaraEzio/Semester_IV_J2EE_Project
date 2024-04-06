
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import static util.DBConnection.*;

/**
 * Servlet implementation class TestingSpace
 */
public class TestingSpace extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection connection = null;
	static Statement statement = null;
	static ResultSet resultSet = null;
	public static void main(String[] args) {
		try {
			String sql = "SELECT uname, message, datetime FROM feedback, users WHERE users.id = user_id;";
			connection = openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
		while(resultSet.next()) {
			System.out.println(resultSet.getString("uname"));
			System.out.println(resultSet.getString("message"));
			System.out.println(resultSet.getTimestamp("datetime"));
		}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

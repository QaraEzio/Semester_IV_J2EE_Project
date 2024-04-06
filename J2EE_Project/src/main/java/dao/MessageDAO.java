package dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.swing.text.StyledEditorKit.BoldAction;

import com.mysql.cj.x.protobuf.MysqlxCursor.Open;

import static util.DBConnection.*;

/**
 * Servlet implementation class MessageDAO
 */
public class MessageDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	Message
	public static boolean message(int usrID, String message) {
		boolean isDone = false;
		try {
			String insertSQL = "INSERT INTO feedback(user_id, message) VALUES (?,?);";
			Connection connection = openConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, usrID);
			preparedStatement.setString(2, message);
			int rowInsert = preparedStatement.executeUpdate();
			if (rowInsert > 0) isDone = true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return isDone;
	}

}

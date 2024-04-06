package dao;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.mysql.cj.xdevapi.Statement;

import static util.DBConnection.*;

/**
 * Servlet implementation class ProfileDAO
 */
public class ProfileDAO {
	private static final long serialVersionUID = 1L;
       
    public static String changePwd(int usrID, String cur_pwd, String new_pwd, String rep_pwd) {
    	String message = "";
		if (new_pwd.equals(rep_pwd)) {
			try {
				String oldPassword = "";
				List<User> userList = dbUserData(usrID); 
				for(User user : userList) {
					oldPassword = user.getUsrPassword();
				}
				if (oldPassword.equals(cur_pwd)) {
					String updateSQL = "UPDATE users SET upwd = ? WHERE id = ?;";
					Connection connection = openConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(updateSQL);	
					preparedStatement.setString(1, new_pwd);
					preparedStatement.setInt(2, usrID);		
					preparedStatement.executeUpdate();
					message = "Successfully changed!";
				} else message = "Something was wrong!";
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else message = "Passwords do not match!";
		return message;
    }	
    
    public static boolean delAcc(int usrID, String del_pwd) {
    	boolean process = false;
    	String usrPassword = "";
    	List<User> userList = dbUserData(usrID);
    	for(User user : userList) {
    		usrPassword = user.getUsrPassword();
    	}
    	if (del_pwd.equals(usrPassword)) {
			try {
				String deleteUserSQL = "DELETE FROM users WHERE id = " + usrID + ";";
				String deleteWalletSQL = "DELETE FROM wallet WHERE user_id = " + usrID + ";";
				String deleteFBSQL = "DELETE FROM feedback WHERE user_id = " + usrID + ";";
				Connection connection = openConnection();
				java.sql.Statement statement = connection.createStatement();
				int process1 = statement.executeUpdate(deleteFBSQL);
				int process2 = statement.executeUpdate(deleteWalletSQL);
				int process3 = statement.executeUpdate(deleteUserSQL);
				System.out.println(process1);
				if (process1 > 0 && process2 > 0 && process3 > 0) process = true;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		}
    	return process;
    }
    public static void main(String[] args) {
		delAcc(12, "susu1234");
	}
}

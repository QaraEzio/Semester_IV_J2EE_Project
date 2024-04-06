package util;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import dao.WalletDAO;
import jakarta.servlet.http.HttpServlet;
import model.User;



/**
 * Servlet implementation class DBConnection
 */
public class DBConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final java.lang.String DBURL = "jdbc:mysql://localhost/projectusers";
	private static final java.lang.String DBUSERNAME = "root";
	private static final java.lang.String DBPASSWORD = "adminns";
       
    public static Connection openConnection() {
    	Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(DBURL, DBUSERNAME, DBPASSWORD);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return connection;
	}
    
    public static List<User> dbUserData(int id){
    	List<User> userList = new ArrayList<User>();
    	User user = new User();
    	try {
    		java.lang.String selectSQL = "SELECT * FROM users WHERE id = " + id + ";";
			Connection connection = openConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(selectSQL);
			while(resultSet.next()) {
				user.setUsrID(resultSet.getInt("id"));
				user.setUsrName(resultSet.getString("uname"));
				user.setUsrPassword(resultSet.getString("upwd"));
				user.setUsrEmail(resultSet.getString("uemail"));
				user.setUsrPhoneNo(resultSet.getString("umobile"));
				user.setUsrAmount(resultSet.getDouble("amount"));
				user.setPosition(resultSet.getString("position"));
				user.setImgFileName(resultSet.getString("imageFileName"));
				userList.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
    	return userList;
    }

}

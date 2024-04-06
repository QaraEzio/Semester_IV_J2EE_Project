package dao;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.DBConnection;

import static util.DBConnection.*;

import java.awt.datatransfer.Transferable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mysql.cj.jdbc.Blob;
import com.mysql.cj.xdevapi.ExprParser;
import controller.IncomeController;
import model.User.*;

/**
 * Servlet implementation class WalletDAO
 */
public class WalletDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Connection connection = null;
	static PreparedStatement preparedStatement = null;
	static java.sql.Statement statement = null;
	static ResultSet resultSet = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WalletDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("usrAmount", showAmount(1));
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

//	Show balance 
	public static double showAmount(int id) {
		double usrAmount = 0.0;
		List<User> userList = dbUserData(id);
		for (User user : userList) {
			usrAmount = user.getUsrAmount();
		}
		return usrAmount;
	}

//	Income function
	public boolean incomeAmount(int user_id, double incomeAmount, String category, String date_time, String note,
			String location, String img) {
		if(note.isEmpty()) {
	        note = "-";
	      }
		boolean process = false;
		List<User> userList = dbUserData(user_id);
		double usrAmount = 0.0;
		for (User user : userList) {
			usrAmount = user.getUsrAmount();
			usrAmount += incomeAmount;
		}
		try {
			String updAmount = "UPDATE users SET amount = ? WHERE id = ?;";
			connection = openConnection();
			preparedStatement = connection.prepareStatement(updAmount);
			preparedStatement.setDouble(1, usrAmount);
			preparedStatement.setInt(2, user_id);
			int process1 = preparedStatement.executeUpdate();

			String insertWallet = "INSERT INTO wallet(user_id, wallet_amount, category, datetime, note) VALUES (?,?,?,?,?);";
			preparedStatement = connection.prepareStatement(insertWallet);
			preparedStatement.setInt(1, user_id);
			preparedStatement.setString(2, "+" + incomeAmount);
			preparedStatement.setString(3, category);
			preparedStatement.setString(4, date_time);
			preparedStatement.setString(5, note);
			
			int process2 = preparedStatement.executeUpdate();

			if (process1 > 0 && process2 > 0) {
				process = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return process;
	}

//	public static void main(String[] args) {
//		WalletDAO objDao = new WalletDAO();
//		if (objDao.incomeAmount(1, 5000, "hello", "29-2-2024", "hello testing", "aung chan thar", null, "Ko Ko",
//				"Ku Kue")) {
//			System.out.println("Done");
//		} else {
//			System.out.println("fail");
//		}
//	}

//	Expense function
	public boolean expenseAmount(int user_id, double expenseAmount, String category, String date_time, String note,
			String location, Blob img, String receive_from, String send_to) {
		if(note.isEmpty()) {
	        note = "-";
	      }
		boolean process = false;
		List<User> userList = dbUserData(user_id);
		double usrAmount = 0.0;
		for (User user : userList) {
			usrAmount = user.getUsrAmount();
			usrAmount -= expenseAmount;
		}
		try {
			String updAmount = "UPDATE users SET amount = ? WHERE id = ?;";
			connection = openConnection();
			preparedStatement = connection.prepareStatement(updAmount);
			preparedStatement.setDouble(1, usrAmount);
			preparedStatement.setInt(2, user_id);
			int process1 = preparedStatement.executeUpdate();

			String insertWallet = "INSERT INTO wallet(user_id, wallet_amount, category, datetime, note) VALUES (?,?,?,?,?);";
			preparedStatement = connection.prepareStatement(insertWallet);
			preparedStatement.setInt(1, user_id);
			preparedStatement.setString(2, "-" + expenseAmount);
			preparedStatement.setString(3, category);
			preparedStatement.setString(4, date_time);
			preparedStatement.setString(5, note);
			int process2 = preparedStatement.executeUpdate();

			if (process1 > 0 && process2 > 0) {
				process = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return process;
	}

	// Transfer to 
	public boolean trasferto(int id, String phoneno, double trasferAmount, String category,  String date,String note,
			String location, String img) {
		if(note.isEmpty()) {
	        note = "-";
	      }
		double amount = 0.0;
		boolean success = false;
		double sendAmount = 0.0;

		String receive_from = null;
		String send_to = null;
		int userid = 0;
		try {
			Connection con = DBConnection.openConnection();

			String mobile = null;
//			Statement statement = con.createStatement();
			Statement statement = con.createStatement();

			String getPhoneno = "select * from users where umobile = '" + phoneno + "';";

			ResultSet getPh =statement.executeQuery(getPhoneno);

			while (getPh.next()) {

				mobile = getPh.getString("umobile");
				userid = getPh.getInt("id");

			}
			if (id != userid && mobile != null) {
				String sql = "select * from users where umobile = '" + phoneno + "';";

				ResultSet rs = statement.executeQuery(sql);

				while (rs.next()) {
					amount = rs.getDouble("amount");
					send_to = rs.getString("uname");

				}

				String update = "update users set amount = ? where umobile = ?";

				PreparedStatement pre = con.prepareStatement(update);

				pre.setDouble(1, (amount + trasferAmount));
				pre.setString(2, phoneno);

				int rowUpdae = pre.executeUpdate();

				String sql_1 = "select * from users where id = " + id;
				Statement statement_1 = (Statement) con.createStatement();

				ResultSet rs_1 =  statement_1.executeQuery(sql_1);
				while (rs_1.next()) {
					sendAmount = rs_1.getDouble("amount");
					receive_from = rs_1.getString("uname");

				}

				String update_1 = "update users set amount=? where id = ?";
				PreparedStatement pre_1 = con.prepareStatement(update_1);
				pre_1.setDouble(1, (sendAmount - trasferAmount));
				pre_1.setInt(2, id);

				int rowUpdate_1 = pre_1.executeUpdate();

			}

			String sqlwallet = "INSERT INTO wallet (user_id,wallet_amount,category,datetime, note, receive_from, send_to) VALUES (?,?,?,?,?,?,?);";
			PreparedStatement walletpre = con.prepareStatement(sqlwallet);
			walletpre.setInt(1, userid);
			walletpre.setString(2, ("+" + Double.toString(trasferAmount)));
			walletpre.setString(3, category);
			walletpre.setString(4, date);
			walletpre.setString(5, note);
			walletpre.setString(6, receive_from);
			walletpre.setString(7, "-");
			int walletUpdate1 = walletpre.executeUpdate();

			String sqlwallet2 = "INSERT INTO wallet (user_id, wallet_amount, category, datetime, note, receive_from, send_to) VALUES (?,?,?,?,?,?,?);";
			PreparedStatement receivePerson = con.prepareStatement(sqlwallet);
			receivePerson.setInt(1, id);
			receivePerson.setString(2, ("-" + Double.toString(trasferAmount)));
			receivePerson.setString(3, category);
			receivePerson.setString(4, date);
			receivePerson.setString(5, note);
			receivePerson.setString(6, "-");
			receivePerson.setString(7, send_to);

			int walletUpdate = receivePerson.executeUpdate();
			if(walletUpdate > 0) {
				success = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return success;
	}
	
//	Edit amount
	public static boolean editAmount(int usrID, double editedAmount) {
		boolean isDone = false;
		try {
			String updateSQL = "UPDATE users SET amount = " + editedAmount + " WHERE id = " + usrID + ";";
			connection = openConnection();
			statement = connection.createStatement();
			int process = statement.executeUpdate(updateSQL);
			System.out.println(process);
			if (process > 0) {
				isDone = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return isDone;
	}

}

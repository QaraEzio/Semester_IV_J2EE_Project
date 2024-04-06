package controller;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.DBConnection;

import static util.DBConnection.dbUserData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.mysql.cj.Session;

import static dao.CheckPosition.*;

//import dao.ExpenseAndIncome;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	Connection connection = null;
//	ExpenseAndIncome expin = new ExpenseAndIncome();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uemail = request.getParameter("username");
		String upwd = request.getParameter("password");
//		double amount = Double.parseDouble(request.getParameter("amount"));

		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		RequestDispatcher dispatcher1 = null;
		RequestDispatcher dis = null;
		RequestDispatcher dis1 = null;
		RequestDispatcher dis2 = null;
		ServletContext context = request.getServletContext();
		
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	connection = DBConnection.openConnection();
//	    	connection = DriverManager.getConnection("jdbc:mysql://localhost/projectusers?useSSL=false","root","kukue@014");
	    	PreparedStatement pst = connection.prepareStatement("select * from users where uemail = ? and upwd = ?");
			pst.setString(1, uemail);
			pst.setString(2, upwd);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				context.setAttribute("id", rs.getInt("id"));
				session.setAttribute("id", rs.getInt("id"));
				session.setAttribute("name", rs.getString("uname"));
				session.setAttribute("amount", rs.getString("amount"));
				session.setAttribute("email", rs.getString("uemail"));
				session.setAttribute("contact", rs.getString("umobile"));
			    
			    int usrID = (int) context.getAttribute("id");
				context.setAttribute("positionAlert", checkPosition(usrID));
				dispatcher = request.getRequestDispatcher("index.jsp");
				dis= request.getRequestDispatcher("AddImage");
				dis1= request.getRequestDispatcher("DisplayServlet");
				dis2= request.getRequestDispatcher("delete");
//			dispatcher = request.getRequestDispatcher("expense");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
				
			}
//			session.getAttribute("finalAmount");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

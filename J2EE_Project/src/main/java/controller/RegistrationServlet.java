package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.CheckMailPhone;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub

    String uname = request.getParameter("name");
    String pass = request.getParameter("pass");
    String re_pass = request.getParameter("re_pass");

    String uemail = request.getParameter("email");
    String umobile = request.getParameter("contact");
    String checkMobile = null;
    String checkMail = null;
    String upwd = null;

    RequestDispatcher dispatcher = null;
    PrintWriter out = response.getWriter();
    Connection con = null;

    CheckMailPhone checkdao = new CheckMailPhone();
    if (checkdao.check(uemail, umobile)) {
      dispatcher = request.getRequestDispatcher("registration.jsp");
      request.setAttribute("status", "failed");
      dispatcher.forward(request, response);

    } else {

      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DBConnection.openConnection();

        // Check Same password
        if (pass.equals(re_pass)) {
          upwd = pass;
          con = DBConnection.openConnection();
          PreparedStatement pst = con
              .prepareStatement("insert into users(uname,upwd,uemail,umobile) values(?,?,?,?) ");
          pst.setString(1, uname);
          pst.setString(2, upwd);
          pst.setString(3, uemail);
          pst.setString(4, umobile);

          int rowcount = pst.executeUpdate();
          double wallet_amount = 0.00;
          int userid = 0;
          Statement stm = con.createStatement();
          ResultSet rs = stm.executeQuery("select * from users");

          while (rs.next()) {
            userid = rs.getInt("id");
            wallet_amount = rs.getDouble("amount");

          }
//            PreparedStatement walletPre= con.prepareStatement("insert into wallet (user_id,wallet_amount) values (?,?)");
//            walletPre.setInt(1, userid);
//            walletPre.setDouble(2, wallet_amount);
//            int rowWallet = walletPre.executeUpdate();
          
          if (rowcount > 0) {
            dispatcher = request.getRequestDispatcher("registration.jsp");
            request.setAttribute("status", "success");

          } else {
        	  dispatcher = request.getRequestDispatcher("registration.jsp");
              request.setAttribute("status", "failed");
          }

        } else {
          dispatcher = request.getRequestDispatcher("registration.jsp");
          request.setAttribute("status", "notSame");

        }

//        
        dispatcher.forward(request, response);
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        try {
          con.close();
        } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
        }

      }

    }
  }

}
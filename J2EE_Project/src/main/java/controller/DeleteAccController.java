package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.ProfileDAO;
import static dao.CheckPosition.*;

/**
 * Servlet implementation class deleteAccController
 */
@WebServlet("/deleteAccControl")
public class DeleteAccController extends HttpServlet {
	private static final long serialVersionUID = 1L;
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

//		Delete Account 
		ServletContext context = req.getServletContext();
		int usrID = (int) context.getAttribute("id");
		String delPwd = req.getParameter("delPassword");
		if(ProfileDAO.delAcc(usrID, delPwd)) {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		else 
		{
			req.setAttribute("MSG", "Password is wrong!");
			req.getRequestDispatcher("profile.jsp").forward(req, resp);
		}
	}
}

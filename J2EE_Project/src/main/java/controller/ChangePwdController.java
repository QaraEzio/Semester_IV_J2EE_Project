package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

import dao.ProfileDAO;
import static dao.CheckPosition.*;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet("/changePwdControl")
public class ChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
		
//		Change Password
			ServletContext context = req.getServletContext();
			int usrID = (int) context.getAttribute("id");
			String cur_pwd = req.getParameter("curPassword");
			String new_pwd = req.getParameter("newPassword");
			String rep_pwd = req.getParameter("repPassword");
			String message = ProfileDAO.changePwd(usrID, cur_pwd, new_pwd, rep_pwd);
			req.setAttribute("curPassword", cur_pwd);
			req.setAttribute("newPassword", new_pwd);
			req.setAttribute("repPassword", rep_pwd);
			req.setAttribute("MSG", message);
			req.getRequestDispatcher("profile.jsp").forward(req, resp);
		}
}

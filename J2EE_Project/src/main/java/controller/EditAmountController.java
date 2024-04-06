package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.WalletDAO;
import static dao.CheckPosition.*;

/**
 * Servlet implementation class EditAmountController
 */
@WebServlet("/editAmount")
public class EditAmountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		double editAmount = Double.parseDouble(request.getParameter("editAmount"));
		ServletContext context = request.getServletContext();
		int usrID = (int) context.getAttribute("id");
		WalletDAO.editAmount(usrID, editAmount);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}

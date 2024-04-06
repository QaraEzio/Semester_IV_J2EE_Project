package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.mysql.cj.jdbc.Blob;

import dao.WalletDAO;

import static dao.CheckPosition.*;

/**
 * Servlet implementation class WalletController
 */
@WebServlet("/expense")
public class ExpenseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		int user_id = (int) context.getAttribute("id");
		double expenseAmount = Double.parseDouble(request.getParameter("exp_amount"));
		String category = request.getParameter("exp_category");
		String date_time = request.getParameter("exp_date_time");
		String note = request.getParameter("exp_note");
		String location = request.getParameter("exp_location");
		String img = request.getParameter("exp_img");
		String receive_from = request.getParameter("exp_receive_from");
		String send_to = request.getParameter("exp_send_to");
		
		WalletDAO objDao = new WalletDAO();
		String status = "";
		if (objDao.expenseAmount(user_id, expenseAmount, category, date_time, note, location, null, receive_from, send_to)) 
			status = "Expense process is done successfully!";
		else status = "Expense process is failed!";
		request.setAttribute("status", status);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}

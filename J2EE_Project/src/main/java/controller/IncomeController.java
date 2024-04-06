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
@WebServlet("/income")
public class IncomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		int user_id = (int) context.getAttribute("id");
		double incomeAmount = Double.parseDouble(request.getParameter("in_amount"));
		String category = request.getParameter("in_category");
		String date_time = request.getParameter("in_date_time");
		String note = request.getParameter("in_note");
		String location = request.getParameter("in_location");
		String img = request.getParameter("in_img");

		WalletDAO objDao = new WalletDAO();
		String status = "";
		if (objDao.incomeAmount(user_id, incomeAmount, category, date_time, note, location, null)) 
			status = "Income process is done successfully!";
		else status = "Income process is failed!";
		request.setAttribute("status", status);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}

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
 * Servlet implementation class TransferController
 */
@WebServlet("/transfer")
public class TransferController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		int user_id = (int) context.getAttribute("id");
		String recPhoneNo = request.getParameter("transferTo");
		double transferAmount = Double.parseDouble(request.getParameter("tr_amount"));
		String category = request.getParameter("tr_category");
		String date_time = request.getParameter("tr_date_time");
		String note = request.getParameter("tr_note");
		String location = request.getParameter("tr_location");
		String img = request.getParameter("tr_img");
		String receive_from = request.getParameter("tr_receive_from");
		String send_to = request.getParameter("tr_send_to");

		WalletDAO objDao = new WalletDAO();
		String status = "";
		if (objDao.trasferto(user_id, recPhoneNo, transferAmount, category, date_time, note, location,img))
			status = "Expense process is done successfully!";
		else
			status = "Expense process is failed!";
		request.setAttribute("status", status);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}

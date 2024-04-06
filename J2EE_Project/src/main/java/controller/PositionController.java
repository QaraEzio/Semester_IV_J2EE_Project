package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;

import dao.MessageDAO;

import static util.DBConnection.*;
import model.User;
import static dao.CheckPosition.*;

/**
 * Servlet implementation class MessageController
 */@WebServlet("/message")
public class PositionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = request.getServletContext();
		int usrID = (int) context.getAttribute("id");
		String message = request.getParameter("msg");
		if (MessageDAO.message(usrID, message)) request.setAttribute("msg", "Thanks for your message!"); 
		else request.setAttribute("msg", "Something wrong!");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
}

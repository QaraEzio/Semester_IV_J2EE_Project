package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import static util.DBConnection.*;
import static dao.CheckPosition.*;
@MultipartConfig
@WebServlet("/AddImage")
public class AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context  = request.getServletContext();
//		dao.ExpenseAmount(id, expenseAmount);
//		double incomeAmount =Double.parseDouble(request.getParameter("incomeAmount"));
		HttpSession session = request.getSession();
		
		
		System.out.println("In do post method of Add Image servlet.");
		Part file=request.getPart("image");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		System.out.println("Selected Image File Name : "+imageFileName);
		
		
		String uploadPath="/Users/kukue/Documents/University of Computer Studies, Yangon/Major Elective/J2EE-Project/src/main/webapp/images"+imageFileName;  // upload path where we have to upload our actual image
		System.out.println("Upload Path : "+uploadPath);
		// Uploading our selected image into the images folder
		try
		{
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//**********************
		//getting database connection (jdbc code)
		Connection connection=null;
		try 
		{
			connection = openConnection();
			PreparedStatement stmt;
			int id = (Integer)context.getAttribute("id");
			String query="UPDATE users SET imageFileName = ? WHERE id = ?;";
			stmt=connection.prepareStatement(query);
			stmt.setString(1,imageFileName);
			stmt.setInt(2, id);
			int row=stmt.executeUpdate(); // it returns no of rows affected.
			
			if(row>0)
			{
				System.out.println("Image added into database successfully.");
			}
			
			else
			{
				System.out.println("Failed to upload image.");
			}
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		response.sendRedirect("profile.jsp");
	}

}
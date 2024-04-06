package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBConnection;

public class CheckMailPhone {
	static String checkMail = null;
	static String checkPhone = null;

	public boolean check(String uemai, String umobile) {
		boolean flag = false;
		
	

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/projectusers","root","kukue@014");
			String sql = "select uemail,umobile from users";
			
			

			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			
			while(rs.next()) {
				checkMail = rs.getString("uemail");
				
				checkPhone = rs.getString("umobile");
				
				if(uemai.equals(checkMail) || umobile.equals(checkPhone)) {
					
					flag = true;
					break;
				}
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;

	}

}

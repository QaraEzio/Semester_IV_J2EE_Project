package model;

import jakarta.servlet.http.HttpServlet;

/**
 * Servlet implementation class User
 */
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int usrID = 0;
    private java.lang.String usrName = "";
    private java.lang.String usrPassword = "";
    private java.lang.String usrEmail = "";
    private java.lang.String usrPhoneNo = "";
    private double usrAmount = 0.0;
    private String position = "";
    private String imgFileName = "";
    
    
	public int getUsrID() {
		return usrID;
	}
	public void setUsrID(int usrID) {
		this.usrID = usrID;
	}
	public java.lang.String getUsrName() {
		return usrName;
	}
	public void setUsrName(java.lang.String usrName) {
		this.usrName = usrName;
	}
	public java.lang.String getUsrPassword() {
		return usrPassword;
	}
	public void setUsrPassword(java.lang.String usrPassword) {
		this.usrPassword = usrPassword;
	}
	public java.lang.String getUsrEmail() {
		return usrEmail;
	}
	public void setUsrEmail(java.lang.String usrEmail) {
		this.usrEmail = usrEmail;
	}
	public java.lang.String getUsrPhoneNo() {
		return usrPhoneNo;
	}
	public void setUsrPhoneNo(java.lang.String usrPhoneNo) {
		this.usrPhoneNo = usrPhoneNo;
	}
	public double getUsrAmount() {
		return usrAmount;
	}
	public void setUsrAmount(double usrAmount) {
		this.usrAmount = usrAmount;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	
}

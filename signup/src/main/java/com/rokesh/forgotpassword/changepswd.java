package com.rokesh.forgotpassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class changepswd
 */
@WebServlet("/changepswd")
public class changepswd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pswd = request.getParameter("pwd");
		String cpswd = request.getParameter("cpwd");
		String email=request.getParameter("email");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(pswd == null || pswd.equals(""))
		{
			request.setAttribute("status", "invalidpassword");
			dispatcher = request.getRequestDispatcher("confirmpwd.jsp");
			dispatcher.forward(request, response);
		}
		if(cpswd == null || cpswd.equals(""))
		{
			request.setAttribute("status", "invalidpassword");
			dispatcher = request.getRequestDispatcher("confirmpwd.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?useSSL=false","root","Rokesh@17"); 
			PreparedStatement pst = con.prepareStatement("update student set pswd=? where email=?");
			pst.setString(1, cpswd);
			pst.setString(2, email);
			
			int i = pst.executeUpdate();
			if(i== 1) {
				dispatcher = request.getRequestDispatcher("student-staffdashboard.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("forgot.jsp");
			}
			dispatcher.forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
	}

}
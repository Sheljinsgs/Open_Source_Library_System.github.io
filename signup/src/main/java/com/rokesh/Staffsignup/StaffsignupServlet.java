package com.rokesh.Staffsignup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffsignupServlet
 */
@WebServlet("/StaffsignupServlet")
public class StaffsignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
		String staffid = request.getParameter("Staffid");
		String email = request.getParameter("email");
		String pswd = request.getParameter("pass");
		String repswd = request.getParameter("re_pass");
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(uname ==  null || uname.equals(""))
		{
			request.setAttribute("status", "invaliduname");
			dispatcher = request.getRequestDispatcher("Staffsignup.jsp");
			dispatcher.forward(request, response);
		}
		if(staffid ==  null || staffid.equals(""))
		{
			request.setAttribute("status", "invalidstaffid");
			dispatcher = request.getRequestDispatcher("Staffsignup.jsp");
			dispatcher.forward(request, response);
		}
		if(email ==  null || email.equals(""))
		{
			request.setAttribute("status", "invalidemail");
			dispatcher = request.getRequestDispatcher("Staffsignup.jsp");
			dispatcher.forward(request, response);
		}
		if(pswd ==  null || pswd.equals(""))
		{
			request.setAttribute("status", "invalidpswd");
			dispatcher = request.getRequestDispatcher("Staffsignup.jsp");
			dispatcher.forward(request, response);
		}
		else if(!pswd.equals(repswd))
		{
			request.setAttribute("status", "invalidrepswd");
			dispatcher = request.getRequestDispatcher("Staffsignup.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?useSSL=false","root","Rokesh@17"); 
			PreparedStatement pst = con.prepareStatement("insert into staff(uname,staffid,email,pswd) values(?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, staffid);
			pst.setString(3, email);
			pst.setString(4, pswd);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("Staffsignup.jsp");
			if(rowCount >0) {
				request.setAttribute("status", "success");
			}
			else {
				request.setAttribute("status", "failed");

			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	}


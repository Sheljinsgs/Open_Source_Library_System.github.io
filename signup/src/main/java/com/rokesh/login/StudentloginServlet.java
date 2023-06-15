package com.rokesh.login;

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
 * Servlet implementation class StudentloginServlet
 */
@WebServlet("/StudentloginServlet")
public class StudentloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rollno = request.getParameter("rollno");
		String pswd = request.getParameter("pswd");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(rollno == null || rollno.equals(""))
		{
			request.setAttribute("status", "invalidrollno");
			dispatcher = request.getRequestDispatcher("Studentlogin.jsp");
			dispatcher.forward(request, response);
		}
		if(pswd == null || pswd.equals(""))
		{
			request.setAttribute("status", "invalidpswd");
			dispatcher = request.getRequestDispatcher("Studentlogin.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?useSSL=false","root","Rokesh@17"); 
			PreparedStatement pst = con.prepareStatement("select * from student where rollno = ? and pswd = ?");
			pst.setString(1, rollno);
			pst.setString(2, pswd);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("name", rs.getString("uname"));
				dispatcher = request.getRequestDispatcher("student-staffdashboard.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("Studentlogin.jsp");
			}
			dispatcher.forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
	}

}

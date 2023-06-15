package com.rokesh.Studentsignup;

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
 * Servlet implementation class StudentsignupServlet
 */
@WebServlet("/StudentsignupServlet")
public class StudentsignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
		String rollno = request.getParameter("Rollno");
		String email = request.getParameter("email");
		String pswd = request.getParameter("pass");
		String repswd = request.getParameter("re_pass");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(uname ==  null || uname.equals(""))
		{
			request.setAttribute("status", "invaliduname");
			dispatcher = request.getRequestDispatcher("Studentsignup.jsp");
			dispatcher.forward(request, response);
		}
		if(rollno ==  null || rollno.equals(""))
		{
			request.setAttribute("status", "invalidrollno");
			dispatcher = request.getRequestDispatcher("Studentsignup.jsp");
			dispatcher.forward(request, response);
		}
		if(email ==  null || email.equals(""))
		{
			request.setAttribute("status", "invalidemail");
			dispatcher = request.getRequestDispatcher("Studentsignup.jsp");
			dispatcher.forward(request, response);
		}
		if(pswd ==  null || pswd.equals(""))
		{
			request.setAttribute("status", "invalidpswd");
			dispatcher = request.getRequestDispatcher("Studentsignup.jsp");
			dispatcher.forward(request, response);
		}
		else if(!pswd.equals(repswd))
		{
			request.setAttribute("status", "invalidrepswd");
			dispatcher = request.getRequestDispatcher("Studentsignup.jsp");
			dispatcher.forward(request, response);
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?useSSL=false","root","Rokesh@17"); 
			PreparedStatement pst = con.prepareStatement("insert into student(uname,rollno,email,pswd) values(?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, rollno);
			pst.setString(3, email);
			pst.setString(4, pswd);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("Studentsignup.jsp");
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
			} 
		catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

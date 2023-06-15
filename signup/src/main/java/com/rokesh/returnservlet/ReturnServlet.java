package com.rokesh.returnservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReturnServlet")
public class ReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RollNo = request.getParameter("RollNo");
		String BookId = request.getParameter("BookId");
		String status ="Returned";
		String msg;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Rokesh@17");
			PreparedStatement ps = con.prepareStatement("delete from issuedbook where AccNo=?");
			ps.setString(1, BookId);
			int res = ps.executeUpdate();
			if(res==1) {
				PreparedStatement pst = con.prepareStatement("insert into bookhistory values(curdate(),?,?,?)");
				pst.setString(1, RollNo);
				pst.setString(2, BookId);
				pst.setString(3, status);
				pst.executeUpdate();
				msg = "Returned Successfully";
			}
			else {
				msg = "This book cannot issued";
			}
			System.out.println(msg);
			RequestDispatcher rd;
			request.setAttribute("status", msg);
			rd = request.getRequestDispatcher("Return.jsp");
			rd.forward(request,response);
		}
		catch(Exception e) {
			System.out.println("Exception in return page "+e);
		}
	}

}

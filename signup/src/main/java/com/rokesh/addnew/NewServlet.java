package com.rokesh.addnew;

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


@WebServlet("/NewServlet")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String col1 = request.getParameter("col1");
		String col2 = request.getParameter("col2");
		String col3 = request.getParameter("col3");
		String col4 = request.getParameter("col4");
		String col5 = request.getParameter("col5");
		String col6 = request.getParameter("col6");
		String col7 = request.getParameter("col7");
		String col8 = request.getParameter("col8");
		String status = "Available";
		String msg="";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Eshwaran@123");
			PreparedStatement st = con.prepareStatement("select * from bookdetails where AccNo=?");
			st.setString(1,col1);
			ResultSet rs = st.executeQuery();
			int count=0;
			while(rs.next())
				count++;
				
			if(count==0) {
					PreparedStatement stmt = con.prepareStatement("insert into bookDetails(AccNo,Accession,Author,Title,Publisher,Price,Edition,BookYear,CallNo,Book_status) values(?,curdate(),?,?,?,?,?,?,?,?)");
					stmt.setString(1, col1);
					stmt.setString(2, col2);
					stmt.setString(3, col3);
					stmt.setString(4, col4);
					stmt.setString(5, col5);
					stmt.setString(6, col6);
					stmt.setString(7, col7);
					stmt.setString(8, col8);
					stmt.setString(9, status);
					int i = stmt.executeUpdate();
					if(i==1)
						msg="Added Successfully";
			}
			else {
				msg = "This Accession Number is already exist in the library";
			}
			RequestDispatcher rd;
			request.setAttribute("status", msg);
			rd = request.getRequestDispatcher("New.jsp");
			rd.forward(request,response);
		}
		catch(Exception e) {
			System.out.println("Exception on Issue Page" + e);
		}
	}

}
package com.rokesh.issue;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public IssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RollNo = request.getParameter("RollNo");
		String BookId = request.getParameter("BookId");
		String status = "Issued";
		String msg;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Rokesh@17");
			PreparedStatement st = con.prepareStatement("select * from bookdetails where AccNo=?");
			st.setString(1,BookId);
			ResultSet rs = st.executeQuery();
			int count=0;
			while(rs.next())
				count++;
				
			if(count==1) {
				PreparedStatement query = con.prepareStatement("select * from issuedbook where AccNo=?");
				query.setString(1,BookId);
				ResultSet rst = query.executeQuery();
				while(rst.next())
					count++;
				if(count==1) {
					PreparedStatement stmt = con.prepareStatement("insert into issuedbook values(?,curdate(),?)");
					stmt.setString(1, BookId);
					stmt.setString(2, RollNo);
					stmt.executeUpdate();
					msg="Issued Successfully";
					
					PreparedStatement pst = con.prepareStatement("insert into bookhistory values(curdate(),?,?,?)");
					pst.setString(1, RollNo);
					pst.setString(2, BookId);
					pst.setString(3, status);
					pst.executeUpdate();
				}
				else {
					msg = "This Book is already issued";
				}
			}
			else {
				msg = "This Accession Number Not exist in the IT library";
			}
			System.out.println(msg);
			RequestDispatcher rd;
			request.setAttribute("status", msg);
			rd = request.getRequestDispatcher("issue.jsp");
			rd.forward(request,response);
		}
		catch(Exception e) {
			System.out.println("Exception on Issue Page" + e);
		}
	}

}

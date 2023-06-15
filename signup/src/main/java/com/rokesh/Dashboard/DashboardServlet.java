package com.rokesh.Dashboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Method call successfully");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Rokesh@17");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from bookDetails");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<LINK REL=\"StyleSheet\" HREF=\"DashboardStyle.css\" TYPE=\"text/css\"> ");
			out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n"
					+ "    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<div class=\"container\">\r\n"
					+ "        <div class=\"search-bar\">\r\n"
					+ "            <input type=\"text\" class=\"searchbar\" placeholder=\"Search here ...\" name=\"search\" onkeyup=\"Check()\">\r\n"
					+ "        </div>\r\n"
					+ "    </div>");
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Accession</th>");
			out.println("<th>Author</th>");
			out.println("<th>Title</th>");
			out.println("<th>Publisher</th>");
			out.println("<th>Status</th>");
			out.println("</tr>");
			while(rs.next()) {
				out.println("<tr>");
				out.println("<td class=\"AccNo\">"+rs.getString("AccNo")+"</td>");
				out.println("<td class=\"Author\">"+rs.getString("Author")+"</td>");
				out.println("<td class=\"Title\">"+rs.getString("Title")+"</td>");
				out.println("<td class=\"Publisher\">"+rs.getString("Publisher")+"</td>");
				out.println("<td class=\"Status\">Available</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("</body>");
			out.println("<script src=\"Dashboard.js\"></script>");
			out.println("</html>");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}

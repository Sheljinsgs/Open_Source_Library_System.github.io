package com.rokesh.history;

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


@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Eshwaran@123");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT BookHistory.Transaction_date , BookHistory.RollNo ,BookHistory.AccNo,BookHistory.Book_status, bookDetails.Title, bookDetails.Author, bookDetails.Publisher , bookDetails.Edition FROM BookHistory INNER  JOIN bookDetails ON BookHistory.AccNo=bookDetails.AccNo;");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<LINK REL=\"StyleSheet\" HREF=\"dashboardStyle.css\" TYPE=\"text/css\"> ");
			out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n"
					+ "    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<div class=\"container\">\r\n"
					+ "        <div class=\"search-bar\">\r\n"
					+ "            <input type=\"text\" class=\"searchbar\" placeholder=\"Search here ...\" name=\"search\" onkeyup=\"CheckHistory()\">\r\n"
					+ "        </div>\r\n"
					+ "    </div>");
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>Date</th>");
			out.println("<th>Roll No</th>");
			out.println("<th>Acc No</th>");
			out.println("<th>Status</th>");
			out.println("<th>Title</th>");
			out.println("<th>Author</th>");
			out.println("<th>Publisher</th>");
			out.println("<th>Edition</th>");
			out.println("</tr>");
			while(rs.next()) {
				out.println("<tr>");
				out.println("<td class=\"Date\">"+rs.getString("Transaction_date")+"</td>");
				out.println("<td class=\"RollNo\">"+rs.getString("RollNo")+"</td>");
				out.println("<td class=\"AccNo\">"+rs.getString("AccNo")+"</td>");
				out.println("<td class=\"Status\">"+rs.getString("Book_status")+"</td>");
				out.println("<td class=\"Title\">"+rs.getString("Title")+"</td>");
				out.println("<td class=\"Author\">"+rs.getString("Author")+"</td>");
				out.println("<td class=\"Publisher\">"+rs.getString("Publisher")+"</td>");
				out.println("<td class=\"Edition\">"+rs.getString("Edition")+"</td>");

				out.println("</tr>");
			}
			out.println("</table>");
			out.println("</body>");
			out.println("<script src=\"history.js\"></script>");
			out.println("</html>");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
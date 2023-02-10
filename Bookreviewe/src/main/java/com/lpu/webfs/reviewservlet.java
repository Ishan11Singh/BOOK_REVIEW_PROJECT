package com.lpu.webfs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class reviewservlet
 */
public class reviewservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = null;
		String email = null;
		String review= request.getParameter("review");
		String vote = request.getParameter("rating");
		
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found " + e);
		}
		
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject", 
				"root", "fiend");
		String sql = "INSERT INTO `bookproject`.`book1`\r\n"
				+ "(`username`,\r\n"
				+ "`name`,\r\n"
				+ "`password`,\r\n"
				+ "`email`,\r\n"
				+ "`review`,\r\n"
				+ "`vote`)\r\n"
				+ "VALUES\r\n"
				+ "(?,\r\n"
				+ "?,\r\n"
				+ "?,\r\n"
				+ "?,\r\n"
				+ "?,\r\n"
				+ "?\r\n);";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, username);
		stmt.setString(2, name);
		stmt.setString(3, password);
		stmt.setString(4, email);
		stmt.setString(5, review);
		stmt.setString(6, vote);
		stmt.execute();
		request.getRequestDispatcher("/bookproject").forward(request, response);
	}catch(SQLException e) {
		e.printStackTrace();
	}finally{
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

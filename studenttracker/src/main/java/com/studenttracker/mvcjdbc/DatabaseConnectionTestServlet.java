package com.studenttracker.mvcjdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class DatabaseConnectionTestServlet
 */
@WebServlet("/DatabaseConnectionTestServlet")
public class DatabaseConnectionTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// @Resource defines the resource for injection (here resource is
	// datasource/connection pool)
	// It gets the (inject) an object/instance of the specified resource (here it
	// injects the database connection object from the specified database connection
	// pool)
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			// Get connection to the database
			connection = dataSource.getConnection();

			// Create SQL statement
			statement = connection.createStatement();

			// Execute the SQL query
			String sql = "SELECT * FROM Student";
			resultSet = statement.executeQuery(sql);

			// process the result set
			while (resultSet.next()) {
				String email = resultSet.getString("email");
				out.println(email);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

package com.studenttracker.mvcjdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDBUtil {

	private DataSource dataSource;

	public StudentDBUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Student> getStudents() throws SQLException {

		List<Student> students = new ArrayList<>();

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {

			connection = dataSource.getConnection();
			statement = connection.createStatement();

			String query = "SELECT * FROM Students ORDER BY last_name";
			resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");

				students.add(new Student(id, firstName, lastName, email));
			}

			return students;

		} finally {
			close(resultSet, statement, connection);
		}
	}

	private void close(ResultSet resultSet, Statement statement, Connection connection) {

		try {
			if (resultSet != null) {
				resultSet.close();
			}

			if (statement != null) {
				statement.close();
			}

			if (connection != null) {
				connection.close(); // doesn't really close the connection...just put back the connection object
									// back to the connection pool for others to use.
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void addStudent(Student student) throws SQLException {

		Connection connection = null;
		PreparedStatement prepStatement = null;

		try {

			connection = dataSource.getConnection();

			String sql = "INSERT INTO Students(first_name, last_name, email) " + "VALUES(?, ?, ?)";

			prepStatement = connection.prepareStatement(sql);

			prepStatement.setString(1, student.getFirstName());
			prepStatement.setString(2, student.getLastName());
			prepStatement.setString(3, student.getEmail());

			prepStatement.execute();

		} finally {
			close(null, prepStatement, connection);
		}

	}

	public Student getStudent(String studentId) throws SQLException {

		Student student = null;

		Connection connection = null;
		PreparedStatement prepStatement = null;
		ResultSet resultSet = null;

		int id;

		try {
			id = Integer.parseInt(studentId);
			connection = dataSource.getConnection();
			String sql = "SELECT * FROM Students WHERE id = ?";

			prepStatement = connection.prepareStatement(sql);
			prepStatement.setInt(1, id);

			resultSet = prepStatement.executeQuery();

			if (resultSet.next()) {
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");
				student = new Student(id, firstName, lastName, email);
			} else {
				throw new RuntimeException("Could not find student id: " + id);
			}

			return student;
		} finally {
			close(resultSet, prepStatement, connection);
		}
	}

	public void updateStudent(Student student) throws SQLException {

		Connection connection = null;
		PreparedStatement prepStatement = null;

		try {

			connection = dataSource.getConnection();

			String sql = "UPDATE Students SET " + "first_name = ?, last_name = ?, email = ? " + "WHERE id = ?";

			prepStatement = connection.prepareStatement(sql);

			prepStatement.setString(1, student.getFirstName());
			prepStatement.setString(2, student.getLastName());
			prepStatement.setString(3, student.getEmail());
			prepStatement.setInt(4, student.getId());

			prepStatement.execute();
		} finally {
			close(null, prepStatement, connection);
		}
	}

	public void deleteStudent(int id) throws SQLException {

		Connection connection = null;
		PreparedStatement prepStatement = null;

		try {
			connection = dataSource.getConnection();
			String sql = "DELETE FROM Students WHERE id = ?";
			prepStatement = connection.prepareStatement(sql);
			prepStatement.setInt(1, id);
			prepStatement.execute();

		} finally {
			close(null, prepStatement, connection);
		}

	}
}

package com.studenttracker.mvcjdbc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;

	private StudentDBUtil studentDBUtil;

	@Override
	public void init() throws ServletException {
		this.studentDBUtil = new StudentDBUtil(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command = request.getParameter("command");
		if (command == null) {
			command = "LIST";
		}

		try {
			switch (command) {
			case "LIST":
				listStudents(request, response);
				break;
			case "ADD":
				addStudent(request, response);
				break;
			case "LOAD":
				getStudent(request, response);
				break;
			case "UPDATE":
				updateStudent(request, response);
				break;
			case "DELETE":
				deleteStudent(request, response);
				break;
			default:
				listStudents(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("studentId")); 
		
		studentDBUtil.deleteStudent(id);
		
		listStudents(request, response);
		
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");

		studentDBUtil.updateStudent(new Student(id, firstName, lastName, email));

		listStudents(request, response);
	}

	private void getStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String studentId = request.getParameter("studentId");

		Student student = studentDBUtil.getStudent(studentId);

		request.setAttribute("the_student", student);

		RequestDispatcher dispatcher = request.getRequestDispatcher("update-student-form.jsp");

		dispatcher.forward(request, response);

	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");

		studentDBUtil.addStudent(new Student(firstName, lastName, email));

		listStudents(request, response);

	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		List<Student> students = studentDBUtil.getStudents();

		request.setAttribute("student_list", students);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}

}

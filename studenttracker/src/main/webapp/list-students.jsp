<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- <%@ page import="java.util.*, com.studenttracker.mvcjdbc.*"%> DON'T NEED THIS WHEN USING JSTL--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Tracker</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>

	<%-- 	<% --%>
	<!-- 	List<Student> students = (List<Student>) request.getAttribute("student_list"); -->
	<!-- 	%> -->

	<div id="wrapper">
		<div id="header">
			<h2>Student Records App</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">
			<input type="button" value="Add Student"
				onclick="window.location.href='add-student-form.jsp'; return false;"
				class="add-student-button" />
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<%-- 				<% for (Student student : students) { %> --%>
				<!-- 					<tr> -->
				<%-- 						<td><%= student.getFirstName() %></td> --%>
				<%-- 						<td><%= student.getLastName() %></td> --%>
				<%-- 						<td><%= student.getEmail() %></td>	 --%>
				<!-- 					</tr> -->
				<%-- 				<% } %> --%>

				<c:forEach var="student" items="${student_list}">

					<!-- Create link String -->
					<c:url var="loadLink" value="StudentControllerServlet"><!-- link url -->
						<c:param name="command" value="LOAD" /><!-- query param -->
						<c:param name="studentId" value="${student.id}" /><!-- query param -->
					</c:url>
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="studentId" value="${student.id}" />
					</c:url>
					<tr>
						<td>${student.firstName}</td>
						<td>${student.lastName}</td>
						<td>${student.email}</td>
						<td>
							<a href="${loadLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="return confirm('Are you sure, you want to delete this student?')">Delete</a>
						</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>
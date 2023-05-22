<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- refernce to the core tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.*, com.demo.tags.Student" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- Tag to set a variable -->
	<c:set var="stuff" value="<%=new java.util.Date()%>" />
	The time on the server is ${stuff} <br />

	<%
	String[] cities = { "Jaipur", "Mumbai", "Varanasi" };
	pageContext.setAttribute("myCities", cities);
	%>
	
	<!-- Tag to loop over collection of values -->
	
	<c:forEach var="tempCity" items="${myCities}">
		${tempCity} <br />
	</c:forEach>
	
	<%
		List<Student> students = new ArrayList<>();
		students.add(new Student("John", "Doe", true));
		students.add(new Student("Mark", "Mei", false));
		students.add(new Student("Mary", "Pe", false));
		
		pageContext.setAttribute("students", students);
	%>

	<br />
	<!-- choose and if Tags for conditional check (there is no else tag in JSTL)-->
	<table>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gold Customer</th>
			<th>Offer</th>
		</tr>
		<c:forEach var="student" items="${students}">
			<tr>
				<td>${student.firstName}</td> <!-- implicitly call student.getName() --> 
				<td>${student.getLastName()}</td>
				<td>
					<c:if test="${student.goldCustomer}"> <!-- implicitly call student.isGoldCustomer() -->
						Y
					</c:if>
					<c:if test="${not student.isGoldCustomer()}">
						N
					</c:if>
				</td>
				<td>
					<c:choose>
						<c:when test="${student.goldCustomer}">
							Special Discount!
						</c:when>
						<c:when test="${student.firstName == 'Mary'}">
							Super Special Discount!
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
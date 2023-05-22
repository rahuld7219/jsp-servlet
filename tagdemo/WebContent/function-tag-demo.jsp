<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Tag to set a variable -->
	<c:set var="data" value="Rahul" />

	<!-- function tags -->
	
	Length of the string <b>${data}</b>: ${fn:length(data)}
	<br /><br />
	Upper-case version of the string <b>${data}</b>: ${fn:toUpperCase(data)}
	<br /><br />
	Does the string <b>${data}</b> ends with <b>hul</b>?: ${fn:endsWith(data, "hul")}
	
	<h3>split() demo</h3>
	<c:set var="data" value="Helsinki,Mumbai,London,Tokyo" />
	<c:set var="citiesArray" value="${fn:split(data, ',')}" />
	<c:forEach var="city" items="${citiesArray}">
		${city}<br/>
	</c:forEach>
	
	<h3>join() demo</h3>
	<c:set var="citiesString" value="${fn:join(citiesArray, '-')}" />
	result of join: ${citiesString}
</body>
</html>
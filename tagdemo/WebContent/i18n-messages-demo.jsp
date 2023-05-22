<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="theLocale"
	   value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
	   scope="session" />
	   
<fmt:setLocale  value="${theLocale}" />
<fmt:setBundle basename="com.demo.i18n.labels"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<a href="i18n-messages-demo.jsp?theLocale=en_US">English(US)</a> |
<a href="i18n-messages-demo.jsp?theLocale=es_ES">Spanish(ES)</a> |
<a href="i18n-messages-demo.jsp?theLocale=de_DE">German(DE)</a>

<hr>

<fmt:message key="label.greeting" /> <br /><br />
<fmt:message key="label.firstname" /> <i>John</i><br />
<fmt:message key="label.lastname" /> <i>Doe</i><br /><br />
<fmt:message key="label.welcome" /> <br />

<hr>
Selected Locale: ${theLocale}
</body>
</html>
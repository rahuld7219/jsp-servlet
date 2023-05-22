<!--  to handle the case of cookies value with spaces in them, if we don't use this then we get java.lang.IllegalArgumentException if cookie value have spaces in them -->
<%@page import="java.net.URLEncoder" %>
<html>
	<head><title>Personalize Confirmation</title></head>
	<%
		// read form data
		String favLang = request.getParameter("favLang");
	
		// decode cookie data to handle the case of prog lang(cookie value) with spaces in them
		favLang = URLEncoder.encode(favLang, "UTF-8"); // now it will use special characters(acc. to UTF-8) for reserved characters, like for spaces use + symbol
		
		// create cookie for favorite language 
		Cookie theCookie = new Cookie("myApp.favLang", favLang); // Cookie class is in the package javax.servlet.http which is imported by default
				
		// set life span of the cookie in seconds
		theCookie.setMaxAge(60*60*24*365);
				
		// send the cookie to the browser
		response.addCookie(theCookie);
	%>
	<body>
		
		<p>Thank You! We set your favorite language to: ${param.favLang}</p>
		<br/>
		<a href="cookies-homepage.jsp">Return to homepage.</a>
	</body>
</html>
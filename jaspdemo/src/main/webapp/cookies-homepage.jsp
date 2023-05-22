<!--  to handle the case of cookies value with spaces in them, if we don't use this then we get java.lang.IllegalArgumentException if cookie value have spaces in them -->
<%@page import="java.net.URLDecoder" %>
<html>
	<head><title>Homepage</title></head>
	<body>
		<h2>Training Portal</h2>
		<%
			// set default favorite programming language (if no cookie)
			String favLang="Java";
		
			// get cookies sent by the browser
			Cookie[] theCookies = request.getCookies();
			
			// find and set favorite programming language according to the received cookie
			if (theCookies != null)
				for (Cookie tempCookie : theCookies)
					if ("myApp.favLang".equals(tempCookie.getName()))
					{
						// decode cookie data...to handle case of prog lang(cookies value) with spaces in them
						favLang = URLDecoder.decode(tempCookie.getValue(), "UTF-8");
						break;
					}
		%>
		<h3>New Books for <%= favLang %></h3>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		<h3>Latest news for <%= favLang %></h3>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		<h3>Hot jobs for <%= favLang %></h3>
		<ul>
			<li>blah blah blah</li>
			<li>blah blah blah</li>
		</ul>
		<br/>
		<hr/>
		<a href="cookies-personalize-form.html">Personalize this page</a>
	</body>
</html>
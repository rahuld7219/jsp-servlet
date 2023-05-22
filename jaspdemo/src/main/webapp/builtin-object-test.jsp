<html>
	<body>
		<h1>JSP built-in objects</h1>
		<p>Request user-agent to give system and browser details of the client: <%= request.getHeader("user-agent") %></p>
		<p>request client's language: <%= request.getLocale() %></p>
	</body>
</html>
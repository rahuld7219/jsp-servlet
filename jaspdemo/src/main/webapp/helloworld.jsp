<%@page import="java.time.LocalDateTime"%>
<html>
	<body>
		<h1>Hello! JSP</h1>
		<p>The Time on the server is <%= LocalDateTime.now() %> </p>
	</body>
</html>
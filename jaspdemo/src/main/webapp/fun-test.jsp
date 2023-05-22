<%@page import="com.fun.jsp.FunUtils"%>
<html>
	<body>
		<h1>Using our java class in JSP</h1>
		<p>
			<%! String data = "FUn FUN FuN"; %>
			Let's have some FUN: <%= FunUtils.makeLower(data) %>
		</p>
	</body>
</html>
<html>
	<body>
		<!-- JSP declaration -->
		<%!
			String makeLower(String data)
			{
				return data.toLowerCase();
			}
		%>
		<h1>Hello World!<br/></h1>
		<h3>Upper-case hello world using JSP expression</h3>
		<p>
			<!-- JSP expression -->
			<%= new String("Hello World!").toUpperCase() %>
		</p>
		<h3>Counting using JSP scriplet</h3>
		<p>
			<!-- JSP scriplet -->
			<%
				for(int i = 0; i<10; i++)
				{
					/*
					System.out was to write on the console(standard output)
					here, the out we're referring to isn't System.out, it isn't PrintStream out.
					It's a variable in the effective method that wraps our JSP page.
					It's JspWriter object provided to us by Tomcat implementation of JSP
					*/
					out.println("<br/>Count: "+ i);
					// println doesn't break line as it is replaced with HTML, so we put <br/>
				}
			%>
		</p>
		<h3>Lower-case hello world using JSP declaration</h3>
		<p>
			<!-- JSP expression -->
			<%= makeLower("Hello World!") %>
		</p>
	</body>
</html>
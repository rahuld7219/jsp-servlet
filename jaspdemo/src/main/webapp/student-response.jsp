<html>
	<head>
		<title>Student Confirmation</title>
	</head>
	<body>
		<p>
			The student is confirmed: ${param.fname} <%= request.getParameter("lname") %> <br/><br/>
			Student's country is: ${param.country}<br/><br/>
			Languages Known by the Student:
			<%
				String[] langs = request.getParameterValues("progLangs");
				if(langs != null)
					for(String lang : langs)
					{
						out.println("<li>" + lang + "</li>");
					}
			%><br/><br/>
			Student's Favorite Programming Language: ${param.favLang}	
			<br/><br/><br/><br/>
			${param}<br/>
			<%
			java.util.Map<String, String[]> p = request.getParameterMap();
			out.println("{");
			for(String key : p.keySet())
			{
				out.println(key + ": {");
				for(String value : p.get(key))
				{
					out.println(value + ", ");
				}
				out.println("}");
			}
			out.println("}");
			%>
		</p>
		
	</body>
</html>
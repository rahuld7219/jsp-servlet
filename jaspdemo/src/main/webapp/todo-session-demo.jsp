<%@ page import="java.util.*" %>

<!-- below line disables session tracking, i.e., HttpSession object not instantiated by the JSP -->
<%-- <%@ page session="false" %> --%>

<html>
	<body>
		<!-- Step 1: Create the HTML form-->
		
		<form action="todo-session-demo.jsp">
			Add new Item: <input type="text" name="theItem">
			<button>Submit</button>
		</form>
		
		<!-- Step 2: Add new item to the "To Do" list to the session-->
		<%
			// get the To Do list from the session
			
			List<String> items = (List<String>) session.getAttribute("myToDoList");
		
			// if the To Do list doesn't exist in the session then create a new one
			
			if (items == null)
			{
				items = new ArrayList<String>();
				session.setAttribute("myToDoList", items); // now items pointing to the session object data with key myToDoList
			}
			
			// add the form data (if any) to the To Do list
			
			String theItem = request.getParameter("theItem"); // returns null if theItem key not found
			boolean isItemEmpty = theItem == null || theItem.trim().length() < 1; // can use: theItem == null || theItem.trim().equals("")
			boolean isItemDuplicate = theItem != null && items.contains(theItem.trim());
			if (!isItemEmpty && !isItemDuplicate)
				items.add(theItem); // theItem added to the session object data pointed by items
		%>
		
		<!-- Step 3: Display all the "To Do" items from the session-->
		<hr/>
		<h3>To-Do List:</h3>
		<ol>
		<%
			for(String todo : items)
			{
				out.println("<li>" + todo + "</li>");
			}
		%>
		</ol>
	</body>
</html>
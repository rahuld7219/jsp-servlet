<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%!
	DateTimeFormatter f = DateTimeFormatter.ofPattern("dd-MMM-yyyy hh:mm");
	LocalDateTime dt = LocalDateTime.now();
%>
<p align="center">Last updated: <%= dt.format(f) %></p>
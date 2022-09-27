<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
 <%@include file="navbar.jsp" %>
 <%@include file="common_modal.jsp" %>
	<h1>
		Hello :
		<%
	User user = (User) session.getAttribute("currentUser");
		
		if(user==null)
		{
			session.setAttribute("msg", "You are not logged in.Please first login");
			response.sendRedirect("login.jsp");
			return;
		}
	%>
	 
	</h1>
</body>
</html>
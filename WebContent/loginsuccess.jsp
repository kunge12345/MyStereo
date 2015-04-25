<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="UTF-8" import= "edu.neu.cs5200.mystereo.DAO.*, edu.neu.cs5200.mystereo.models.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String message = (String)(request.getAttribute("message")); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
</head>
<body>
login successful!
<%UserDao dao=new UserDao();
int id=Integer.parseInt(message);
User user=dao.findUser(id);
out.println(user.getUsername());
session.setAttribute("userid",  message);
%>
<a href="hello.jsp?id=<%= user.getuId() %>">confirm</a>  
  
</body>
</html>
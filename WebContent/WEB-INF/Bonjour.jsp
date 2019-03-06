<%@page import="java.util.Date"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Way to becoming a Fullstack Developper</title>
</head>
<body>

<p>
		<%@ include file="menu.jsp" %>

 </p>
<p>
    <% 
    
    String salutation = (String) request.getAttribute("salutation");
    if (salutation.equals("jour"))
    {
      out.println("Bonjour Muheto");
      
      
    }
    	else {
    		
    		out.println("Bonsoir Muta, erega burije!");
    	}
    
    %>

</p>
<%int day=6; %>
<p>
<%
   if (day ==1 | day == 7){ %>
   <p> Today is the weekend, enjoy it!</p>
   <% } else {%>
   
   <p> Possibly you didn't got to job! It is not the weekend</p>



<%} %>
<%--  <p> Today's date is <% (new java.util.Date()).toLocalString());  --%>
 
<%-- <p> <%out.println("Entrer la valeur"); %></p> --%>

 

<p> 
	<%  
	  String variable = (String) request.getAttribute("variable");
	  out.println(variable);
	%>
</p>
<%-- <p>
	<%
	for (int i=0 ; i<20; i++)
	{
		out.println("God Is Good All the time! <br />");
	}
	%>
</p> --%>

</body>
</html>
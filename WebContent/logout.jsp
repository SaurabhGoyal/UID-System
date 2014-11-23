<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.Enumeration"
    pageEncoding="ISO-8859-1"%>
<%
session.invalidate();
response.sendRedirect(request.getContextPath() + "/index.htm");
%>
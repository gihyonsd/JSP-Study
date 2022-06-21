<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% if(session.getAttribute("UserId") == null) { %>
    	<a href="loginForm.jsp">로그인</a>
    <% } else { %>
    	<a href="logout.jsp">로그아웃</a>
    <% } %>
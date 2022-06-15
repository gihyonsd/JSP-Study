<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="board.boardVo"/>
<jsp:useBean id="dao" class="board.BoardDao"/>
<jsp:setProperty name="vo" property="*"/>

<%
	dao.update(vo);
	pageContext.setAttribute("vo", vo);

	//response.sendRedirect(request.getContextPath() + "/board/list.jsp");
%>
<c:redirect url="${pageContext.request.contextPath}/boardDetail.jsp?num=${vo.num}"></c:redirect>

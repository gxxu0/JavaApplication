<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<%
	//��������(���ǻ���)
	//�����̷�Ʈ
	
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
%>
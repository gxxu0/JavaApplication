<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String Bno = request.getParameter("Bno");
String status = request.getParameter("status");


try {

String query = "UPDATE board SET status = ? WHERE Bno= ?" ;

	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, "1");
	pstmt.setString(2, Bno);
	pstmt.executeUpdate();
	//out.println("�Խù��� ����߽��ϴ�.");
}

catch (SQLException ex) {
	out.println("����� ����ϴµ� �����߽��ϴ�. <br>");
	out.println("SQLException : " + ex.getMessage());
}

finally {
	if (stmt != null) {
		stmt.close();
	}
	if(conn != null) {
		conn.close();
	}
	/* ������ �ð� ���Ŀ� ����Ʈ �������� �̵� */

	response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+ Bno);
}
%>

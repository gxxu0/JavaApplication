<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String nick = (String)session.getAttribute("user_nick"); 
String id = (String)session.getAttribute("user_id"); 
String Bno = request.getParameter("Bno");
PreparedStatement pstmt2 = null;

try {

String query2 = "delete from likepost WHERE Lno= '"+Bno+"' AND lid = '"+id+"' ";

	pstmt2 = conn.prepareStatement(query2);
	pstmt2.executeUpdate();
%>

<script type="text/javascript">
  		alert("���Ͽ� ���� �Ǿ����ϴ�");
	</script>

<% 	
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

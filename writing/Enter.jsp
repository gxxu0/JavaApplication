<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String nick = (String)session.getAttribute("user_nick"); 
String id = (String)session.getAttribute("user_id"); 
String Bno = request.getParameter("Bno");
String Content = request.getParameter("Content");
String recruit_count = request.getParameter("recruit_count");
String recruit= request.getParameter("recruit");

int r_count = Integer.parseInt(recruit_count);
try {

String query = "INSERT INTO enter(Eno,eid,Available)  VALUES('"+Bno+"', '"+id+"', '"+1+"')";
String query2 = "UPDATE board SET recruit_count = ? WHERE Bno= ?" ;

	Statement stmt2 = null;
	stmt = conn.createStatement();
	pstmt = conn.prepareStatement(query2);
%>
<%
	if(recruit.equals(recruit_count)){
%>
	
	<script type="text/javascript">
  		alert("���� �ο��� �� á���ϴ�");
	</script>
<% 
	}else{
		
	r_count++;
	pstmt.setInt(1, r_count);
	pstmt.setString(2, Bno);
	int result = stmt.executeUpdate(query);
	pstmt.executeUpdate();
%>
<% 	
	}
%>
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

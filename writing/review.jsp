<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String nick = (String)session.getAttribute("user_nick"); 
String id = (String)session.getAttribute("user_id"); 
String Bid = request.getParameter("Bid");
String Bno = request.getParameter("Bno");
String Content = request.getParameter("Rcontent");
String rating = request.getParameter("rating");


try {

String query = "INSERT INTO review(Rno,Rid,Bid,Content,rate,Rnick,Rdate)  VALUES('"+Bno+"', '"+id+"','"+Bid+"', '"+Content+"', '"+rating+"','"+nick+"', now())";
String query2 = "UPDATE board SET status = ? WHERE Bno= ?" ;
String query3 = "SELECT * from review where Rno = '"+Bno+"' AND Rid = '"+id+"' " ;
PreparedStatement pstmt2 = null;
PreparedStatement pstmt3 = null;

	pstmt = conn.prepareStatement(query);
	
	pstmt2 = conn.prepareStatement(query2);
	pstmt3 = conn.prepareStatement(query3);
	ResultSet rs3 = pstmt3.executeQuery();

	if(rs3.next()){
%>	
 	<script type="text/javascript">
  		alert("�̹� ���並 �ۼ��߽��ϴ�");
	</script>
<%
	}else{
%>
	 <script type="text/javascript">
  		alert("���並 �ۼ��߽��ϴ�");
	</script>
<% 
/* 	pstmt2.setString(1, "0");
	pstmt2.setString(2, Bno);
	pstmt2.executeUpdate(); */
	pstmt.executeUpdate();
	}
	rs3.close();
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

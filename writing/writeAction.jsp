<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>


<%
String nick = (String)session.getAttribute("user_nick"); 

String id = (String)session.getAttribute("user_id"); 
String Title = request.getParameter("Title");
String recruit = request.getParameter("recruit");
String price = request.getParameter("price");
String place = request.getParameter("place");
String category = request.getParameter("category");
String Content = request.getParameter("Content");

try {

String query = "INSERT INTO board(Title,nick,id,recruit, price, place, category, sdate, Content, recruit_count,review,review_count ,status, c_count )  VALUES('"+Title+"','"+nick+"','"+id+"','"+recruit+"','"+price+"','"+place+"', '"+category+"', now(), '"+Content+"' ,'"+1+"','"+recruit+"','"+1+"', '"+0+"', '"+0+"')";
	
	stmt = conn.createStatement();
	/* exeuteUpdate - select �� create, drop, insert, delete, update ����� ��� */
	int result = stmt.executeUpdate(query);
	//out.println("�Խù��� ����߽��ϴ�.");
}

catch (SQLException ex) {
	out.println("�Խù��� ����ϴµ� �����߽��ϴ�. <br>");
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
	response.setHeader("Refresh", "1;URL=list.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<script type="text/javascript">
		alert("�Խù��� ����߽��ϴ�.");
  </script>
</body>
</html>
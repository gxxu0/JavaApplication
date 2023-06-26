<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="dbConn.jsp" %>
<% 
request.setCharacterEncoding("euc-kr");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
	<script src="js/bootstrap.js"></script>
		<script src="//code.jquery.com/jquery.min.js"></script>

    <link rel="stylesheet" href="../writing/list.css">
</head>
<body>
  <div id="logo"><a href="../main/main.jsp"><img src="./logo.png" alt=""></a></div>

<%	

    try {
    	String category = request.getParameter("category");
    	String id = (String)session.getAttribute("user_id"); 
    	String sql = "select * from board where category = '"+ category +"'";
    	pstmt = conn.prepareStatement(sql);
    	ResultSet rs = pstmt.executeQuery();
      
%>

  <table cellpadding=1>
  <tr class="head">
    <th width=200>����</th>
    <th width=80>�۾���<br>�г���</th>
    <th width=80>�����ο�</th>
    <th width=80>��޺�</th>
    <th width=110>��ġ</th>
    <th width=150>�Խñ� �ð�</th>
  </tr>
<%
  while (rs.next()) {
%>
  <tr>
    <td align=center><a href="../writing/Content.jsp?Bno=<%= rs.getString("Bno") %>"><%= rs.getString("Title") %></a></td>
    <td align=center><%= rs.getString("nick") %></td>
    <td align=center><%= rs.getString("recruit") %></td>
    <td align=center><%= rs.getString("price") %></td>
    <td align=center><%= rs.getString("place") %></td>
    <td align=center><%= rs.getString("sdate") %></td>
  </tr>
<%
	
    }
    rs.close();        
    }
    catch(Exception e) {
    	out.println("list ��ȸ�� ������ �ֽ��ϴ�. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
</table>

<br>
</body>
</html>
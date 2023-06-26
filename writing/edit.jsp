<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="./edit.css">
<%
	String Bno = request.getParameter("Bno");
    String sql = "select * from board where Bno = " + Bno;

    try {
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

  while (rs.next()) {
%>	
	
	<main>
	<div class="edit">
	<h1><a href="../main/main.jsp"><img src="./logo.png" alt=""></a></h1>
	<form method="post" action="editAction.jsp?Bno=<%= rs.getString("Bno") %>">
	<div class="content">
	제목: <input type="text" name="fTitle" placeholder="<%= rs.getString("Title") %>"><br>
	인원: <input type="number" name="recruit" min="2" max="8"placeholder="<%= rs.getString("recruit") %>"><br>
	가격: <input type="number" name="price" min="5000" max="999999" placeholder="<%= rs.getString("price") %>"><br>
	장소: <input type="text" name="place" placeholder="<%= rs.getString("place") %>"><br>
	<textarea name="fContent" rows="7" cols="50" placeholder="<%= rs.getString("Content") %>"></textarea>
	</div>
	<div class="submit">
	<input type="submit" value="수 정">
	<input type="reset" value="취 소">
	</div>
	</form>
	</div>
	</main>
<%
    }
  	 rs.close();        
    }
    catch(Exception e) {
    	out.println("edit <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>


<p>
</body>
</html>
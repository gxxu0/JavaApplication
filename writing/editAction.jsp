<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
    StringBuffer SQL = new StringBuffer("update board "); 
    SQL.append("set Title=?, Content=? , recruit=?, price=?, place=? where Bno=?");
  	String Bno = request.getParameter("Bno");
    try {
    	
        pstmt = conn.prepareStatement(SQL.toString());
        
        pstmt.setString(1, request.getParameter("fTitle"));
        pstmt.setString(2, request.getParameter("fContent"));
        pstmt.setString(3, request.getParameter("recruit"));
        pstmt.setString(4, request.getParameter("price"));
        pstmt.setString(5, request.getParameter("place"));
        pstmt.setString(6, request.getParameter("Bno"));


        int rowCount = pstmt.executeUpdate();     
  		%>
		 <script>
		 	alert("게시물을 수정하였습니다.");
		 </script>
		<%

    }
    catch(Exception e) {
    	out.println("editAction");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
	response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+Bno);
%>

<p><hr>
</body>
</html>
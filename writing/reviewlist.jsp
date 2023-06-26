<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="dbConn.jsp" %>
<% 
request.setCharacterEncoding("euc-kr");
%>

<%@ include file="../navbar/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
	<script src="js/bootstrap.js"></script>
		<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="./reviewlist.css">
<link rel="stylesheet" href="../navbar/navibar.css">
</head>
<body>
  <div id="logo"><a href="../main/main.jsp"><img src="./img/logo.png" alt=""></a></div>

<%	
	String id = request.getParameter("id");
	String Bno = request.getParameter("Bno");
	String sql = "select * from review where Bid = '"+ id +"'";
    String sql2= "SELECT COUNT(rate) as rcount FROM review where Bid= '"+id+"'";
    String sql3= "SELECT AVG(rate) as Avgrate FROM review where Bid= '"+id+"'";


    try {
    	PreparedStatement pstmt2 = null;
    	PreparedStatement pstmt3 = null;
        pstmt = conn.prepareStatement(sql);
        pstmt2 = conn.prepareStatement(sql2);
        pstmt3 = conn.prepareStatement(sql3);
        ResultSet rs = pstmt.executeQuery();
        ResultSet rs2 = pstmt2.executeQuery();
        ResultSet rs3 = pstmt3.executeQuery();
%>


<% 
	  while(rs2.next() && rs3.next()){
		  String rcount = rs2.getString("rcount");
%>
	<%	
		if(rcount.equals("0")){
			response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+ Bno);
	%>
	<script type="text/javascript">
  		alert("���� �ıⰡ �����ϴ�");
	</script>
	
    <% 
	  }else{
	%>
		<table>
	<tr class="head" id="reviewresult">
  	<th width=100>���� ����</th>
  	<th width=50>����</th>
  	</tr>
  	<tr>
    <td align=center><%= rs2.getString("rcount") %></td>
    <td align=center><%= rs3.getString("Avgrate") %></td>
    </tr>
    </table>
	
	<% 
	  }
	%>
<% 
	  }
%>
<%
  while (rs.next()) {
%>
  <table>
  <tr class="head">
  	<th width=100>�г���</th>
    <th width=50>����</th>
    <th width=350>����</th>
    <th width=100>��¥</th>
  </tr>
	<tr>
    <td align=center><%= rs.getString("Rnick") %></td>
    <td align=center><%= rs.getInt("rate") %></td>
    <td align=center><%= rs.getString("Content") %></td>
    <td align=center><%= rs.getString("Rdate") %></td>
    </tr>
    </table>
  
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




</body>
</html>
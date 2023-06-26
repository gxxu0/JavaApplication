<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html;charset=euc-kr;");
	request.setCharacterEncoding("euc-kr");     //charset, Encoding ����
	String pw = request.getParameter("pw");
    // DB���ῡ �ʿ��� ���� ����
	String url = "jdbc:mysql://localhost:3306/mysql06";
	String uid = "root";
	String upw = "kbc0924";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from user where pw = ? and pw_check = ?";
	
	try{
		// ����̹� ȣ��
		Class.forName("com.mysql.jdbc.Driver");
		
		// conn ����
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, pw_check);
		
		// sql����
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // �α��� ����(������ ���� session)
			pw = rs.getString("pw");
			response.sendRedirect("../login/login.jsp"); // �������̵�
			
		} else{ // �α��� ����
			response.sendRedirect("login_fail.jsp"); // ���� ������
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp"); // ������ �� ��쵵 �����̷�Ʈ
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>
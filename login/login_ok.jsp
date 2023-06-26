<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html;charset=euc-kr;");
	request.setCharacterEncoding("euc-kr");     //charset, Encoding ����
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
    // DB���ῡ �ʿ��� ���� ����
	String url = "jdbc:mysql://localhost:3306/mysql06";
	String uid = "root";
	String upw = "kbc0924";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from user where id = ? and pw = ?";
	
	try{
		// ����̹� ȣ��
		Class.forName("com.mysql.jdbc.Driver");
		
		// conn ����
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		// sql����
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // �α��� ����(������ ���� session)
			id = rs.getString("id");
			String nick = rs.getString("nick");
			session.setAttribute("user_id", id);
			session.setAttribute("user_nick", nick);
			//response.sendRedirect("../main/main_user.jsp"); // �������̵� -->
			response.sendRedirect("login_welcome.jsp");
			
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
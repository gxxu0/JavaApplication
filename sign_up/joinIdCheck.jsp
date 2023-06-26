<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%
    response.setContentType("text/html;charset=euc-kr;");
	request.setCharacterEncoding("euc-kr");     //charset, Encoding ����
	String id = request.getParameter("id");
    // DB���ῡ �ʿ��� ���� ����
	String url = "jdbc:mysql://localhost:3306/mysql06";
	String uid = "root";
	String upw = "kbc0924";
	Connection conn = null;
	PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = new StringBuffer(); 
    sql.append(" SELECT count(id) as cnt ");
    sql.append(" FROM user ");
    sql.append(" WHERE id = ? ");

    int cnt = 0;

    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, uid, upw);

        pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, id);
     
        ResultSet result = pstmt.executeQuery();
        if (result.next()) {
            cnt = result.getInt("cnt");
        
    
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/styles.css" rel="stylesheet" />
</head>
<body class="bg-white">
<div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container-xl px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header justify-content-center text-center text-black fw-600">���̵� �ߺ� Ȯ�� ���</div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        �Է� ID : <span class="fw-700 text-lg" name="id"><% out.println(id);%></span>
                                    </div>
                                    <%
                                        if (cnt == 0) {
                                            out.println("��� ������ ���̵��Դϴ�.");
                                            out.println("<span><a href='javascript:apply(\"" + id + "\")'><button class='btn btn-primary' style='float: right'>����</button></a></span>");
                                    %> 
                                    <%
                                        } else {
                                                out.println("<p style='color: red'>�ش� ���̵�� ����Ͻ� �� �����ϴ�.</p>");
                                            }
                                    %>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn btn-dark" onclick="window.close()">â �ݱ�</button>
                                    <span><button class="btn btn-dark" onclick="history.back()">�ٽ� �õ�</button><span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

    </div>
    
    <script>
    	function apply(id){
            opener.document.fr.id.value = id;
            window.close();
        }
    </script>                            
    <%
        }
            result.close();
        }
            catch(Exception e) {
            out.println("[author] ���̺� ��ȸ�� ������ �ֽ��ϴ�. <hr>");
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
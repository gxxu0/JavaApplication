<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("utf-8");
session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login_fail</title>
</head>
<body>
	
	<script type="text/javascript">
        alert("���̵�� ��й�ȣ�� �ٽ� Ȯ���ϼ���.");
		document.location.href="login.jsp"
    </script>
	

</body>
</html>
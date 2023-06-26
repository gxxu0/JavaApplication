<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*" %>
<%
 request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./login.css">
</head>
<body>
    <main>
        <div class="login">
            <h1><a href="../main/main.jsp"><img src="./logo.png" alt=""></a></h1>
            <form action="login_ok.jsp" method="post">
                <div class="id">
                    <input type="text" name = "id" id="user-id" placeholder="  ���̵�">
                </div>
                <div class="pw">
                    <input type="password" name="pw" id="user-pw" placeholder="  ��й�ȣ">
                </div>
                <a id="signup">
                    ���� ȸ���� �ƴϽŰ���?
                    <script type="text/javascript">
                        window.onload = function (){
                            var click = document.getElementById("signup");
                            click.onclick = load;
                        }
                        function load(){
                            alert("ȸ������ â���� �̵��մϴ�.");
                            document.location.href="../sign_up/sign-up.jsp" 
                        }
                    </script>
                </a>
                
                <div class="submit">
                    <input type="submit" id="user-submit" value="Login">
                </div>
            </form>
        </div>
    </main>
    
    
</body>
</html>
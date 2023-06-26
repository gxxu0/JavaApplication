<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*" %> 
<%
request.setCharacterEncoding("utf-8"); String id =
(String)session.getAttribute("user_id"); String nick =
(String)session.getAttribute("user_nick"); 
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./main.css" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
    />
  </head>
  <body>
    <nav id="navigation_bar">
      <div>
        <button><a href="../writing/write.jsp">�� ����</a></button>
        <button>�� ��� ��������</button>
        <button>�� �� ��������</button>
      </div>
    </nav>
    <header id="header">
      <span class="nickname">
      <%=nick %>�� ��
      <div class="dropdown-content">
        <a href="../mypage/mypage.jsp">����������</a>
      </div>
      </span>
      <span> | </span>
      <span><a href="./main_logout.jsp">�α׾ƿ�</a></span>
    </header>
    <div id="logo"><a href="./main_user.jsp"><img src="./logo.png" alt=""></a></div>
    <section id="banner">
      <div class="banner_img">
        <img src="./main_banner.png" alt="" />
      </div>
    </section>
    <hr />
    <div id="search">
      <div class="search-box">
        <input
          type="text"
          class="search-txt"
          name=""
          placeholder="  �˻�� �Է��ϼ���."
        />
        <a class="search-btn" href="#">
          <i class="fas fa-search"></i>
        </a>
      </div>
    </div>
    <main class="category">
      <table>
        <tr>
          <td><img src="./chicken.png" alt="" width="150px" /></td>
          <td><img src="./hamburger.jpg" alt="" width="140px" /></td>
          <td><img src="./sushi.png" alt="" width="150px"  /></td>
          <td><img src="./pizza.jpg" alt="" width="150px"  /></td>
        </tr>
        <tr>
          <td><img src="./schoolfood.jpg" alt="" width="170px"  /></td>
          <td><img src="./meat.png" alt="" width="140px"  /></td>
          <td><img src="./chinese.jpg" alt="" width="150px"  /></td>
          <td><img src="./dessert.png" alt="" width="140px"  /></td>
        </tr>
      </table>
    </main>
  </body>
</html>

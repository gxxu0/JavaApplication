<%@ page  contentType="text/html;charset=euc-kr" 
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<%

  response.setContentType("text/html;charset=euc-kr;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding ����

  Class.forName("com.mysql.jdbc.Driver");    // load the drive
  String DB_URL = 
          "jdbc:mysql://localhost:3306/mysql06?useUnicode=true&characterEncoding=utf-8";
                 // ���� : test by changing mydb to name that you make

  String DB_USER = "root";
  String DB_PASSWORD= "kbc0924";

  Connection conn= null;
  Statement stmt = null;
  ResultSet rs   = null;

  try {
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      stmt = conn.createStatement();

      String query = "SELECT id, email, nick, pw, pw_check FROM user";
      rs = stmt.executeQuery(query);
 %>

<form action="delete_do.jsp" method="post">
<table border="1" cellspacing="0">
<tr>
<td>id</td>
<td>email</td>
<td>nick</td>
<td>pw</td>
<td>pw_check</td>
<th>���</th>
</tr>
<%
    while(rs.next()) { //rs �� ���� ���̺� ��ü���� �ʵ尪�� �Ѱܺ� �� �ִ�.
%><tr>
<td><%=rs.getString("id")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("nick")%></td>
<td><%=rs.getString("pw")%></td>
<td><%=rs.getString("pw_check")%></td>
<td><a href="delete_do.jsp?del=<%=rs.getString(1)%>">����</a>
</td>
</tr>
<%
    } // end while
%></table>
</form>
<%
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>
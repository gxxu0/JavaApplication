<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>

  <% String id=(String)session.getAttribute("user_id"); String nick=(String)session.getAttribute("user_nick"); %>
    <% request.setCharacterEncoding("euc-kr"); %>
    <%@ include file="../navbar/navbar.jsp" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="euc-kr" />
        <title>Document</title>
        <link rel="stylesheet" href="../main/main.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />
        <link rel="stylesheet" href="./write.css">
        <link rel="stylesheet" href="../navbar/navibar.css">
      </head>

      <body>

             <div id="logo"><a href="../main/main.jsp"><img src="./img/logo.png" alt=""></a></div>

              <div class="writecontainer">
                <form action="writeAction.jsp" method="post">
                  <div class="title"><input type="text" name="Title" placeholder="    �Խñ� ������ �ۼ��ϼ���." /></div>
                  <div class="usercount"><input type="number" name="recruit" min="2" max="8"
                      placeholder="    �����ο��� �����ϼ���."></div>
                  <div class="cost"><input type="number" name="price" min="5000" max="99999"
                      placeholder="    ����(��޺�+���İ�)�� �Է��ϼ���."></div><br />

                  <div class="place">
                    <div style="margin: 100px 0 0 0; width: 600px;">������Ҹ� �����ϼ���.<br /></div>
                    <select class="form=control" name="place">
                      <option value="���ε�">���ε�</option>
                      <option value="����">����</option>
                      <option value="�����">�����</option>
                    </select>
                    <input type="text" class="form=control" name="place" placeholder="�����Է�" maxlength="100">
                  </div>
                 

                    <div class="category">
                      <div style="margin: 0px; width: 600px;">ī�װ��� �Է��ϼ���</div>
                      <table>
                        <tr>
                          <td><input type='radio' name='category' value='chicken' />ġŲ</td>
                          <td><input type='radio' name='category' value='hamburger' />�ܹ���</td>
                          <td><input type='radio' name='category' value='pizza' />����</td>
                          <td><input type='radio' name='category' value='sushi' />����</td>                         
                        </tr>
                        <tr>
                          <td><input type='radio' name='category' value='schoolfood' />�н�</td>
                          <td><input type='radio' name='category' value='meat' />���</td>
                          <td><input type='radio' name='category' value='chinese' />�߽�</td>
                          <td><input type='radio' name='category' value='dessert' />����Ʈ</td>
                        </tr>
                      </table>
                    </div>
                    <br>
                    <div class="detail">�󼼳����� �Է��ϼ���.<br />
                      <textarea name="Content" rows="5" cols="50"></textarea>
                    </div>
                    <br />
                    <input type="hidden" name="nick" value="<%=nick%>"><br>
                    <input type="submit" class="submit" />&nbsp;
                    <input type="reset" class="submit" />
                </form>
              </div>

      </body>

      </html>
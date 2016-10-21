<%-- 
    Document   : ogrencikayit
    Created on : 12.May.2016, 00:49:05
    Author     : must
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title>Öğrenci Kayıt</title>
</head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    <div class="container text-center">
        <h2>Öğrenci Kayıt</h2>
        <p>Lütfen istenen bilgileri eksiksiz giriniz</p> 
        <form method="post" action="studentsaveservlet" >
            <table class="table">
              <tbody>
                <tr>
                  <td>Kullanıcı Adı Belirleyiniz</td>
                  <td><input type="text" value=" " name="username"/></td>
                </tr>
                <tr>
                  <td>Parola(En az 6, En fazla 12 karakter)</td>
                  <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                  <td>Parola'nızı doğrulayın</td>
                  <td><input type="password" name="password2"/></td>
                </tr>
                <tr>
                  <td>Adınız</td>
                  <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                  <td>Soyadınız</td>
                  <td><input type="text" name="surname"/></td>
                </tr>
                <tr>
                  <td>Geçerli bir mail adresi girin</td>
                  <td><input type="text" name="mail"/></td>
                </tr>
                <tr>
                  <td>Bölümünüzü seçiniz</td>
                  <td><select name="department">
                      <c:forEach var="item" items="${d}">
                          <option value="${item.code}">
                              <c:out value="${item.name}"/>
                          </option>
                      </c:forEach>
                  </select></td>
                </tr>
                <tr><td colspan="2"><input type="submit" value="Kayıt Ol"></td></tr>

              </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="html/footer.html"/>
</body>
</html>

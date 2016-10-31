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
        <jsp:include page="html/head.html"></jsp:include>
    <title>Öğrenci Kayıt</title>
</head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    <div class="container text-center">
        <h2>Öğrenci Kayıt</h2>
        <p>Lütfen istenen bilgileri eksiksiz giriniz</p> 
        
        <c:choose>
        	<c:when test="${kayit eq 1}">
        		<div class="alert-success">
        			<strong>Başarılı!</strong> Kullanıcı hesabınız başarıyla oluşturulmuştur.
        		</div>
        		<div class="alert-info">
        			Hesabınıza <strong><a href="logininitializeservlet">buradan</a></strong> giris yapabilrsiniz
        		</div>
        	</c:when>
        	<c:when test="${kayit eq 2}">
        		<div class="alert-danger">
        			Bu kullanıcı adı alınmış. Lütfen başka bir kullanıcı adı seçiniz. 
        		</div>
        	</c:when>
        	<c:when test="${kayit eq 3}">
        		<div class="alert-danger">
        			Bir hata meydana geldi. 
        		</div>
        	</c:when>
        </c:choose>
        
        <form method="post" action="studentsaveservlet" >
            <table class="table">
              <tbody>
                <tr>
                  <td>Kullanıcı Adı Belirleyiniz</td>
                  <td><input type="text" value="${username}" name="username"/></td>
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
                  <td><input type="text" name="name" value="${name}"/></td>
                </tr>
                <tr>
                  <td>Soyadınız</td>
                  <td><input type="text" name="surname" value="${surname}"/></td>
                </tr>
                <tr>
                  <td>Geçerli bir mail adresi girin</td>
                  <td><input type="text" name="mail" value="${mail}"/></td>
                </tr>
                <tr>
                  <td>Bölümünüzü seçiniz</td>
                  <td><select name="department">
                      <c:forEach var="item" items="${departments}">
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

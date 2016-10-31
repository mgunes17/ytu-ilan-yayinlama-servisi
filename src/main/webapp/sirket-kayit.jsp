<%-- 
    Document   : sirketkayit
    Created on : 12.May.2016, 02:41:06
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Şirket Kayıt</title>
        <jsp:include page="html/head.html"></jsp:include>
    </head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    <div class="container text-center">
        <h2>Şirket kayıt</h2>
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
        
        <!-- tüm alanlar dolduruldu mu -->
        <form method="post" action="companysaveservlet">
        	<div class="form-group">
        		<label for="user_name">Kullanıcı Adı</label> <!-- alınmış mı kontrolü yap -->
        		<input type="text" class="form-control" name="username" id="username" value="${kullaniciAdi}">
        	</div>
        	<div class="form-group">
        		<label for="company_name">Kurum Adı</label>
        		<input type="text" class="form-control" name="company_name" id="company_name" value="${kurumAdi}">
        	</div>
        	<div class="form-group">
        		<label for="telephone_number">Telefon</label> <!-- +90  regex-->
        		<input type="tel" class="form-control" name="telephone_number" id="telephone_number" value="${telefonNumarasi}">
        	</div>
        	<div class="form-group">
        		<label for="email">Mail Adresi</label> <!-- regex -->
        		<input type="email" class="form-control" name="email" id="email" value="${mail}">
        	</div>
        	<div class="form-group">
        		<label for="password">Parola</label> 
        		<input type="password" class="form-control" name="password" id="password">
        	</div>
        	<div class="form-group">
        		<label for="password">Parola(Tekrar)</label> <!-- Doğrulama jquery -->
        		<input type="password" class="form-control" id="password">
        	</div>
			<input type="submit" value="kayıt ol">
        </form>
      
    </div>
    <jsp:include page="html/footer.html"/> 
</body>
</html>

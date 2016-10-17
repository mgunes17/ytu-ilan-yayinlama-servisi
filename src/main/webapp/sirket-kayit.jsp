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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    <div class="container text-center">
        <h2>Şirket kayıt</h2>
        <p>Lütfen istenen bilgileri eksiksiz giriniz</p> 
        
        <!-- tüm alanlar dolduruldu mu -->
        <form method="post" action="companysaveservlet">
        	<div class="form-group">
        		<label for="user_name">Kullanıcı Adı</label> <!-- alınmış mı kontrolü yap -->
        		<input type="text" class="form-control" name="username" id="username" placeholder="kullanıcı adı..">
        	</div>
        	<div class="form-group">
        		<label for="company_name">Kurum Adı</label>
        		<input type="text" class="form-control" name="company_name" id="company_name" placeholder="kurum adı..">
        	</div>
        	<div class="form-group">
        		<label for="telephone_number">Telefon</label> <!-- +90  regex-->
        		<input type="tel" class="form-control" name="telephone_number" id="telephone_number" placeholder="telefon numarası">
        	</div>
        	<div class="form-group">
        		<label for="email">Mail Adresi</label> <!-- regex -->
        		<input type="email" class="form-control" name="email" id="email" placeholder="mail..">
        	</div>
        	<div class="form-group">
        		<label for="password">Parola</label> 
        		<input type="password" class="form-control" name="password" id="password" placeholder="parola..">
        	</div>
        	<div class="form-group">
        		<label for="password">Parola(Tekrar)</label> <!-- Doğrulama jquery -->
        		<input type="password" class="form-control" id="password" placeholder="parola(tekrar)..">
        	</div>
			<input type="submit" value="kayıt ol">
        </form>
      
    </div>
    <jsp:include page="html/footer.html"/> 
</body>
</html>

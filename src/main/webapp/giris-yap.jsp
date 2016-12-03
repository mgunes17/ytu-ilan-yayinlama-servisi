<%-- 
    Document   : girisyap
    Created on : 12.May.2016, 02:56:37
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="html/head.html"></jsp:include>
    <title>Giriş Yap</title>
</head>
<body>
    <jsp:include page="html/header.jsp"></jsp:include>
    
    <div class="container text-center">
    	<h3>Giriş Yap</h3>
        <form action="logincontrolservlet" method="post">
        	<div class="form-group">
        		<label for="username">Kullanıcı Adı</label>
        		<input type="text" name="username" id="username" pattern=".{1,20}" value="${username}"
        			required title="Lütfen kullanıcı adınızı giriniz"/>
        	</div>
        	<div class="form-group">
        		<label for="password">Parola</label>
        		<input type="password" name="password" id="password" pattern=".{1,16}" value="${password}"
        			required title="Lütfen paroloanızı giriniz"/>
        	</div>
        	<c:choose>
				<c:when test="${giris eq 0}">
					<div class="alert alert-danger">
						<strong>Başarısız!</strong> Lütfen kullanıcı adı ve parolanızı kontrol edin.
					</div>
				</c:when>
				<c:when test="${giris eq 1}">
					<div class="alert alert-warning">
						Erişim için giriş yapmak zorundasınız.
					</div>
				</c:when>
	        </c:choose>
            <input type="submit" value="Giriş Yap"/>
        </form>
    </div>
    <jsp:include page="html/footer.html"/>
</body>
</html>

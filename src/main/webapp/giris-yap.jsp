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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title>Giriş Yap</title>
</head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    
    <div class="container text-center">
    	<h3>Giriş Yap</h3>
        <form action="logincontrolservlet" method="post">
        	<div class="form-group">
        		<label for="username">Kullanıcı Adı</label>
        		<input type="text" name="username" id="username"/>
        	</div>
        	<div class="form-group">
        		<label for="password">Parola</label>
        		<input type="password" name="password" id="password"/>
        	</div>
            <input type="submit" value="Giriş Yap"/>
        </form>
    </div>
    <jsp:include page="html/footer.html"/>
</body>
</html>

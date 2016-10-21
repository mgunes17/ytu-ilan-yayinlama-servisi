<%-- 
    Document   : company
    Created on : 14.Nis.2016, 01:10:11
    Author     : must
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h4><a href="../directcompanymainpageservlet">Anasayfa</a></h4>
    <form action="../logoutservlet" method="post">
         Çıkış Yap</br>
	<input type="submit" value="Logout">
    </form>
               
    <h1>Hoşgeldiniz ${user.userName}</h1>
    <a href="../newannouncementcontrolservlet">İlan Oluştur</a>
    <a href="../listallannouncementsservlet">Tüm ilanları Görüntüle</a>
    <%--Aktif ve Pasif ilanların filtrelenmesi ayrımı o sayfa icinde olacak--%>
    <a href="../listmyannouncementservlet">İlanlarımı görüntüle</a>
    <a href="#">Sahip olduğum ilan paketlerini gör</a>
    <a href="../displaypacketstocompany">İlan paketlerini gör</a>
    <a href="#">Profilimi düzenle</a>
    
    <c:choose>
    	<c:when test="${user.status eq 0 }">
    		lütfen mail üzerinden hesabınızı aktif hale getiriniz
    	</c:when>
    </c:choose>
    
</body>
</html>

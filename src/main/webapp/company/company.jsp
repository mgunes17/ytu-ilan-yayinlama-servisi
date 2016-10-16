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
    <a href="../newannouncementcontrolservlet">İlan Oluştur</a></br>
    <a href="../listallannouncementsservlet">Tüm ilanları Görüntüle</a></br>
    <%--Aktif ve Pasif ilanların filtrelenmesi ayrımı o sayfa icinde olacak--%>
    <a href="../listmyannouncementservlet">İlanlarımı görüntüle</a></br>
    <a href="#">Sahip olduğum ilan paketlerini gör</a></br>
    <a href="../displaypacketstocompany">İlan paketlerini gör</a></br>
    <a href="#">Profilimi düzenle</a></br>
</body>
</html>

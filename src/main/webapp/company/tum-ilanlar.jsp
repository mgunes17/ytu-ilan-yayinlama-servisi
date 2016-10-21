<%-- 
    Document   : allannouncements
    Created on : 30.Nis.2016, 16:32:48
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tüm İlanlar</title>
</head>
<body>
    
    <h4><a href="../directcompanymainpageservlet">Anasayfa</a></h4>
    <form action="../logoutservlet" method="post">
         Çıkış Yap</br>
	<input type="submit" value="Logout"/>
    <h1>Tüm ilanlar</h1>
     <table border="0">
        <thead>
            <tr>
                <th>İlan No</th>
                <th>Başlık</th>
                <th>Ön Açıklama</th>
                <th>Durum</th>
                <th>Başvuru Sayısı</th>
            </tr>
        </thead>
        <tbody>
            <form action="announcementdetailservlet" method="post">
                <c:forEach var="item" items="${announcements}">
                    <tr>
                        <td><input type="radio" name="announcement" value="${item.id}"></td>
                        <td>${item.id}</td>
                        <td>${item.title}</td>
                        <td>${item.brief}</td>
                        <td>${item.state}</td>
                        <td>${item.numberOfPageViews}</td>
                        <td></td>
                    </tr>
                </c:forEach>
                <input type="submit" value="Detaya Git"/>
            </form>
        </tbody>
    </table>
</body>
</html>

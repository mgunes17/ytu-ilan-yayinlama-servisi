<%-- 
    Document   : newannouncement
    Created on : 22.Nis.2016, 13:55:41
    Author     : must
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>İlan Oluştur</title>
</head>
<body>
    <form action="../logoutservlet" method="post">
         Çıkış Yap</br>
	<input type="submit" value="Logout">
    </form>
    <h4><a href="../directcompanymainpageservlet">Anasayfa</a></h4>
    <h1>Yeni İlanınızı Oluşturun</h1>
    <form method="POST" action="newannouncementservlet">
        İlan Başlığı</br>
        <input type="text" name="title"/></br>
        Kısa Açıklama</br>
        <input type="text" name="brief"/></br>
        İlan detayları</br>
        <input type="text" name="content"/></br>
        İlan tipi</br>
        <select name="type">
            <c:forEach var="item" items="${annType}">
                <option value="${item.id}">
                    <c:out value="${item.title}"/>
                </option>
            </c:forEach>
        </select></br>
        
        <input type="submit" value="Oluştur"/>
    </form>
    
    
</body>
</html>

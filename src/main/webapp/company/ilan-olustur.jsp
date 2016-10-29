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
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <title>İlan Oluştur</title>
</head>
<body>
    <form action="../logoutservlet" method="post">
         Çıkış Yap
	<input type="submit" value="Logout">
    </form>
    <h4><a href="../directcompanymainpageservlet">Anasayfa</a></h4>
    <h1>Yeni İlanınızı Oluşturun</h1>
    <form method="POST" action="../announcementcreateservlet">
        İlan Başlığı
        <input type="text" name="title"/>
        Kısa Açıklama
        <input type="text" name="brief"/>
        İlan detayları
        <input type="text" name="content"/>
        İlan tipi
        <select name="type">
            <c:forEach var="item" items="${annType}">
                <option value="${item.id}">
                    <c:out value="${item.title}"/>
                </option>
            </c:forEach>
        </select>
        
        <input type="submit" value="Oluştur"/>
    </form>
    
    <c:choose>
    	<c:when test="${olusturuldu eq 1}">
    		<div class="alert alert-success">
                <strong>Oluşturuldu!</strong> İlanınız başarıyla oluşturuldu. 
                İlanınızı <a href="company/ilanlarim">burdan</a> düzenleyebilir veya
                aktif hale getirebilirsiniz.
            </div>
            <div class="alert alert-info">
            	Oluşturduğunuz ilanları <a href="../listmyannouncementsservlet">buradan</a> görebilirsiniz.
            </div>
    	</c:when>
    	<c:when test="${olusturuldu eq 2}">
    		<div class="alert alert-danger">
                <strong>Oluşturulamadı!</strong> İlan oluşturulurken bir hata
                meydana geldi. Lütfen tekrar deneyiniz.
            </div>
    	</c:when>
    </c:choose>
    
</body>
</html>

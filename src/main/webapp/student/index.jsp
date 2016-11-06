<%-- 
    Document   : student.jsp
    Created on : 22.Nis.2016, 13:31:06
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Öğrenci</title>
</head>
<body>
 
    <h1>Hoşgeldiniz ${user.userName}</h1>
    <a href="../announcementstostudent">Tüm ilanları görüntüle</a>
    <a href="#">İlan Ara</a>
    <a href="#">Başvurularım</a>
    <a href="#">Profilimi Düzenle</a>
    <a href="#">CV mi düzenle</a>
    
     <c:choose>
    	<c:when test="${user.status eq 0 }">
    		lütfen mail üzerinden hesabınızı aktif hale getiriniz
    	</c:when>
    </c:choose>
</body>
</html>

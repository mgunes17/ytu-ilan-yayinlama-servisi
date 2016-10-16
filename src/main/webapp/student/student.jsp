<%-- 
    Document   : student.jsp
    Created on : 22.Nis.2016, 13:31:06
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Öğrenci</title>
</head>
<body>
 
    <%String userName = (String)session.getAttribute("user");%>
    <h1>Hoşgeldiniz <%=userName%></h1>
    <a href="listallannouncementsservlet">Tüm ilanları görüntüle</a>
    <a href="#">İlan Ara</a>
    <a href="#">Başvurularım</a>
    <a href="#">Profilimi Düzenle</a>
    <a href="#">CV mi düzenle</a>
</body>
</html>

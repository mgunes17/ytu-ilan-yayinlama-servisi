<%-- 
    Document   : displaypackets
    Created on : 29.Nis.2016, 16:10:21
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="html/head.html"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Paketleri Gör</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="html/header.html"/>
        </div>
        <div class="row">
            <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            <div class="col-md-9">
                <h1>Tanımlamış Olduğunuz Paketler</h1>
    
                <table id="table" border="1">
                    <thead>
                        <tr>
                            <th>Paket No</th>
                            <th>Paketin Adı</th>
                            <th>İlan Sayısı</th>
                            <th>İlan Yayın Süresi</th>
                            <th>Fiyat</th>
                            <th>Para Birimi</th>
                            <th>Bağış Birimi</th>
                            <th>Son Kullanma Tarihi</th>
                            <th>Açıklama</th>
                            <th>İşlemler</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="item" items="${packets}">
                            <tr>
                                <td>${item.packetId}</td>
                                <td>${item.title}</td>
                                <td>${item.announcementCount}</td>
                                <td>${item.activeTime}</td>
                                <td>${item.price}</td>
                                <td>${item.currency}</td>
                                <td>${item.donateAcceptUnit}
                                <td><fmt:formatDate value="${item.lastDateUsed}" /></td>
                                <td>${item.condition}</td>
                                <td>
                                    <form method="post">
                                        <input type="hidden" name="packetId" value="${item.packetId}" />
                                        <input type="submit" value="Sil" formaction="../deleteannouncementpacket">
                                        <input type="submit" value="Düzenle" formaction="../updatepacket">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <a href="../newannouncementpacketservlet">Yeni Paket Ekle</a>
            </div>
        </div>
    </div>

    <jsp:include page="../html/footer.html"></jsp:include> 
    
</body>
</html>

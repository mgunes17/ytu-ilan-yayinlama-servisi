<%-- 
    Document   : announcementpackets
    Created on : 30.Nis.2016, 16:49:46
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>İlan Paketleri</title>
</head>
<body>
    <h4><a href="../directcompanymainpageservlet">Anasayfa</a></h4>
    <form action="../logoutservlet" method="post">
         Çıkış Yap</br>
	<input type="submit" value="Logout">
    </form>
    <h1>Bağış Yapılabilecek Paketler</h1>
    <table id="table" border="1">
        <thead>
            <tr>
                <th>Paket No</th>
                <th>İlan Sayısı</th>
                <th>İlan Yayın Süresi</th>
                <th>Fiyat</th>
                <th>Para Birimi</th>
                <th>Bağış Birimi</th>
                <th>Son Kullanma Tarihi</th>
                <th>Açıklama</th>
                <th>Bağış İsteği</th>
            </tr>
        </thead>
        <tbody>

            <c:forEach var="item" items="${packets}">
                <tr>
                    <td>${item.packetId}</td>
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
                            <input 
                                type="submit" 
                                value="Bağış Yaptım" 
                                formaction="../donationrequest">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

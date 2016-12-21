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
        <title>Paketleri Gör</title>
    </head>
    <body>
        <jsp:include page="html/menu.html"/>
        <div class="jumbotron container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-9">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Paketin Adı</th>
                                <th>İlan Sayısı</th>
                                <th>İlan Yayın Süresi</th>
                                <th>Fiyat</th>
                                <th>Bağış Birimi</th>
                                <th>Son Kullanma Tarihi</th>
                                <th>İşlemler</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="item" items="${packets}">
                                <tr>
                                    <td>${item.title}</td>
                                    <td align="right">${item.announcementCount}</td>
                                    <td align="right">${item.activeTime}</td>
                                    <td align="right">${item.price}</td>
                                    <td>${item.accountInfo.ownerUnit.unitName}
                                    <td><fmt:formatDate value="${item.lastDateUsed}" /></td>
                                    <td>
                                        <form method="post">
                                            <input type="submit" value="Detaya Git" formaction="../packetdetail" class="btn btn-info"/>
                                            <input type="submit" value="Düzenle" formaction="../updatepacket" class="btn btn-success"/>
                                            <input type="submit" value="Sil" formaction="../deleteannouncementpacket" class="btn btn-danger"/>
                                            <input type="hidden" name="packetId" value="${item.packetId}"/>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <a href="../newannouncementpacketservlet" class="btn btn-info">Yeni Paket Ekle</a>
                </div>
            </div>
        </div>

        <jsp:include page="../html/footer.html"></jsp:include>
    </body>
</html>

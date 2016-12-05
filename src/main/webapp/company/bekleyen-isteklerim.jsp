<%--
  Created by IntelliJ IDEA.
  User: mgunes
  Date: 05.12.2016
  Time: 05:39
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Bekleyen İstekler</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <jsp:include page="html/head.html"/>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="html/header.html"></jsp:include>
        </div>
        <div class="row">
            <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            <div class="col-md-6">
                <h3>Bekleyen İstekleriniz</h3>
                <table class="table table-hovered">
                    <thead>
                        <tr>
                            <th>İstek Tarihi</th>
                            <th>Paket Adı</th>
                            <th>Bağış Kabul Birimi</th>
                            <th>Fiyat(TL)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${packetList}">
                            <tr>
                                <td><fmt:formatDate type="date" value="${item.timeToRequest}"/></td>
                                <td>${item.packet.title}</td>
                                <td>${item.packet.accountInfo.ownerUnit.unitName}</td>
                                <td align="right">${item.packet.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

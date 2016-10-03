<%-- 
    Document   : displaymessage
    Created on : 31.Mar.2016, 02:04:00
    Author     : must
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="html/head.html"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Mesajları Oku</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="html/header.html"/>
        </div>
        <div class="row">
            <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            <div class="col-md-9">
                <h1>Mesajları okuyun</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Mesaj No</th>
                            <th>Başlık</th>
                            <th>Mesaj</th>
                            <th>Zaman</th>
                            <th>Okundu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${message}">
                            <tr>
                                <td>${item.messageNo}</td>
                                <td>${item.messageTitle}</td>
                                <td>${item.messageBody}</td>
                                <td><fmt:formatDate value="${item.dateTime}" /></td> 
                                <td>${item.isRead}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <jsp:include page="../html/footer.html"></jsp:include>     
    
</body>
</html>

<%-- 
    Document   : company
    Created on : 14.Nis.2016, 01:10:11
    Author     : must
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="html/head.html"/>
        <title>Anasayfa</title>
    </head>
    <body>

        <jsp:include page="html/menu.html"></jsp:include>
        <div class="jumbotron container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <c:choose>
                        <c:when test="${user.status eq 0 }">
                            <div class="alert alert-warning">
                                Lütfen mail üzerinden hesabınızı aktif hale getiriniz.
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
</html>

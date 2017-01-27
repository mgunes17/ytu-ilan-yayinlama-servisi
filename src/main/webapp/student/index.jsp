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
        <jsp:include page="html/head.html"></jsp:include>
		<title>Öğrenci</title>
	</head>
	<body>
		<c:choose>
            <c:when test="${user.status eq 6}">
                <div class="jumbotron container-fluid">
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <c:if test="${yeniparola eq 2}">
                                <div class="alert alert-danger">
                                    Bir hata meydana geldi.
                                </div>
                            </c:if>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <p>Yeni parola oluşturun.</p>
                                </div>
                                <div class="panel-body">
                                    <form method="post" action="../savenewpasswordstudent">
                                        <div class="form-group">
                                            <label for="password">Parola</label>
                                            <input type="text" name="password" id="password" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="passwordAgain">Parola</label>
                                            <input type="text" name="passwordAgain" id="passwordAgain" class="form-control">
                                        </div>

                                        <button type="submit" class="btn btn-success">Kaydet</button>
                                    </form>
                                </div>
                            </div>

                            <a href="../logoutservlet" class="btn btn-danger">Çıkış Yap</a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <jsp:include page="html/menu.html"/>
                <div class="jumbotron container-fluid">
                    <div class="row">
                        <c:if test="${yeniparola eq 1}">
                            <div class="alert alert-success">
                                Şifreniz başarıyla güncellendi.
                            </div>
                        </c:if>
                        <h4>Hoşgeldiniz ${user.userName}</h4>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${user.status eq 0 }">
                        <div class="alert alert-warning">
                            Hesabınızı aktif hale getirmeden ilanlar ile ilgili işlemler yapamazsınız.<br/>
                            <b>Hesabınızı <a href="../activatestudentaccount">buradan</a> aktif hale getirebilirsiniz</b>
                        </div>
                    </c:when>
                </c:choose>
            </c:otherwise>
        </c:choose>
	</body>
</html>

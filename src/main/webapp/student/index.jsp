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
		<jsp:include page="html/menu.html"/>
		<div class="jumbotron container-fluid">
			<div class="row">
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
	</body>
</html>

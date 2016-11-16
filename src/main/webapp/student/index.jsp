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
        <jsp:include page="../html/head.html"></jsp:include>
    <title>Öğrenci</title>
</head>
<body>
 	<div class="container-fluid">
 		<div class="row">
 			<jsp:include page="html/header.html"></jsp:include>
 		</div>
 		
 		<div class="row">
 			<h4>Hoşgeldiniz ${user.userName}</h4>
 			<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 		</div>
 	</div>
    
     <c:choose>
    	<c:when test="${user.status eq 0 }">
    		<div class="alert alert-warning">
    			Lütfen mail üzerinden hesabınızı aktif hale getiriniz.
    		</div> 		
    	</c:when>
    </c:choose>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>Muhasebe Kayıtları</title>
		<jsp:include page="html/head.html"/>
	</head>
	<body>
		<div class="container-fluid">
	        <div class="row">
	            <jsp:include page="html/header.html"/>
	        </div>
        	<div class="row">
            	<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            	<div class="col-md-4">
					<h4>Bakiye Miktarları</h4>
					<table class="table table-bordered">
						<c:forEach var="item" items="${dau}">
							<tr>
								<th>${item.unitName}</th>
								<td>${item.balance}</td>
							<tr>
						</c:forEach>
					</table>
					
					<h4>İşlem Kayıtları</h4>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Birim Adı</th>
								<th>İşlemi yapan kullanıcı</th>
								<th>İşlem tarihi</th>
								<th>Miktar</th>
							</tr>	
						</thead>
						<tbody>
							<c:forEach var="item" items="${accounting }">
								<tr>
									<td>${item.dauUser.dau.unitName }</td>
									<td>${item.dauUser.userName }</td>
									<td><fmt:formatDate type="date" value="${item.accountingPK.dateTime}"/></td>
									<td>${item.amount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
            </div>
        </div>
	</body>
</html>
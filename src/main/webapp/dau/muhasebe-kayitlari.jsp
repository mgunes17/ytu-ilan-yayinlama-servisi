<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="html/head.html"></jsp:include>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>Hesap İşlem Geçmişi</title>
	</head>
	<body>
		<jsp:include page="html/menu.html"></jsp:include>
		<div class="jumbotron container-fluid">
			<div class="row">
				<div class="col-md-4">
					<h2>İşlem detayları</h2>
					<h4>BKB bakiyesi: ${user.dau.balance}</h4>
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>İşlemi yapan kullanıcı</th>
								<th>İşlem tarihi</th>
								<th>Miktar</th>
							</tr>	
						</thead>
						<tbody>
							<c:forEach var="item" items="${accounting }">
								<tr>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="html/head.html"></jsp:include>
		<title>Onay Bekleyen Bağışlar</title>
	</head>
	<body>
	<jsp:include page="html/menu.html"></jsp:include>
		<div class="jumbotron container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-7">
					<h1>Onay Bekleyen Bağışlar</h1>

					<c:choose>
						<c:when test="${onaylandi eq 1}">
							<div class="alert alert-success">
								Talebi başarıyla onayladınız.
							</div>
							<div class="alert alert-info">
								Vakfınız adına onaylanmış paketlere <a href="#">buradan</a> ulaşabilirsiniz.
							</div>
						</c:when>
						<c:when test="${onaylandi eq 2}">
							<div class="alert alert-danger">
								Talep onaylanırken bir hata oluştu.
								Lütfen daha sonra tekrar deneyiniz.
							</div>
						</c:when>
					</c:choose>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Paket No</th>
								<th>Paket Fiyatı</th>
								<th>Şirket Adı</th>
								<th>İstek Yollanan Zaman</th>
								<th>Onay Durumu</th>
								<th>İşlem</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${packet}">
								<tr>
									<td>${item.id}</td>
									<td>${item.packet.price}</td>
									<td>${item.ownerCompany.companyName}</td>
									<td><fmt:formatDate type="date" value="${item.timeToRequest}"/></td>
									<td>${item.approved}</td>
									<td>
										<form method="post">
											<input type="hidden" name="packetId" value="${item.id}" />
											<input class="btn-default"
												type="submit"
												value="Onayla"
												formaction="../approveddonationservlet">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<jsp:include page="../html/footer.html"></jsp:include>
			</div>
		</div>
	</body>
</html>
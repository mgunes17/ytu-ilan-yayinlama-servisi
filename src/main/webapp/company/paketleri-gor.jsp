<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>İlan Paketleri</title>
		<jsp:include page="html/head.html"/>
	</head>
	<body>
		<!-- Paket sıralama kriterleri -->
		<!-- Detaylar tıklanınca açılsın -->
		<jsp:include page="html/menu.html"/>
		<div class="jumbotron container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<c:choose>
						<c:when test="${donation_request eq 1}">
							<div class="alert alert-success">
								Bağış uyarınız gönderilmiştir.
							</div>
						</c:when>
						<c:when test="${donation_request eq 2}">
							<div class="alert alert-warning">
								Bir hata oluştur lütfen tekrar deneyiniz.
							</div>
						</c:when>
					</c:choose>

					<table class="table table-stripped">
						<thead>
							<tr>
								<th>Paket Başlığı</th>
								<th>İlan yayınlama Hakkı</th>
								<th>Yayın Süresi(Gün)</th>
								<th>Fiyat (TL)</th>
								<th>Son kullanım tarihi</th>
								<th>İlişkilendirilen Vakıf</th>
								<th>İşlem</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${packets}">
								<tr>
									<td>${item.title}</td>
									<td align="right">${item.announcementCount}</td>
									<td align="right">${item.activeTime}</td>
									<td align="right">${item.price}</td>
									<td>${item.lastDateUsed}</td>
									<td>${item.accountInfo.ownerUnit.unitName}</td>
									<td>
										<form method="post">
											<input type="hidden" name="packetId" value="${item.packetId}" />
											<input
												type="submit" class="btn btn-default"
												value="Bağış Yaptım" formaction="../donationrequestservlet">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="html/header.html"></jsp:include>
		</div>
		<div class="row">
			<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
			<div class="col-md-7">
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
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Paket Başlığı</th>
							<th>İlan yayınlama Hakkı</th>
							<th>Yayın Süresi(Gün)</th>
							<th>Fiyat</th>
							<th>Son kullanım tarihi</th>
							<th>İlişkilendirilen Vakıf</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${packets}">
							<tr>
								<td>${item.title}</td>
								<td>${item.announcementCount}</td>
								<td>${item.activeTime}</td>
								<td>${item.price} ${item.currency.title}</td>
								<td>${item.lastDateUsed}</td>
								<td>${item.accountInfo.ownerUnit.unitName}</td>
								<td>
			                        <form method="post">
			                            <input type="hidden" name="packetId" value="${item.packetId}" />
			                            <input 
			                                type="submit" 
			                                value="Bağış Yaptım" formaction="../donationrequestservlet">
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
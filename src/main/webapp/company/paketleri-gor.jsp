<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>İlan Paketleri</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<!-- Paket sıralama kriterleri -->
	<!-- Detaylar tıklanınca açılsın -->
	
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
					<td>${item.donateAcceptUnit.unitName}</td>
					<td>
                        <form method="post">
                            <input type="hidden" name="packetId" value="${item.packetId}" />
                            <input 
                                type="submit" 
                                value="Bağış Yaptım" 
                                formaction="../donationrequestservlet">
                        </form>
                    </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
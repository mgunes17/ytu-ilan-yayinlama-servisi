<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<!-- Paket sıralama kriterleri -->
	<!-- Detaylar tıklanınca açılsın -->
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
					<td>${item.donateAcceptUnit.userName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
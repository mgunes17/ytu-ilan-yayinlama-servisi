<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>İlanlar</title>
</head>
<body>
	<h5>Anahtar kelime veya kriter bazında arama yapabilirsiniz</h5>
	
	<table class="table table-stripped">
		<thead>
			<tr>
				<th>İlan Başlığı</th>
				<th>Kısa Açıklama</th>
				<th>İlan Tipi</th>
				<th>Yayınlayan</th>
				<th>Görüntülenme Sayısı</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${announcements}">
				<tr>
					<td>${item.title}</td>
					<td>${item.brief}</td>
					<td>${item.announcementType.title}</td>
					<td>${item.ownerCompany.companyName}</td>
					<td>${item.numberOfPageViews}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
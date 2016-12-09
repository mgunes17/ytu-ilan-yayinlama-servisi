<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../html/head.html"></jsp:include>
		<title>İlanlar</title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
 				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 				<div class="col-md-8">
 					<h5><a href="../searchinitialize">Buradan</a> anahtar kelime veya kriter bazında arama yapabilirsiniz</h5>
					<c:choose>
						<c:when test="${size eq 0}">
							<h4>Üzgünüm, hiç ilan yok!</h4>
						</c:when>
						<c:otherwise>
                            <h4></h4>
                            <a href="../announcementorder?condition=publish_date" class="btn btn-default">Yayınlanma Tarihine Göre Sırala</a>
                            <br/>
							<table class="table table-stripped">
								<thead>
								<tr>
									<th>İlan Başlığı</th>
									<th>Kısa Açıklama</th>
									<th>İlan Tipi</th>
									<th>Yayınlayan</th>
									<th>Görüntülenme Sayısı</th>
                                    <th>Yayınlanma Tarihi</th>
									<th>Detayı Gör</th>
								</tr>
								</thead>
								<tbody>

								<c:forEach var="item" items="${announcements}">
									<tr>
										<td>${item.title}</td>
										<td width="30%">${item.brief}</td>
										<td>${item.announcementType.title}</td>
										<td>${item.ownerCompany.companyName}</td>
										<td>${item.numberOfPageViews}</td>
                                        <td><fmt:formatDate type="date" value="${item.publishDate}"/></td>
										<td>
											<form action = "../announcementdetailtostudent" method = "post">
												<input type = "hidden" name = "announcement" value = "${item.id}"/>
												<input type = "submit" value  ="Detayı Gör"/>
											</form>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
 				</div>
 			</div>
		</div>
	</body>
</html>
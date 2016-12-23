<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="html/head.html"/>
		<title>Paketlerim</title>
	</head>
	<body>
		<jsp:include page="html/menu.html"/>
		<div class="jumbotron container-fluid">
			<div class="row">
                <div class="col-md-2"></div>
				<div class="col-md-8">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Durumu</th>
								<th>Paket Başlığı</th>
								<th>Kalan İlan Sayısı</th>
								<th>Alınan Tarih(Onay Zamanı)</th>
								<th>Son kullanım tarihi</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${packets}">
								<tr>
									<td>${item.state.title}</td>
									<td>${item.packet.title}</td>
									<td>${item.packet.announcementCount - item.usedAnnouncements}</td>
									<td>${item.timeToApproved}</td>
									<td>${item.packet.lastDateUsed}</td>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <jsp:include page="html/head.html"/>
    	<title>İlanlarım</title>
	</head>
	<body>
		<div class="container-fluid">
		
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
	
			<div class="row">
				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
				<div class="col-md-8">   
				
				<h4>${announcement.id} nolu ilanınızın detayları</h4>
				
				<table class="table table-stripped">
					<tr>
						<th>İlan No:</th>
						<td>${announcement.id}</td>
					</tr>
					<tr>
						<th>İlan Başlığı:</th>
						<td>${announcement.title}</td>
					</tr>
					<tr>
						<th>Kısa Açıklama:</th>
						<td>${announcement.brief}</td>
					</tr>
					<tr>
						<th>Açıklama:</th>
						<td>${announcement.content}</td>
					</tr>
					<tr>
						<td><button class="btn btn-default" name ="appList" type="submit">İlanı Düzenle</button></td>
					<tr>
				</table>
				
				<h4><strong>Yapılan Başvurular</strong></h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Ad</th>
							<th>Soyad</th>
							<th>Bölüm</th>
							<th>İşlem</th>
						</tr>							
					</thead>
					<tbody>
						<c:forEach var="item" items="${announcement.appStudentList }">
							<tr>
								<td>${item.pk.user.name }</td>
								<td>${item.pk.user.surname }</td>
								<td>${item.pk.user.department.name }</td>
								<td>
									<form action="#"> <!-- CV pdf olarak görüntülensin -->
										<button class="btn btn-default" name ="studentcv" value="${appList.username}" type="submit">
											CV Görüntüle
										</button>
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
	s</body>
</html>
	
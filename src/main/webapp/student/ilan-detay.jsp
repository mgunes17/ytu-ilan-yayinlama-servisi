<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>İlan Detay</title>
		<jsp:include page="../html/head.html"></jsp:include>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
 				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 				<div class="col-md-4">
 					<c:choose>
 						<c:when test="${basvuruldu eq 1 }">
 							<div class="alert alert-success">
 								Başvurunuz gerçekleşti.
 								Tüm başvurularınızı <a href="#">buradan</a> görebilirsiniz.
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 2 }">
 							<div class="alert alert-danger">
 								Başvurunuz alınamadı.
 								Lütfen daha sonra tekrar deneyin
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 3 }">
 							<div class="alert alert-warning">
 								Başvurunuz silindi.
 								İsterseniz yeniden başvurabilirsiniz.
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 4 }">
 							<div class="alert alert-alert">
 								Başvurunuz silinemedi.
 								Lütfen daha sonra tekrar deneyin.
 							</div>
 						</c:when>
 					</c:choose>
 					<table class="table table-bordered">
 						<tr>
 							<th>Şirket Adı</th>
 							<td>${announcement.ownerCompany.companyName}</td>
 						</tr>
 						<tr>
 							<th>İlan Başlığı</th>
 							<td>${announcement.title}</td>
 						</tr>
 						<tr>
 							<th>Kısa Açıklama</th>
 							<td>${announcement.brief}</td>
 						</tr>
 						<tr>
 							<th colspan="2">Detay</th>
 						</tr>
 						<tr>
 							<td colspan="2">${announcement.content }</td>
 						</tr>
 						<tr>
 							<th>Görüntülenme Sayısı</th>
 							<td>${announcement.numberOfPageViews}</td>
 						</tr>
 						<tr>
 							<th>Başvuru sayısı</th>
 							<td>${fn:length(announcement.appStudentList)}</td>
 						</tr>
 						<tr>
							<th>Kategori</th>
							<td>${announcement.category.categoryName }</td>
						</tr>
						<tr>
							<th>Yayınlanma Tarihi</th>
							<td><fmt:formatDate value="${announcement.publishDate }"/></td>
						</tr>	
 						<tr>
 							<td colspan="2">
 								<form method = "post">
 									<input type = "hidden" name = "announcement" value = "${announcement.id}" >
 									<c:if test="${basvuruvar eq 1 }">
 										<input type="hidden" name="deleteUrl" value="student/ilan-detay.jsp">
 										 <input disabled class="btn btn-primary disabled" type="submit" value="Başvur">
 										 <input formaction="../deleteapplication" class="btn btn-warning active" type = "submit" value = "Başvuruyu Geri Çek">
 									</c:if>
 									<c:if test="${basvuruvar eq 2 }">										
 										 <input type = "submit" value = "İlana Başvur" formaction = "../applicationtoannouncement" class="btn btn-primary active">
 										 <input disabled formaction="#" type = "submit" value = "Başvuruyu Geri Çek" class="btn btn-warning disabled">
 									</c:if>														
									<input type = "submit" value = "Şikayet Et">
								</form>
							</td>
 						</tr>
 					</table>
 				</div>
 			</div>
		</div>	
	
	
	</body>
</html>
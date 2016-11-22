<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>�lan Detay</title>
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
 								Ba�vurunuz ger�ekle�ti.
 								T�m ba�vurular�n�z� <a href="#">buradan</a> g�rebilirsiniz.
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 2 }">
 							<div class="alert alert-danger">
 								Ba�vurunuz al�namad�.
 								L�tfen daha sonra tekrar deneyin
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 3 }">
 							<div class="alert alert-warning">
 								Ba�vurunuz silindi.
 								�sterseniz yeniden ba�vurabilirsiniz.
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 4 }">
 							<div class="alert alert-alert">
 								Ba�vurunuz silinemedi.
 								L�tfen daha sonra tekrar deneyin.
 							</div>
 						</c:when>
 					</c:choose>
 					<table class="table table-bordered">
 						<tr>
 							<th>�irket Ad�</th>
 							<td>${announcement.ownerCompany.companyName}</td>
 						</tr>
 						<tr>
 							<th>�lan Ba�l���</th>
 							<td>${announcement.title}</td>
 						</tr>
 						<tr>
 							<th>K�sa A��klama</th>
 							<td>${announcement.brief}</td>
 						</tr>
 						<tr>
 							<th colspan="2">Detay</th>
 						</tr>
 						<tr>
 							<td colspan="2">${announcement.content }</td>
 						</tr>
 						<tr>
 							<th>G�r�nt�lenme Say�s�</th>
 							<td>${announcement.numberOfPageViews}</td>
 						</tr>
 						<tr>
 							<th>Ba�vuru say�s�</th>
 							<td>${fn:length(announcement.appStudentList)}</td>
 						</tr>
 						<tr>
							<th>Kategori</th>
							<td>${announcement.category.categoryName }</td>
						</tr>
						<tr>
							<th>Yay�nlanma Tarihi</th>
							<td><fmt:formatDate value="${announcement.publishDate }"/></td>
						</tr>	
 						<tr>
 							<td colspan="2">
 								<form method = "post">
 									<input type = "hidden" name = "announcement" value = "${announcement.id}" >
 									<c:if test="${basvuruvar eq 1 }">
 										<input type="hidden" name="deleteUrl" value="student/ilan-detay.jsp">
 										 <input disabled class="btn btn-primary disabled" type="submit" value="Ba�vur">
 										 <input formaction="../deleteapplication" class="btn btn-warning active" type = "submit" value = "Ba�vuruyu Geri �ek">
 									</c:if>
 									<c:if test="${basvuruvar eq 2 }">										
 										 <input type = "submit" value = "�lana Ba�vur" formaction = "../applicationtoannouncement" class="btn btn-primary active">
 										 <input disabled formaction="#" type = "submit" value = "Ba�vuruyu Geri �ek" class="btn btn-warning disabled">
 									</c:if>														
									<input type = "submit" value = "�ikayet Et">
								</form>
							</td>
 						</tr>
 					</table>
 				</div>
 			</div>
		</div>	
	
	
	</body>
</html>
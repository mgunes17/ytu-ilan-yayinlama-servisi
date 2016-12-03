<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>CV D�zenle</title>
		<jsp:include page="../html/head.html"></jsp:include>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
<body>
	<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
 				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 				<div class="col-md-7">
 					<h2>CV' nizi D�zenleyin</h2>
 					<p>Lorem Ipsum</p> kapal�-herkes-ba�vurduklar�m
 					
 					<h4>Ki�isel Bilgiler</h4>
 					<form>
 						<div class="form-group">
 							<label for="name"></label>
 						</div>
 						<div class="form-group">
 							<label for="surname"></label>
 						</div> 						
					</form> 
					
					<c:choose>
						<c:when test="${iletisim eq 1 }">
							<div class="alert alert-success">
								Yeni ileti�im tipi eklendi.
							</div>
						</c:when>
						<c:when test="${iletisim eq 2 }">
							<div class="alert alert-danger">
								Eklenirken bir hata meydana geldi.
							</div>
						</c:when>
						<c:when test="${iletisim eq 3 }">
							<div class="alert alert-success">
								�leti�im bilginiz silindi.
							</div>
						</c:when>
						<c:when test="${iletisim eq 4 }">
							<div class="alert alert-danger">
								Silinirken bir hata meydana geldi.
							</div>
						</c:when>
					</c:choose>
					<h3>�leti�im Bilgileri</h3>
					<form action="../updatecommway">
						<div class="form-group">
							<label for="commTitle">�leti�im Tipi</label>
							<input type="text" class="form-control" id="commTitle" name="commTitle" placeholder="telefon,mail,linkedin vb">
						</div>
						<div class="form-group">
							<label for="commValue">De�eri</label>
							<input type="text" class="form-control" id="commValue" name="commValue" placeholder="adres/numara">
						</div>				
						<button type="submit" class="btn btn-default">Kaydet</button>
					</form>
					<h4>Mevcut �leti�im Bilgileriniz</h4>
					<table class="table table-stripped">
						<thead>
							<tr>
								<th>�leti�im Tipi</th>
								<th>De�eri</th>
								<th>��lem</th>
							</tr>					
						</thead>
						<tbody>
							<c:forEach var="item" items="${commWays}">
								<tr>
									<td>${item.pk.commType }</td>
									<td>${item.pk.commValue }</td>
									<td>
										<form>
											<input type="hidden" name="commType" value="${item.pk.commType }"/>
											<input type="hidden" name="commValue" value="${item.pk.commValue }"/>
											<input type="submit" class="btn btn-default" value="Sil" formaction="../deletecomm"/>
										</form>
									</td>
								</tr>
							</c:forEach>
							<tr>
								
							</tr>
						</tbody>
					</table>
					
					<form>
 						<div class="form-group">
 							<label for="">�niversiteye Giri� Y�l�n�z</label>
 						</div>
 						<div class="form-group">
 							<label for=""></label>
 						</div>
 						<div class="form-group">
 							<label for=""></label>
 						</div>
 						<div class="form-group">
 							<label for=""></label>
 						</div>
 					</form>
 					
 					<p>CV'i pdf olarak yazd�r</p>
 				</div>
 			</div>
 	</div>
</body>
</html>
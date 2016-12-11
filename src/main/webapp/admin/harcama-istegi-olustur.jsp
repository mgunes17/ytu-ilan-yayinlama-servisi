<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="html/head.html"/>	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Harcama İsteği Oluştur</title>
	</head>
	<body>
		<div class="container-fluid">
	        <div class="row">
	            <jsp:include page="html/header.html"/>
	        </div>
        	<div class="row">
            	<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            	<div class="col-md-5">
            		<h4>Bakiye Miktarları</h4>
					<table class="table table-bordered">
						<c:forEach var="item" items="${dau}">
							<tr>
								<th>${item.unitName}</th>
								<td>${item.balance}</td>
							<tr>
						</c:forEach>
					</table>
					
					<c:choose>
						<c:when test="${harcamaistegi eq 1 }">
							<div class="alert alert-success">
								Harcama isteği ilgili vakıf kullanıcılarına gönderildi. Harcama yapıldığı zaman
								bilgilendirileceksiniz.
							</div>
							
							<c:if test="${toplamistekler eq 1 }">
								<div class="alert alert-warning">
									${birim} biriminin bakiyesi, yapmış olduğunuz tüm istekleri karşılamaya yetmemektedir.
									<a href="#">Buradan</a> oluşturduğunuz harcama isteklerini düzenleyebilirsiniz. 
								</div>
							</c:if>
						</c:when>
						<c:when test="${harcamaistegi eq 2 }">
							<div class="alert alert-danger">
								<strong>Başarısız! </strong>Seçmiş olduğunuz vakfın bakiyesinden daha büyük bir miktarda 
								harcama isteği yaptınız.
							</div>
						</c:when>
						<c:when test="${harcamaistegi eq 3 }">
							<div class="alert alert-danger">
								Kaydedilirken bir hata meydana geldi. Lütfen tekrar deneyin.
							</div>
						</c:when>
					</c:choose>
					
					<form 
						name="spendingRequestForm" 
						action="../sendspendingrequest" 
						onsubmit="return validateForm()"
						class="form-horizontal" 
						method="post">
						<h4>Harcama İsteği Oluşturun</h4>
						
						<div class="form-group">
							<label  class="control-label col-sm-2" for="title">İstek Başlığı</label>
							<div class="col-sm-10">
								<input id="title" class="form-control" type="text" name="title" value="${title}" required>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-2" for="">Detaylı Açıklama</label>
							<div class="col-sm-10"> 
								<textarea rows="10" cols="40" name="content" class="form-control" required>${content}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-2" for="">Tutar</label>
							<div class="col-sm-10"> 
								<input id="title" class="form-control" type="text" value="${amount}" name="amount" pattern="[0-9]{1,4}" 
								required title="Lütfen saysal değer giriniz">
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-2" for="">Vakıf Seçiniz</label>
							<div class="col-sm-10">
								<select name="dau">
                      				<c:forEach var="item" items="${dau}">
                          				<option value="${item.unitName}">
                              				<c:out value="${item.unitName}"/>                              				
                          				</option>
                      				</c:forEach>
                  				</select>
							</div>
						</div>
						
						<button type="submit" class="btn btn-default">İstek Oluştur</button>
					</form>
            		
            	</div>
           </div>
        </div>
	</body>
</html>
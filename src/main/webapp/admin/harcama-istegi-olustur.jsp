<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html">
<html>
	<head>
		<jsp:include page="html/head.html"/>	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Harcama �ste�i Olu�tur</title>
	</head>
	<body>
		<div class="container-fluid">
	        <div class="row">
	            <jsp:include page="html/header.html"/>
	        </div>
        	<div class="row">
            	<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            	<div class="col-md-5">
            		<h4>Bakiye Miktarlar�</h4>
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
								Harcama iste�i ilgili vak�f kullan�c�lar�na g�nderildi. Harcama yap�ld��� zaman
								bilgilendirileceksiniz.
							</div>
							
							<c:if test="${toplamistekler eq 1 }">
								<div class="alert alert-warning">
									${birim} biriminin bakiyesi, yapm�� oldu�unuz t�m istekleri kar��lamaya yetmemektedir.
									<a href="#">Buradan</a> olu�turdu�unuz harcama isteklerini d�zenleyebilirsiniz. 
								</div>
							</c:if>
						</c:when>
						<c:when test="${harcamaistegi eq 2 }">
							<div class="alert alert-danger">
								<strong>Ba�ar�s�z! </strong>Se�mi� oldu�unuz vakf�n bakiyesinden daha b�y�k bir miktarda 
								harcama iste�i yapt�n�z.
							</div>
						</c:when>
						<c:when test="${harcamaistegi eq 3 }">
							<div class="alert alert-danger">
								Kaydedilirken bir hata meydana geldi. L�tfen tekrar deneyin.
							</div>
						</c:when>
					</c:choose>
					
					<form 
						name="spendingRequestForm" 
						action="../sendspendingrequest" 
						onsubmit="return validateForm()"
						class="form-horizontal" 
						method="post">
						<h4>Harcama �ste�i Olu�turun</h4>
						
						<div class="form-group">
							<label  class="control-label col-sm-2" for="title">�stek Ba�l���</label>
							<div class="col-sm-10">
								<input id="title" class="form-control" type="text" name="title" value="${title}" required>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-2" for="">Detayl� A��klama</label>
							<div class="col-sm-10"> 
								<textarea rows="10" cols="40" name="content" class="form-control" required>${content}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-2" for="">Tutar</label>
							<div class="col-sm-10"> 
								<input id="title" class="form-control" type="text" value="${amount}" name="amount" pattern="[0-9]{1,4}" 
								required title="L�tfen saysal de�er giriniz">
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-2" for="">Vak�f Se�iniz</label>
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
						
						<button type="submit" class="btn btn-default">�stek Olu�tur</button>
					</form>
            		
            	</div>
           </div>
        </div>
	</body>
</html>
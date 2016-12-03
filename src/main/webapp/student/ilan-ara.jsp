<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<jsp:include page="../html/head.html"></jsp:include>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>İlan Ara</title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
				<div class="col-md-7">
					<p>Kayıtlı Kriterlerime Göre Ara</p>
					
					<p>Seçim yap</p>
					<form action="../searchannouncement">
						<div class="form-group">
							<label>İlan Kategorisi</label>
							<select name="category" class="form-control">
					            <c:forEach var="item" items="${categoryList}">
					            	<c:if test="${item.id ne 0 }">
					            		<option selected disabled value="${item.id}">
					                    <c:out value="${item.categoryName} Alt Kategorileri"/>
						                </option>
						                <c:forEach var="childItem" items="${item.children}">
						                	<option value="${childItem.id}">
						                    	<c:out value="----${childItem.categoryName}"/>
						                	</option>
						                </c:forEach>
					            	</c:if>			                
					            </c:forEach>
					        </select>
						</div>
						<div class="form-group">
							<label>İlan Tipi</label>
							<select name="type" class="form-control">
					            <c:forEach var="item" items="${annType}">
					                <option value="${item.id}">
					                    <c:out value="${item.title}"/>
					                </option>
					            </c:forEach>
					        </select>
						</div>
						<div class="form-group">
							<label>İlanın Dili</label>
							<select name="language" class="form-control" id="language">				    
				                <option value="türkçe">Türkçe</option>
				                <option value="ingilizce">İngilizce</option>
					        </select>
						</div>
						<div class="form-group">
							<label for="keyword">Anahtar Kelimeler</label>
							<p>Kelimeler arasında virgül bırakın.(Ör: java,hibernate,css)</p>
							<input type="text" name="keywords" placeholder="Anahtar Kelimeler" class="form-control" id="keyword">
							<input type="checkbox" name="rememberMe" value="1">Anahtar Kelime Kullan
						</div>
						
						<button type="submit" class="btn btn-default">Ara</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
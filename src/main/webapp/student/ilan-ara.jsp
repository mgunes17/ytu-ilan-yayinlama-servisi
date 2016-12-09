<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../html/head.html"></jsp:include>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
		<title>İlan Ara</title>
        <style>
            .slow .toggle-group { transition: left 0.7s; -webkit-transition: left 0.7s; }
        </style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
				<div class="col-md-4">
					<p>Kayıtlı Kriterlerime Göre Ara</p>
					
					<p>Seçim yap</p>
					<form action="../searchannouncement">
						<div class="form-group">
							<label>İlan Kategorisi</label>
							<select name="category" class="form-control">
					            <c:forEach var="item" items="${categoryList}">
					            	<c:if test="${item.id ne 0 }">
                                        <c:if test="${item.parentCategory eq 0}">
                                            <option selected value="${item.id}">
                                                <b><c:out value="${item.categoryName}"/></b>
                                            </option>
                                            <c:forEach var="childItem" items="${item.children}">
                                                <option value="${childItem.id}">
                                                    <c:out value="----${childItem.categoryName}"/>
                                                </option>
                                            </c:forEach>
                                        </c:if>
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
                                <option value="alllanguages">Tüm Diller</option>
				                <option value="türkçe">Türkçe</option>
				                <option value="ingilizce">İngilizce</option>
					        </select>
						</div>
						<div class="form-group">
							<label for="keyword">Anahtar Kelimeler</label>
							<p>Kelimeler arasında virgül bırakın.(Ör: java,hibernate,css)</p>
							<input type="text" name="keywords" placeholder="Anahtar Kelimeler" class="form-control" id="keyword">
                            <br/>
							<input type="checkbox" name="usekw" checked data-toggle="toggle" id="toggle-one" data-style="slow"
                                   data-onstyle="primary" data-offstyle="danger" value="1" data-on="Evet" data-off="Hayır">Anahtar Kelime Kullan
						</div>
						
						<button type="submit" class="btn btn-default">Ara</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
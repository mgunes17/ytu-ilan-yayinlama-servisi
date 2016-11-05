<%-- 
    Document   : newannouncement
    Created on : 22.Nis.2016, 13:55:41
    Author     : must
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <jsp:include page="html/head.html"/>
    	<title>İlan Oluştur</title>
	</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="html/header.html"></jsp:include>
		</div>
		<div class="row">
			<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
			<div class="col-md-5">
				<h1>Yeni İlanınızı Oluşturun</h1>
			    <form method="POST" action="../announcementcreateservlet">
			    	<div class="form-group">
			    		<label for="title">İlan Başlığı</label>
			    		<input type="text" name="title" id="title" class="form-control"/>
			    	</div>
			    	<div class="form-group">
			    		<label for="brief">Kısa Açıklama</label>
			    		<input type="text" name="brief" id="brief" class="form-control"/>
			    	</div>
			    	<div class="form-group">
			    		<label for="content">İlan Detayları</label>
			    		<textarea rows="4" cols="50" name="content" id="content" class="form-control"></textarea>
			    	</div>
			        <div class="form-group">
			        	<label for="">İlan Tipi</label>
			        	<select name="type" class="form-control">
				            <c:forEach var="item" items="${annType}">
				                <option value="${item.id}">
				                    <c:out value="${item.title}"/>
				                </option>
				            </c:forEach>
				        </select>
			        </div>
			        <button type="submit" class="btn btn-default">Oluştur</button>
			    </form>
			    
			    <c:choose>
			    	<c:when test="${olusturuldu eq 1}">
			    		<div class="alert alert-success">
			                <strong>Oluşturuldu!</strong> İlanınız başarıyla oluşturuldu. 
			                İlanınızı <a href="../listmyannouncementsservlet"><strong>buradan</strong></a> düzenleyebilir veya
			                aktif hale getirebilirsiniz.
			            </div>
			            <div class="alert alert-info">
			            	Oluşturduğunuz ilanları <a href="../listmyannouncementsservlet"><strong>buradan</strong></a> görebilirsiniz.
			            </div>
			    	</c:when>
			    	<c:when test="${olusturuldu eq 2}">
			    		<div class="alert alert-danger">
			                <strong>Oluşturulamadı!</strong> İlan oluşturulurken bir hata
			                meydana geldi. Lütfen tekrar deneyiniz.
			            </div>
			    	</c:when>
			    </c:choose>
			</div>
		</div>
		<div class="row">
			<jsp:include page="../html/footer.html"></jsp:include>
		</div>
	</div>
</body>
</html>

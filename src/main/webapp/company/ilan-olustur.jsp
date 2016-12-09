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
			    
				<h1>Yeni İlanınızı Oluşturun</h1>
			    <form method="POST" action="../announcementcreate">
			    	<div class="form-group">
			    		<label for="title">İlan Başlığı</label>
			    		<input type="text" name="title" id="title" class="form-control" pattern=".{1,30}"
			    			required title="1-30 karakter aralığında olmalı"/>
			    	</div>
			    	<div class="form-group">
			    		<label for="brief">Kısa Açıklama</label>
			    		<textarea name="brief" id="brief" class="form-control"  rows="2" cols="50"></textarea>
			    	</div>
			    	<div class="form-group">
			    		<label for="content">İlan Detayları</label>
			    		<textarea rows="10" cols="50" name="content" id="content" class="form-control"></textarea>
			    	</div>
			        <div class="form-group">
			        	<label for="">İlan Tipi</label>
			        	<select name="type" class="form-control">
                            <c:forEach var="item" items="${annType}">
                                <c:if test="${item.id ne 6}">
                                    <option value="${item.id}">
                                        <c:out value="${item.title}"/>
                                    </option>
                                </c:if>
                            </c:forEach>
				        </select>
			        </div>
			        <div class="form-group">
			        	<label for="">İlan Kategorisi</label>
			        	<p>İlanınız herhangi kategoriye girmiyorsa "root-category" olarak seçin.</p>
			        	<select name="category" class="form-control">
				            <c:forEach var="item" items="${categoryList}">
				            	<c:if test="${item.id ne 0 && item.id ne 3}">
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
			        	<label for="language">İlanın Dili</label>
			        	<select name="language" class="form-control" id="language">				    
			                <option value="türkçe">Türkçe</option>
			                <option value="ingilizce">İngilizce</option>
				        </select>
			        </div>
			        <button type="submit" class="btn btn-default">Oluştur</button>
			    </form>
			</div>
		</div>
		<div class="row">
			<jsp:include page="../html/footer.html"></jsp:include>
		</div>
	</div>
</body>
</html>

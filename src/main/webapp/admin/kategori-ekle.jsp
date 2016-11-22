<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags"  prefix="template" %>


<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="html/head.html"/>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>Yeni Kategori Ekle</title>
	</head>
<body>
	<div class="container-fluid">
        <div class="row">
            <jsp:include page="html/header.html"/>
        </div>
        <div class="row">
            <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
            <div class="col-md-9">
            	<c:choose>
            		<c:when test="${kategorieklendi eq 1 }">
            			<div class="alert alert-success">
            				Kategori başarıyla eklendi.
            			</div>
            		</c:when>
            		<c:when test="${kategorieklendi eq 2 }">
            			<div class="alert alert-danger">
            				Kategori eklenirken bir hata meydana geldi.
            				Lütfen daha sonra tekrar deneyiniz.
            			</div>
            		</c:when>
            		<c:when test="${kategorieklendi eq 3 }">
            			<div class="alert alert-warning">
            				${kategoriadi} zaten oluşturulmuş.
            				Lütfen farklı bir isimle yeniden deneyin.
            			</div>
            		</c:when>
            	</c:choose>
            	
            	<h4>Kategori Ekle</h4>
            	<p>Ana kategeri eklemek için üst kategori olarak "root-category" 'i seçin.</p>
            	<form action="../savecategory">
            		<div class="form-group">
					    <label for="categoryNameID">Kategori Adı</label>
					    <input type="text" class="form-control" id="categoryNameID" name="categoryName">
					</div>
					 <div class="form-group">
					      <label for="sel1">Üst Kategori Seç</label>
					      <select class="form-control" id="sel1" name="parentCategory">
						      <c:forEach var="item" items="${categoryList}">
		                          <option value="${item.id}">
		                              <c:out value="${item.categoryName}"/>
		                          </option>
		                      </c:forEach>
					      </select>
					 </div>
					 
					 <button type="submit" class="btn btn-default">Ekle</button>
            	</form>
            	
            	<h4>Mecvut Kategoriler</h4>
            	<ol>
            		<c:forEach var="item" items="${categoryList}">
            			<li>${item.categoryName }
            				<ol>
            					<c:forEach var="childItem" items="${item.children}">
            						<li>${childItem.categoryName}</li>
            					</c:forEach>
            				</ol>
            			</li>
            		</c:forEach>
            	</ol>
            </div>
        </div>
    </div>
</body>
</html>
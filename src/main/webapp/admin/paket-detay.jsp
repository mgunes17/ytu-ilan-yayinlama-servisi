<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		 <jsp:include page="html/head.html"/>
		<title>Paket Detayları</title>
	</head>
	<body>
		<div class="container-fluid">
	        <div class="row">
	            <jsp:include page="html/header.html"/>
	        </div>
	        <div class="row">
	            <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
	            <div class="col-md-4">
	            	<h3>${packet.packetId} No'lu Paketin Detayları</h3>
	            	<table class="table table-bordered">
	            		<tr>
	            			<th>Başlık</th>
	            			<td>${packet.title }</td>
	            		</tr>
	            		<tr>
	            			<th>İlan Sayısı</th>
	            			<td>${packet.announcementCount }</td>
	            		</tr>
	            		<tr>
	            			<th>Fiyat (TL)</th>
	            			<td>${packet.price }</td>
	            		</tr>
	            		<tr>
	            			<th>Son Kullanım Tarihi</th>
	            			<td>${packet.lastDateUsed }</td>
	            		</tr>
	            		<tr>
	            			<th>Bir İlan İçin Yayın Süresi</th>
	            			<td>${packet.activeTime }</td>
	            		</tr>
	            		<tr>
	            			<th>Açıklama</th>
	            			<td>${packet.condition }</td>
	            		</tr>
	            		<tr>
	            			<th>Tanımlı Banka Adı</th>
	            			<td>${packet.accountInfo.bankName }</td>
	            		</tr>
	            		<tr>
	            			<th>IBAN No</th>
	            			<td>${packet.accountInfo.iban}</td>
	            		</tr>
	            	</table>
	            </div>
	        </div>
	    </div>
	</body>
</html>
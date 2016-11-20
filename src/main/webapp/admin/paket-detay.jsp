<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		 <jsp:include page="html/head.html"/>
		<title>Paket Detaylar�</title>
	</head>
	<body>
		<div class="container-fluid">
	        <div class="row">
	            <jsp:include page="html/header.html"/>
	        </div>
	        <div class="row">
	            <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
	            <div class="col-md-4">
	            	<h3>${packet.packetId} No'lu Paketin Detaylar�</h3>
	            	<table class="table table-bordered">
	            		<tr>
	            			<th>Ba�l�k</th>
	            			<td>${packet.title }</td>
	            		</tr>
	            		<tr>
	            			<th>�lan Say�s�</th>
	            			<td>${packet.announcementCount }</td>
	            		</tr>
	            		<tr>
	            			<th>Fiyat (TL)</th>
	            			<td>${packet.price }</td>
	            		</tr>
	            		<tr>
	            			<th>Son Kullan�m Tarihi</th>
	            			<td>${packet.lastDateUsed }</td>
	            		</tr>
	            		<tr>
	            			<th>Bir �lan ��in Yay�n S�resi</th>
	            			<td>${packet.activeTime }</td>
	            		</tr>
	            		<tr>
	            			<th>A��klama</th>
	            			<td>${packet.condition }</td>
	            		</tr>
	            		<tr>
	            			<th>Tan�ml� Banka Ad�</th>
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
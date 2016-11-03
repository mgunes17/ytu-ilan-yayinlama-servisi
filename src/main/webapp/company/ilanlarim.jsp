<%-- 
    Document   : myannouncements
    Created on : 22.Nis.2016, 23:19:46
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <jsp:include page="html/head.html"/>
    <title>İlanlarım</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="html/header.html"></jsp:include>
		</div>
		<div class="row">
			<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
			<div class="col-md-8">   
   				<h4><strong>Aktif İlanlarınız</strong></h4>
			    <table class="table table-bordered">
			        <thead>
			            <tr>
			                <th>İlan No</th>
			                <th>Başlık</th>
			                <th>Ön Açıklama</th>
			                <th>Durum</th>
			                <th>Paket(Varsa)</th>
			                <th>Başvuru Sayısı</th>
			                <th>İşlem</th>
			            </tr>
			        </thead>
			        <tbody>
	
			               <c:forEach var="item" items="${announcements}">
			               	 	<c:if test="${item.state.title == 'active' }">
			               	 		<tr>
										<td>${item.id}</td>
										<td>${item.title}</td>
										<td>${item.brief}</td>
										<td>${item.state.title}</td>
										<td>${item.ownerPacket.packet.title}
										<td>${item.numberOfPageViews}</td>
										<td>
											<form method="post">
											    <input type="hidden" name="packetId" value="${item.id}" />
											    <input 
											        type="submit" value="Detaya Git" 
											        formaction="../announcementdetailservlet"/>
											    <input 
											        type="submit" value="Yayından kaldır" 
											        formaction="../"/>
											       <input 
											        type="submit" value="Sil" 
											        formaction="../deleteannouncementservlet"/>
											        
											</form>
										</td>
									</tr>
			               	 	</c:if>
			               </c:forEach>
			        </tbody>
			    </table>
			    
			    <h4><strong>Pasif İlanlarınız</strong></h4>
			     <table class="table table-bordered">
			        <thead>
			            <tr>
			                <th>İlan No</th>
			                <th>Başlık</th>
			                <th>Ön Açıklama</th>
			                <th>Durum</th>
			                <th>Paket(Varsa)</th>
			                <th>Başvuru Sayısı</th>
			                <th>İşlem</th>
			            </tr>
			        </thead>
			        <tbody>		     				
			               <c:forEach var="item" items="${announcements}">
			               	 	<c:if test="${item.state.title == 'passive' }">
			               	 		<tr>
										<td>${item.id}</td>
										<td>${item.title}</td>
										<td>${item.brief}</td>
										<td>${item.state.title}</td>
										<td>${item.ownerPacket.packet.title}
										<td>${item.numberOfPageViews}</td>
										<td>
											<form method="post">
											    <input type="hidden" name="packetId" value="${item.id}" />
											    <input 
											        type="submit" value="Detaya Git" 
											        formaction="../announcementdetailservlet"/>
											    <input 
											        type="submit" value="Yayına al" 
											        formaction="../"/>
											       <input 
											        type="submit" value="Sil" 
											        formaction="../deleteannouncementservlet"/>
											        
											</form>
										</td>
									</tr>
			               	 	</c:if>
			               </c:forEach>
		               </tbody>
			    </table>
			    
			    <h4><strong>Son Kullanma Tarihi Geçen İlanlarınız</strong></h4>
			     <table class="table table-bordered">
			        <thead>
			            <tr>
			                <th>İlan No</th>
			                <th>Başlık</th>
			                <th>Ön Açıklama</th>
			                <th>Durum</th>
			                <th>Paket(Varsa)</th>
			                <th>Başvuru Sayısı</th>
			                <th>İşlem</th>
			            </tr>
			        </thead>
			        <tbody>
			               <c:forEach var="item" items="${announcements}">
			               	 	<c:if test="${item.state.title == 'expired' }">
			               	 		<tr>
										<td>${item.id}</td>
										<td>${item.title}</td>
										<td>${item.brief}</td>
										<td>${item.state.title}</td>
										<td>${item.ownerPacket.packet.title}
										<td>${item.numberOfPageViews}</td>
										<td>
											<form method="post">
											    <input type="hidden" name="packetId" value="${item.id}" />
											    <input 
											        type="submit" value="Detaya Git" 
											        formaction="../announcementdetailservlet"/>
											    <input 
											        type="submit" value="Tekrar Yayınla" 
											        formaction="../"/>
											       <input 
											        type="submit" value="Sil" 
											        formaction="../deleteannouncementservlet"/>
											        
											</form>
										</td>
									</tr>
			               	 	</c:if>
			               </c:forEach>
		               </tbody>
			    </table>
			    
			    <h4><strong>Cezalı İlanlarınız</strong></h4>
			    <table class="table table-bordered">
			        <thead>
			            <tr>
			                <th>İlan No</th>
			                <th>Başlık</th>
			                <th>Ön Açıklama</th>
			                <th>Durum</th>
			                <th>Paket(Varsa)</th>
			                <th>Başvuru Sayısı</th>
			                <th>İşlem</th>
			            </tr>
			        </thead>
			        <tbody>
			               <c:forEach var="item" items="${announcements}">
			               	 	<c:if test="${item.state.title == 'suspended' }">
			               	 		<tr>
										<td>${item.id}</td>
										<td>${item.title}</td>
										<td>${item.brief}</td>
										<td>${item.state.title}</td>
										<td>${item.ownerPacket.packet.title}
										<td>${item.numberOfPageViews}</td>
										<td>
											<form method="post">
											    <input type="hidden" name="packetId" value="${item.id}" />
											    <input 
											        type="submit" value="Detaya Git" 
											        formaction="../announcementdetailservlet"/>
											    <input 
											        type="submit" value="Yayından kaldır" 
											        formaction="../"/>
											       <input 
											        type="submit" value="Sil" 
											        formaction="../deleteannouncementservlet"/>
											        
											</form>
										</td>
									</tr>
			               	 	</c:if>
			               </c:forEach>
		               </tbody>
			    </table>
			</div>
		</div>
		<div class="row">
			<jsp:include page="../html/footer.html"></jsp:include>
		</div>
	</div>
</body>
</html>

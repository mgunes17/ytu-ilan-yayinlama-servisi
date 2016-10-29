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
    <title>İlanlarım</title>
</head>
<body>
    <h4><a href="../directcompanymainpageservlet">Anasayfa</a></h4>
   <form action="../logoutservlet" method="post">
         Çıkış Yap</br>
	<input type="submit" value="Logout">
    </form>
    <h1>Oluşturduğunuz tüm ilanlar</h1>
   
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
               </c:forEach>
        </tbody>
    </table>
    
</body>
</html>

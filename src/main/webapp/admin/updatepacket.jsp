<%-- 
    Document   : updatepacket
    Created on : 29.Nis.2016, 18:20:38
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Paket Düzenle</title>
</head>
<body>
    <jsp:include page="adminmain.html"></jsp:include>
    <h1>${packet.packetId} nolu paketi düzenleyin</h1>
    
     <form method="POST" action="../">
        Pakette yer alacak ilan sayısını seçiniz</br>
        <!--ileride bunu açılır liste veya radio button olarak düzelt-->
        <input 
            type="text" 
            value="${packet.announcementCount}" 
            name="announcement_number"/></br>
        
        Kazancın ilişkilendirileceği bağış kabul birimini seçiniz</br>
        <select name="unit" >
           <option value="${packet.donateAcceptUnit}" selected="selected" >${packet.donateAcceptUnit}</option>
            <c:forEach var="item" items="${dau}">
                <option  value="${item.userName}">
                    <c:out value="${item.unitName}"/>
                </option>
            </c:forEach>
        </select></br>
        
        Paketin son kullanım tarihini giriniz yyyy-aa-gg ss:dd</br>
        <input type="text" value="${packet.lastDateUsed}" name="last_date_used"/></br>
        
        İlanların aktif kalma süresini gün olarak giriniz</br>
        <input type="text" value="${packet.activeTime}" name="activate_date"/></br>
        
        Paket fiyatını giriniz</br>
        <input type="text" value="${packet.price}" name="price"/></br>
        
        Para birimini seçiniz</br>
        <select name="currency">
            <option 
                value="${packet.currency}" 
                selected="selected" >${packet.currency}
            </option>
            <c:forEach var="item" items="${curr}">
                <option value="${item.id}">
                    <c:out value="${item.title}"/>
                </option>
            </c:forEach>
        </select></br>
        
        Açıklama giriniz</br>
        <input type="text" value="${packet.donateAcceptUnit}" name="condition"/></br>
        
        <input type="submit" value="Paketi oluştur"/>
    </form>
        
    <form action="../updatepacket" method="post">
        <input type="hidden" name="packetId" value="${packet.packetId}"/>
        <input type="submit" value="Reset"/>
    </form>
</body>
</html>

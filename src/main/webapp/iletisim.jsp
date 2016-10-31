<%-- 
    Document   : iletisim
    Created on : 12.May.2016, 01:51:06
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="html/head.html"></jsp:include>
        <title>İletişim</title>
</head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                inelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı 
                bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 
                'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla 
                daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. 
                Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi,
                varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. 
                Ayrıca arama motorlarında 'lorem ipsu
            </div>
            <div class="col-md-6">
                <h4>Sistem Yöneticisine Mesaj Gönderin</h4>
                <form class="form-inline" role="form"  method="post" action="sendmessageservlet">
                    <div class="form-group">
                        Konu
                        <input type="text" name="title" pattern=".{5,30}" 
                        required title="Başlık 5-30 karakter aralığında olmalı"/>
                    </div>
                    <div class="form-group">
                        Mesajınız 
                        <textarea name="message" pattern=".{10,300}"
                        required title="Mesajınız 10-300 karakter aralığında olmalı"> 
                        </textarea>
                    </div>
                    <div class="form-group">
                        Mail adresiniz
                        <input type="email" name="mail" 
                        pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"/>
                    </div>
                   <input type ="submit" value="Mesajı Gönder">
                </form>
                <c:choose>
                    <c:when test="${gonderildi eq 1}">
                       <div class="alert alert-success">
                            <strong>Başarılı!</strong> Mesaj başarıyla iletildi. Sizinle vermiş olduğunuz 
                            mail adresi üzerinden iletişime geçilecektir.
                        </div>
                    </c:when>
                    <c:when test="${gonderildi eq 2}">
                    	<div class="alert alert-danger">
                    		<strong>Başarısız</strong> Mesaj iletilemedi. Lütfen tekrar deneyiniz.
                    	</div>
                    </c:when>
                </c:choose>
                
            </div>
        </div>
    </div>
    <jsp:include page="html/footer.html"/> 
</body>
</html>

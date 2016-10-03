<%-- 
    Document   : nasilcalisir
    Created on : 12.May.2016, 01:43:04
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title>Nasıl Çalışır</title>
</head>
<body>
    <jsp:include page="html/header.html"></jsp:include>

    <div class="text-center">
        <h3>Şirketler</h3>
        <h3>
            Sisteme <a href="sirketkayit.jsp"> buradan </a>kayıt olun.
            İlanınızı hazırlayın.
            Yönetici tarafından tanımlanan ilan paketlerinden istediğiniz bir 
            tanesine bağış karşılığı sahip olun.
            Hazırladığınız ilanı aktif edin ve öğrenci başvurularını inceleyin.
        </h3>
        <h3>Öğrenciler</h3>
        <h3>
            Sisteme <a href="ogrencikayit.jsp"> buradan </a>kayıt olun.
            CV'nizi hazırlayın. İstediğiniz kriterlere göre ilan arayın ve
            istediğiniz ilana başvurun. Şirketler sizinle iletişime geçsin.
        </h3>
    </div>
    <jsp:include page="html/footer.html"/> 
</body>
</html>

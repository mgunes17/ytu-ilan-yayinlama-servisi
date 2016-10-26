<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DAU Anasayfa</title>
</head>
<body>
    <h4><a href="../directdaumainpageservlet">Anasayfa</a></h4>
    <form action="../logoutservlet" method="post">
         Çıkış Yap
	<input type="submit" value="Logout">
    </form>
    <h1>Hoşgeldiniz ${user.userName} Kullanıcısı!</h1>
    <a href="../waitingforapprovalservlet">Onay bekleyen bağışlar</a>
    <a href="#">Harcama İsteklerini gör</a>
</body>
</html>

<%-- 
    Document   : addBankAccountInformation
    Created on : 21.Mar.2016, 22:04:44
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
     <h3>Banka Hesap Bilgilerini Oluşturun</h3>
     <form method="post" action="addbankaccountinfoservlet">
        Banka Adı</br>
        <input type="text" name="bank_name"/></br>
        Şube Adı</br>
        <input type="text" name="name_of_branch"/></br>
        Hesap No</br>
        <input type="text" name="account_number"/></br>
        Para Birimi</br>
        <input type="text" name="currency"/></br>
        IBAN</br>
        <input type="text" name="iban"/></br>
     </form>
</body>
</html>

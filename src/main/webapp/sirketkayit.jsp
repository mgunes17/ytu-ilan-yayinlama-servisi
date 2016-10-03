<%-- 
    Document   : sirketkayit
    Created on : 12.May.2016, 02:41:06
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Şirket Kayıt</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
<body>
    <jsp:include page="html/header.html"></jsp:include>
    <div class="container text-center">
        <h2>Şirket kayıt</h2>
        <p>Lütfen istenen bilgileri eksiksiz giriniz</p> 
        <form method="post" action="companysaveservlet" >
            <table class="table">
              <tbody>
                <tr>
                  <td>Kullanıcı Adınızı Belirleyiniz</td>
                  <td><input type="text" name="user_name"/></td>
                </tr>
                <tr>
                  <td>Şirketinizin adı</td>
                  <td><input type="text" name="company_name"/></td>
                </tr>
                <tr>
                  <td>Şirketinizin konumu</td>
                  <td><input type="text" name="location"/></td>
                </tr>
                <tr>
                  <td>Mersis No</td>
                  <td><input type="text" name="mersis_no"/></td>
                </tr>
                <tr>
                  <td>Şifrenizi Belirleyin</td>
                  <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                </tr>
    
                <tr><td colspan="2"><input type="submit" value="Kayıt Ol"></td></tr>

              </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="html/footer.html"/> 
</body>
</html>

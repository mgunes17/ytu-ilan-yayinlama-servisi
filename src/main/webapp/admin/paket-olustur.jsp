<%-- 
    Document   : createannouncementpacket
    Created on : 17.Nis.2016, 15:33:19
    Author     : must
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="html/head.html"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Paket Oluştur</title>
    </head>
<body>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="html/header.html"/>
        </div>
        <div class="row">
            <div class="col-md-4"><jsp:include page="html/menu.html"/></div>
            <div class="col-md-8">
                <div class="text-centers">
                    <c:choose>
                        <c:when test="${olusturuldu eq 1}">
                           <div class="alert alert-success">
                                 <strong>Başarılı!</strong>Paket başarıyla oluşturuldu.
                            </div>
                        </c:when>
                    </c:choose>
                
                    <h2>Yeni İlan Paketi Oluştur</h2>
                    <p>Lütfen istenen bilgileri eksiksiz giriniz</p> 
                    <form method="post" action="../createannouncementpackageservlet" >
                        <table class="table" id="formTable">
                          <tbody>
                            <tr>
                              <td>Paketin adını giriniz</td>
                              <td><input type="text" name="packet_name"/>
                            </tr>
                            <tr>
                              <td>Pakette yer alacak ilan sayısını seçiniz</td>
                              <td><input type="text" name="announcement_number"/></td>
                            </tr>
                            <tr>
                              <td>Kazancın ilişkilendirileceği bağış kabul birimini seçiniz</td>
                              <td> <select name="unit">
                                    <c:forEach var="item" items="${dau}">
                                        <option value="${item.userName}">
                                            <c:out value="${item.unitName}"/>
                                        </option>
                                    </c:forEach>
                                    </select></br></td>
                            </tr>
                            <tr>
                                <td>Paketin son kullanım tarihini giriniz yyyy-aa-gg ss:dd</td>
                                <td><input type="text" name="last_date_used"/></td>
                            </tr>
                            <tr>
                                <td>İlanların aktif kalma süresini gün olarak giriniz</td>
                                <td><input type="text" name="activate_date"/></td>
                            </tr>
                            <tr>
                                <td>Paket fiyatını giriniz</td>
                                <td><input type="text" name="price"/></td>
                            </tr>
                            <tr>
                                <td>Para birimini seçiniz</td>
                                <td><select name="currency">
                                    <c:forEach var="item" items="${curr}">
                                        <option value="${item.id}">
                                            <c:out value="${item.title}"/>
                                        </option>
                                    </c:forEach>
                                </select></td>
                            </tr>
                            <tr>
                                <td>Açıklama giriniz</td>
                                <td><input type="text" name="condition"/></td>
                            </tr>
                            <tr><td colspan="2"><button type="submit" class="btn btn-default">Oluştur</button></td></tr>

                          </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
     
    <jsp:include page="../html/footer.html"></jsp:include> 
  
</body>
</html>

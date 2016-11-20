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
                                 <strong>Başarılı!</strong> Paket başarıyla oluşturuldu.
                                 Paketi <a href="#">buradan</a> düzenleyebilirsiniz.
                            </div>
                        </c:when>
                        <c:when test="${olusturuldu eq 2}">
                        	<div class ="alert alert-danger">
                        		<strong>Başarısız</strong>Bir hata meydana geldi. Lütfen daha sonra tekrar deneyiniz.
                        	</div>
                        </c:when>
                    </c:choose>
                
                    <h2>Yeni İlan Paketi Oluştur</h2>
                    
                    <h4>Hangi Vakıf/Dernek İçin Paket Oluşturmak İstiyorsunuz?</h4>
                    <form method="post" action="../selectdauforpacketservlet">
	             		<select name="unit">
	                      <c:forEach var="item" items="${dauList}">
	                          <option value="${item.unitName}">
	                              <c:out value="${item.unitName}"/>
	                          </option>
	                      </c:forEach>
	                     </select>
	                     
	                     <button type="submit" class="btn btn-default">Seç</button>
                    </form>
                    
                    <c:choose>
                    	<c:when test="${vakifsecildi eq 1}">
                    		<p>Lütfen istenen bilgileri eksiksiz giriniz</p> 
                    		<h4>${dau.unitName} vakfı/derneği için ilan paketi oluşturun</h4>
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
		                            	<td>Vakfa/derneğe ait banka hesabını seçiniz</td>
		                            	<td>
		                            		<select name="account">
		                            			<c:forEach var="item" items="${accountList}">
												<option value="${item.iban}">
													<c:out value="${item.iban}"/>
												</option>
		                            		</c:forEach>                      		
		                            		</select>		                            		
		                            	</td>
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
		                                <td><textarea name="condition"></textarea></td>
		                            </tr>
		                            <tr><td colspan="2"><button type="submit" class="btn btn-default">Oluştur</button></td></tr>
		
		                          </tbody>
		                        </table>
		                    </form>
                    	</c:when>
                    	<c:when test="${vakifsecildi eq 2 }">
                    		<div class="alert alert-danger">
                    			Bir hata oluştu. Lütfen daha sonra tekrar deneyin.
                    		</div>
                    	</c:when>
                    </c:choose>
                    
                </div>
            </div>
        </div>
    </div>
     
    <jsp:include page="../html/footer.html"></jsp:include> 
  
</body>
</html>

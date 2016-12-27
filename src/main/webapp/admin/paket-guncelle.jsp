<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mgunes
  Date: 27.12.2016
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Paket Düzenle</title>
        <jsp:include page="html/head.html"/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="../js/datePicker.js" charset="UTF-8"></script>
        <script>
            $( function() {
                var dateFormat = "dd/mm/yy",
                        last_date_used = $( "#last_date_used" )
                                .datepicker({
                                    defaultDate: "+1w",
                                    changeMonth: true,
                                    numberOfMonths: 1
                                })
                                .on( "change", function() {
                                    to.datepicker( "option", "minDate", getDate( this ) );
                                });

                function getDate( element ) {
                    var date;
                    try {
                        date = $.datepicker.parseDate( dateFormat, element.value );
                    } catch( error ) {
                        date = null;
                    }

                    return date;
                }
            } );
        </script>
    </head>
    <body>
        <jsp:include page="html/menu.html"/>
        <div class="jumbotron container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <p>${packet.packetId} nolu paketi güncelleyin</p>
                    <c:choose>
                        <c:when test="${duzenle eq 1}">
                            <div class="alert alert-success">
                                Paket bilgileri güncellendi.
                            </div>
                        </c:when>
                        <c:when test="${duzenle eq 2}">
                            <div class="alert alert-danger">
                                Bir hata meydana geldi.
                            </div>
                        </c:when>
                    </c:choose>
                    <form method="post" action="../updatepacket" >
                        <table class="table" id="formTable">
                            <tbody>
                            <tr>
                                <td>Paketin adı</td>
                                <td><input type="text" name="packet_name" value="${packet.title}"/>
                            </tr>
                            <tr>
                                <td>Pakette yer alacak ilan sayısı</td>
                                <td><input type="text" name="announcement_number" value="${packet.announcementCount}"/></td>
                            </tr>
                            <tr>
                                <td>Paketin son kullanım tarihi</td>
                                <td><input type="text" id="last_date_used" name="last_date_used" value="${packet.lastDateUsed}"/></td>
                            </tr>
                            <tr>
                                <td>İlanların aktif kalma süresi (Gün)</td>
                                <td><input type="text" name="activate_date" value="${packet.activeTime}"/></td>
                            </tr>
                            <tr>
                                <td>Paket fiyatı (TL)</td>
                                <td><input type="text" name="price" value="${packet.price}"/></td>
                            </tr>
                            <tr>
                                <td>Vakfa/derneğe ait banka hesabı</td>
                                <td>
                                    <select name="account" value="${packet.accountInfo}">
                                        <c:forEach var="item" items="${accounts}">
                                            <option value="${item.iban}">
                                                <c:out value="${item.iban}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Para birimi</td>
                                <td><select disabled name="currency">
                                    <c:forEach var="item" items="${curr}">
                                        <option value="${item.id}">
                                            <c:out value="${item.title}"/>
                                        </option>
                                    </c:forEach>
                                </select></td>
                            </tr>
                            <tr>
                                <td>Açıklama giriniz</td>
                                <td><textarea rows="5" cols="35" name="condition">${packet.condition}</textarea></td>
                            </tr>
                            <tr>
                                <input type="hidden" name="id" value="${packet.packetId}">
                                <td colspan="2"><button type="submit" class="btn btn-default">Güncelle</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

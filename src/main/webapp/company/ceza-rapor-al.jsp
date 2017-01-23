<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: mgunes
  Date: 23.01.2017
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="html/head.html"/>
    <title>Rapor Al</title>
</head>
<body>
<jsp:include page="html/menu.html"/>
<div class="jumbotron container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <table class="table table-stripped">
                <thead>
                <tr>
                    <th>İlan Adı</th>
                    <th>Yayın Tarihi</th>
                    <th>Şirket</th>
                    <th>Şikayet Sayısı</th>
                    <th>İşlem</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${fn:length(annList) eq 0}">
                    <tr><td><i>Rapor almaya uygun ilan yok.</i></td></tr>
                </c:if>
                <c:forEach var="item" items="${annList}">
                    <tr>
                        <td>${item.title}</td>
                        <td><fmt:formatDate pattern="dd-MM-yyy" value="${item.publishDate}"/></td>
                        <td>${item.ownerCompany.companyName}</td>
                        <td align="right">${fn:length(item.complaintList)}</td>
                        <td>
                            <a  href="../reportannouncementforcompany?id=${item.id}"
                                title="Rapor"
                                class="open-detail btn btn-info">
                                <span class="glyphicon glyphicon-th-large"></span>
                            </a>
                            <a  href="#complaintList"
                                title="Şikayet Mesajları"
                                data-toggle="modal"
                                class="open-complaintList btn btn-success">
                                <span class="glyphicon glyphicon-list-alt"></span>
                            </a>
                        </td>
                    </tr>
                    <div class="modal fade" id="complaintList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" >
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <h4><b>Şikayet Mesajları</b></h4>
                                    <c:forEach var="item2" items="${item.complaintList}">
                                        <b>Kullanıcı:</b>${item2.student.userName}<br/>
                                        <b>Mesaj:</b>${item2.description}<br/><br/>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

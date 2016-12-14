<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
  Created by IntelliJ IDEA.
  User: mgunes
  Date: 12.12.2016
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>

<html>
    <head>
        <title>Şikayet Edilen İlanlar</title>
        <jsp:include page="html/head.html"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <script>
            $(document).on("click", ".open-detail", function (e) {
                e.preventDefault();
                var _self = $(this);

                var title = _self.data('title');
                var content = _self.data('content');
                var brief = _self.data('brief');
                var company = _self.data('company');
                var publish = _self.data('publish');

                document.getElementById("title1").innerHTML = title;
                document.getElementById("content1").innerHTML = content;
                document.getElementById("publish1").innerHTML = publish;
                document.getElementById("brief1").innerHTML = brief;
                document.getElementById("company1").innerHTML = company;

                $(_self.attr('href')).modal('show');
            });

            $(document).on("click", ".true-complaint", function (e) {
                e.preventDefault();
                var _self = $(this);
                var id = _self.data('id');

                $("#annid").val(id);
                $(_self.attr('href')).modal('show');
            });
        </script>

        <div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4>İlan Detayları</h4>

                        <p><b>Başlık</b></p>
                        <p id="title1"></p>

                        <p><b>Kısa Açıklama</b></p>
                        <p id="brief1"></p>

                        <p><b>İçerik</b></p>
                        <p id="content1"></p>

                        <p><b>Şirket Adı</b></p>
                        <p id="company1"></p>

                        <p><b>Yayınlanma Tarihi</b></p>
                        <p id="publish1"></p>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="trueComplaint" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Şikayetleri Onayla!</h4>
                    </div>
                    <div class="modal-body">
                        <h4>İlanı Yayımdan Kaldır</h4>
                        <p>Lütfen ilanın neden yayımdan kaldırıldığına dair açıklama giriniz</p>
                        <form method="post" action="../acceptcomplaint">
                            <textarea cols="40" rows="10" name="resultReply" class="form-control"></textarea>
                            <br/>
                            <button type="submit" class="btn btn-default"class="form-control">Yayımdan Kaldır</button>
                            <input type="hidden" id="annid" name="annID">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p>Yazmış olduğunuz açıklama şirkete iletilecektir.</p>
                        <p>Cezalı ilanların düzenlenip tekrar yayıma alınması mümkün değildir.</p>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <jsp:include page="html/header.html"/>
            </div>
            <div class="row">
                <div class="col-md-3"><jsp:include page="html/menu.html"/></div>
                <div class="col-md-7">
                    <c:choose>
                        <c:when test="${ceza eq 1}">
                            <div class="alert alert-success">
                                İlan yayından kaldırıldı.
                            </div>
                        </c:when>
                        <c:when test="${ceza eq 2}">
                            <div class="alert alert-danger">
                                Bir hata meydana geldi.
                                Lütfen daha sonra tekrar deneyiniz.
                            </div>
                        </c:when>
                    </c:choose>

                    <table class="table table-stripped">
                        <thead>
                            <tr>
                                <td>İlan Adı</td>
                                <td>Yayımlayan Şirket</td>
                                <td>Şikayet Sayısı</td>
                                <td>İşlem</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${sikayetilan}">
                                <tr>
                                    <td>${item.title}</td>
                                    <td>${item.ownerCompany.companyName}</td>
                                    <td>${fn:length(item.complaintList)}</td>
                                    <td>
                                        <a  href="#detail"
                                            data-toggle="modal"
                                            data-title="${item.title}"
                                            data-content="${item.content}"
                                            data-brief="${item.state.title}"
                                            data-company="${item.ownerCompany.companyName}"
                                            data-publish="${item.publishDate}"
                                            class="open-detail btn btn-success">
                                            İlan Detay
                                        </a>
                                        <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#${item.id}">Şikayetleri Oku</button>
                                        <a  href="#trueComplaint"
                                            data-toggle="modal"
                                            data-id="${item.id}"
                                            class="true-complaint btn btn-warning">
                                            Şikayetler Doğru
                                        </a>
                                        <a  href="#"
                                            class="btn btn-danger">
                                            Şikayetler Yanlış
                                        </a>
                                        <div id="${item.id}" class="collapse">
                                            <c:forEach var="item2" items="${item.complaintList}">
                                                <p>${item2.student.userName}</p>
                                                <p>${item2.description}</p>
                                            </c:forEach>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

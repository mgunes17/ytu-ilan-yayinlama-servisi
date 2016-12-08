<%--
  Created by IntelliJ IDEA.
  User: mgunes
  Date: 06.12.2016
  Time: 01:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Harcama İstekleri</title>
    <jsp:include page="html/head.html"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script rel="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
</head>
<body>

    <script>
        $(document).on("click", ".download-file", function (e) {
            e.preventDefault();
            var _self = $(this);
            var idPath = _self.data('path');
            var idType = _self.data('type');
            $("#path").val(idPath);
            $("#type").val(idType);
            $(_self.attr('href')).modal('show');
        });
        
        function nonVisible() {
            $('#downloadFile').modal('hide');
        }

        $(document).on("click", ".open-detail", function (e) {
            e.preventDefault();
            var _self = $(this);

            var title = _self.data('title');
            var content = _self.data('content');
            var sentDateTime = _self.data('se');
            var updatedDateTime = _self.data('up');
            var dauUser = _self.data('da');
            var state = _self.data('state');
            var answer = _self.data('answer');
            var amount = _self.data('amount');

            document.getElementById("title1").innerHTML = title;
            document.getElementById("amount1").innerHTML = amount;
            document.getElementById("content1").innerHTML = content;
            document.getElementById("updatedDateTime1").innerHTML = updatedDateTime;
            document.getElementById("dauUser1").innerHTML = dauUser;
            document.getElementById("state1").innerHTML = state;
            document.getElementById("answer1").innerHTML = answer;
            document.getElementById("sentDateTime1").innerHTML = sentDateTime;

            $(_self.attr('href')).modal('show');
        });
    </script>

    <div class="modal fade" id="downloadFile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" onclick="nonVisible()">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <p>Dosyayı İndir</p>
                    <form>
                        <input type="hidden" name="fileName" id="path">
                        <input type="hidden" name="fileType" id="type">
                        <input formaction="../pdfviewer" type="submit" class="btn btn-default" value="Evet" onA>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hayır</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h4>İstek Detayları</h4>

                    <p><b>Durum</b></p>
                    <p id="state1"></p>

                    <p><b>Başlık</b></p>
                    <p id="title1"></p>

                    <p><b>Mesajınız</b></p>
                    <p id="content1"></p>

                    <p><b>İstek Gönderme Tarihi</b></p>
                    <p id="sentDateTime1"></p>

                    <p><b>Miktar</b></p>
                    <p id="amount1"></p>

                    <p><b>Cevaplayan Kullanıcı</b></p>
                    <p id="dauUser1"></p>

                    <p><b>Cevap</b></p>
                    <p id="answer1"></p>

                    <p><b>Cevaplanma Tarihi</b></p>
                    <p id="updatedDateTime1"></p>

                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <jsp:include page="html/header.html"/>
        </div>
        <div class="row">
            <div class="col-md-2"><jsp:include page="html/menu.html"/></div>
            <div class="col-md-5">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Başlık</th>
                        <th style="width:30%">Cevap</th>
                        <th>Cevaplanma Tarihi</th>
                        <th>Cevaplayan Kullanıcı</th>
                        <th>İşlem</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${srList}">
                        <tr>
                            <td>${item.title}</td>
                            <td>
                                <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#${item.id}">
                                    <span class="glyphicon glyphicon-collapse-down"></span> Mesajı Oku
                                </button>
                                <div id="${item.id}" class="collapse">
                                        ${item.answerFromUpdater}
                                </div>
                            </td>
                            <td><fmt:formatDate type="date" value="${item.updatedDateTime}"/></td>
                            <td>${item.dauUser.userName}</td>
                            <td width="15%">
                                <a href="#detail"
                                   class="open-detail"
                                   data-toggle="modal"
                                   data-title="${item.title}"
                                   data-content="${item.content}"
                                   data-state="${item.state.title}"
                                   data-da="${item.dauUser.userName}"
                                   data-answer="${item.answerFromUpdater}"
                                   data-amount="${item.amount}"
                                   data-se="${item.sentDateTime}"
                                   data-up="${item.updatedDateTime}"
                                   title="Detay Gör">
                                    <span class="glyphicon glyphicon-eye-open"></span>
                                </a>
                                <c:if test="${item.imagePath ne null}">
                                    <a href="#downloadFile"
                                       title="Görüntü İndir"
                                       data-path="${item.imagePath}"
                                       data-type="image"
                                       class="download-file"
                                       data-toggle="modal">
                                        <span class="glyphicon glyphicon-camera"></span>
                                    </a>
                                </c:if>
                                <c:if test="${item.pdfPath ne null}">
                                    <a href="#downloadFile"
                                       title="Pdf İndir"
                                       data-type="pdf"
                                       data-path="${item.pdfPath}"
                                       class="download-file"
                                       data-toggle="modal"><span class="glyphicon glyphicon-paperclip"></span>
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-3">
                <h4>Sıralama Seçenekleri</h4>
                <p><a href="../spendingrequestorder?condition=updated_date_time" class="btn btn-default">Tarihe Göre Sırala</a></p>
                <p><a href="../spendingrequestorder?condition=updater" class="btn btn-default">Kullanıcı Adına Göre Sırala</a><p>

                <h4>Sonucuna Göre Filtrele</h4>
                <p><a href="../listspendingrequesttoadmin" class="btn btn-default">Tümü</a></p>
                <p><a href="../spendingrequestreply?condition=1" class="btn btn-default">Cevaplananlar</a><p>
                <p><a href="../spendingrequestreply?condition=2" class="btn btn-default">Cevaplanmayanlar</a><p>

                <h4>BKB' ye Göre Filtrele</h4>
                <form method="get" action="../spendingrequestdau">
                    <div class="form-group">
                        <label for="dau">Birim Seç</label>
                        <select name="department" id="dau">
                            <c:forEach var="item" items="${dauList}">
                                <option value="${item.unitName}">
                                    <c:out value="${item.unitName}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">Seç</button>
                </form>
            </div>
            </div>
        </div>
    </div>
</body>
</html>

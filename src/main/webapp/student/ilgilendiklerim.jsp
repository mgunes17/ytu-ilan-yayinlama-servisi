<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mgunes
  Date: 07.01.2017
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="html/head.html"></jsp:include>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/i18n/defaults-*.min.js"></script>
        <title>İlgilendiklerim</title>
    </head>
    <body>
        <script>
            $(document).on("click", ".open-ekleDialog", function (e) {
                e.preventDefault();
                var _self = $(this);
                $(_self.attr('href')).modal('show');
            });
        </script>

        <div class="modal fade" id="ekleDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Yeni Kriter Ekleyin</h4>
                    </div>
                    <div class="modal-body">
                        <p>Lütfen formu ilgilendiğiniz şekilde doldurun</p>
                        <form method="post" action="../addinterests">
                            <div class="form-group">
                                <label>İlan Kategorisi</label>
                                <select data-live-search="true" name="category" class="selectpicker form-control">
                                    <c:forEach var="item" items="${categoryList}">
                                        <c:if test="${item.id ne 0 }">
                                            <c:if test="${item.parentCategory eq 0}">
                                                <option selected value="${item.id}">
                                                    <b><c:out value="${item.categoryName}"/></b>
                                                </option>
                                                <c:forEach var="childItem" items="${item.children}">
                                                    <option value="${childItem.id}">
                                                        <c:out value="----${childItem.categoryName}"/>
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>İlan Tipi</label>
                                <select name="type" class="form-control">
                                    <c:forEach var="item" items="${annType}">
                                        <option value="${item.id}">
                                            <c:out value="${item.title}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>İlanın Dili</label>
                                <select name="language" class="form-control" id="language">
                                    <option value="alllanguages">Tüm Diller</option>
                                    <option value="türkçe">Türkçe</option>
                                    <option value="ingilizce">İngilizce</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="keyword">Anahtar Kelimeler</label>
                                <h5>Kelimeler arasında virgül bırakın.(Ör: java,hibernate,css)</h5>
                                <input type="text" name="keywords" placeholder="Anahtar Kelimeler" class="form-control" id="keyword">

                            </div>

                            <button type="submit" class="btn btn-success">Kaydet</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p>Kayıtlı kriterlerinizi istediğiniz zaman silebilir-düzenleyebilirsiniz.</p>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="html/menu.html"/>
        <div class="jumbotron container-fluid">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-1">
                    <a href="#ekleDialog" class="open-ekleDialog button btn btn-success"><span class="glyphicon glyphicon-plus"></span> Ekle</a>
                </div>
                <div class="col-md-3">
                    <c:choose>
                        <c:when test="${eklendi eq 1}">
                            <div class="alert alert-success">
                                Kayıt işlemi başarılı.
                            </div>
                        </c:when>
                        <c:when test="${eklendi eq 2}">
                            <div class="alert alert-danger">
                                Bir hata meydana geldi.
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <table class="table table-hovered">
                        <thead>
                            <tr>
                                <th>Kategori</th>
                                <th>İlan Tip</th>
                                <th>Dil</th>
                                <th>Anahtar Kelimeler</th>
                                <th>İşlem</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${interests}">
                                <tr>
                                    <td>${item.category.categoryName}</td>
                                    <td>${item.type.title}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.language eq 'alllanguages'}">
                                                Tüm Diller
                                            </c:when>
                                            <c:otherwise>
                                                ${item.language}
                                            </c:otherwise>
                                        </c:choose>
                                        </td>
                                    <td>${item.keywords}</td>
                                    <td>
                                        <a  title="Arama Yap"
                                            class="btn btn-primary"
                                            href="#">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </a>
                                        <a  title="Düzenle"
                                            class="btn btn-success"
                                            href="#">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                        </a>
                                        <a  title="Sil"
                                            class="btn btn-danger"
                                            href="#">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
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

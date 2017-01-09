<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>İlan Paketleri</title>
		<jsp:include page="html/head.html"/>

        <script>
            $(document).on("click", ".open-sendRequestModal", function (e) {
                e.preventDefault();
                var _self = $(this);
                var packetID = _self.data('id');
                $("#packetID").val(packetID);
                $(_self.attr('href')).modal('show');
            });
        </script>

        <script>
            $(document).ready(function(){
                $('[data-toggle="popover"]').popover();
            });
        </script>
	</head>
	<body>
        <div class="modal fade" id="sendRequestModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Bağış Bilgisi Gir</h4>
                    </div>
                    <div class="modal-body">
                        <p>Yapılan bağış ile ilgili bilgileri giriniz.</p>
                        <p>Fatura/ödeme bilgisine ait görüntü veya pdf ekleyiniz.</p>
                        <form method="post" action="../donationrequestservlet" enctype="multipart/form-data">
                            <div class="form-group">
                                <textarea rows="10" cols="40" name="description">Açıklama..</textarea>
                            </div>
                            <div class="form-group">
                                <label for="file">Dosya Yükleyin</label>
                                <input type="file" name="file" id="file"/>
                            </div>
                            <input type="hidden" id="packetID" name="packetId"/>
                            <button type="submit" class="btn btn-default">Gönder</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p>Verdiğiniz bilgiler yanlışsa, talebiniz reddedilecektir.</p>
                        <p>Bu durumda yeniden istek göndermeniz gerekecektir.</p>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

		<jsp:include page="html/menu.html"/>
		<div class="jumbotron container-fluid">
			<div class="row">
				<div class="col-md-11">
					<c:choose>
						<c:when test="${donation_request eq 1}">
							<div class="alert alert-success">
								Bağış uyarınız gönderilmiştir.
							</div>
						</c:when>
						<c:when test="${donation_request eq 2}">
							<div class="alert alert-warning">
								Bir hata oluştur lütfen tekrar deneyiniz.
							</div>
						</c:when>
					</c:choose>

					<table class="table table-stripped">
						<thead>
							<tr>
								<th>Paket Başlığı</th>
								<th>Açıklama</th>
								<th>
                                    İlan Sayısı
                                    <a href="../orderpacketstocompany?condition=announcement_count&order=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../orderpacketstocompany?condition=announcement_count&order=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>
                                    Yayın Süresi(Gün)
                                    <a href="../orderpacketstocompany?condition=active_time&order=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../orderpacketstocompany?condition=active_time&order=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>
                                    Fiyat(TL)
                                    <a href="../orderpacketstocompany?condition=price&order=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../orderpacketstocompany?condition=price&order=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>
                                    Son kullanım tarihi
                                    <a href="../orderpacketstocompany?condition=last_date_used&order=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../orderpacketstocompany?condition=last_date_used&order=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>Birim</th>
								<th>İşlem</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${packets}">
								<tr>
									<td>${item.title}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${fn:length(item.condition) < 20}">
                                                ${item.condition}
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(item.condition, 0, 20)}...
                                                <a href="#" data-toggle="popover" data-placement="right"
                                                   title="Açıklama:" data-content="${item.condition}">
                                                    <span class="glyphicon glyphicon-info-sign "></span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
									<td align="right">${item.announcementCount}</td>
									<td align="right">${item.activeTime}</td>
									<td align="right">${item.price}</td>
									<td>${item.lastDateUsed}</td>
									<td>${item.accountInfo.ownerUnit.unitName}</td>
									<td>
                                        <a data-id="${item.packetId }"
                                           data-toggle="modal"
                                           title="Bağış Yaptım"
                                           class="open-sendRequestModal btn btn-primary"
                                           href="#sendRequestModal">
                                            <span class="glyphicon glyphicon-ok"></span>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>�lan Detay</title>
		<jsp:include page="../html/head.html"></jsp:include>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
        <script>
            $(document).on("click", ".open-complaintDialog", function (e) {
                e.preventDefault();
                var _self = $(this);
                var code = _self.data('id');
                $("#announcementID").val(code);
                $(_self.attr('href')).modal('show');
            });

            $(document).on("click", ".delete-complaintDialog", function (e) {
                e.preventDefault();
                var _self = $(this);
                var code = _self.data('id');
                $("#announcementID2").val(code);
                $(_self.attr('href')).modal('show');
            });
        </script>

		<div class="modal fade" id="complaintDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">�lan� �ikayet Et</h4>
					</div>
					<div class="modal-body">
						<p>L�tfen �ikayet etme sebebinizi yaz�n�z.</p>
                        <br/>
						<form>
							<input type="hidden" name="announcementId" id="announcementID">
                            <textarea name="complaintDescription" class="form-control" rows="3"></textarea>
                            <br/>
							<input formaction="../complaintannouncement" type="submit" class="btn btn-default" value="G�nder">
						</form>
					</div>
					<div class="modal-footer">
						<p>As�ls�z �ikayetler ceza puan� alman�za neden olur.</p>
                        <p>�ikayetinizi, y�netici de�erlendirmeden �nce geri �ekebilirsiniz.</p>
						<button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
					</div>
				</div>
			</div>
		</div>

        <div class="modal fade" id="deleteComplaintDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">�ikayeti Geri �ek</h4>
                    </div>
                    <div class="modal-body">
                        <p>�ikayeti geri �ekmek istedi�inize emin misiniz?</p>
                        <br/>
                        <form>
                            <form>
                                <input type="hidden" name="announcementId" id="announcementID2">
                                <input formaction="../deletecomplaint" type="submit" class="btn btn-default" value="Evet">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Hay�r</button>
                            </form>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p>Onaylaman�z durumunda �ikayet veri taban�ndan silinir.</p>
                        <p>�sterseniz daha sonra tekrar �ikayet edebilirsiniz.</p>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>

		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
 				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 				<div class="col-md-4">
 					<c:choose>
 						<c:when test="${basvuruldu eq 1 }">
 							<div class="alert alert-success">
 								Ba�vurunuz ger�ekle�ti.
 								T�m ba�vurular�n�z� <a href="#">buradan</a> g�rebilirsiniz.
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 2 }">
 							<div class="alert alert-danger">
 								Ba�vurunuz al�namad�.
 								L�tfen daha sonra tekrar deneyin
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 3 }">
 							<div class="alert alert-warning">
 								Ba�vurunuz silindi.
 								�sterseniz yeniden ba�vurabilirsiniz.
 							</div>
 						</c:when>
 						<c:when test="${basvuruldu eq 4 }">
 							<div class="alert alert-alert">
 								Ba�vurunuz silinemedi.
 								L�tfen daha sonra tekrar deneyin.
 							</div>
 						</c:when>
                        <c:when test="${sikayetedildi eq 1}">
                            <div class="alert alert-success">
                                �ikayet kayd�n�z olu�turuldu.
                                T�m �ikayetlerinizi <a href="../listmycomplaints">buradan</a> g�rebilirsiniz.
                            </div>
                        </c:when>
                        <c:when test="${sikayetedildi eq 2}">
                            <div class="alert alert-success">
                                �ikayet kayd� olu�turulurken bir hata meydane geldi.
                                L�tfen daha sonra tekrar deneyiniz.
                            </div>
                        </c:when>
                        <c:when test="${ilangericek eq 1}">
                            <div class="alert alert-warning">
                                �ikayetiniz geri �ekildi.
                                Di�er �ikayetlerinizi <a href="../listmycomplaints">buradan</a> g�rebilirsiniz.
                            </div>
                        </c:when>
                        <c:when test="${ilangericek eq 2}">
                            <div class="alert alert-danger">
                                �ikayetiniz geri �ekilemedi.
                                L�tfen daha sonra tekrar deneyiniz.
                            </div>
                        </c:when>
 					</c:choose>
 					<table class="table table-bordered">
 						<tr>
 							<th>�irket Ad�</th>
 							<td>${announcement.ownerCompany.companyName}</td>
 						</tr>
 						<tr>
 							<th>�lan Ba�l���</th>
 							<td>${announcement.title}</td>
 						</tr>
 						<tr>
 							<th>K�sa A��klama</th>
 							<td>${announcement.brief}</td>
 						</tr>
 						<tr>
 							<th colspan="2">Detay</th>
 						</tr>
 						<tr>
 							<td colspan="2">${announcement.content }</td>
 						</tr>
 						<tr>
 							<th>G�r�nt�lenme Say�s�</th>
 							<td>${announcement.numberOfPageViews}</td>
 						</tr>
 						<tr>
 							<th>Ba�vuru say�s�</th>
 							<td>${fn:length(announcement.appStudentList)}</td>
 						</tr>
 						<tr>
							<th>Kategori</th>
							<td>${announcement.category.categoryName }</td>
						</tr>
						<tr>
							<th>Yay�nlanma Tarihi</th>
							<td><fmt:formatDate value="${announcement.publishDate }"/></td>
						</tr>	
 						<tr>
 							<td colspan="2">
 								<form method = "post">
 									<input type = "hidden" name = "announcement" value = "${announcement.id}" >
 									<c:if test="${basvuruvar eq 1 }">
 										<input type="hidden" name="deleteUrl" value="student/ilan-detay.jsp">
 										 <input disabled class="btn btn-primary disabled" type="submit" value="Ba�vur">
 										 <input formaction="../deleteapplication" class="btn btn-warning active" type = "submit" value = "Ba�vuruyu Geri �ek">
 									</c:if>
 									<c:if test="${basvuruvar eq 2 }">										
 										 <input type = "submit" value = "�lana Ba�vur" formaction = "../applicationtoannouncement" class="btn btn-primary active">
 										 <input disabled formaction="#" type = "submit" value = "Ba�vuruyu Geri �ek" class="btn btn-warning disabled">
 									</c:if>

                                    <c:choose>
                                        <c:when test="${sikayetvar eq 2}">
                                            <a href="#complaintDialog"
                                               data-toggle="modal"
                                               class="open-complaintDialog btn btn-danger"
                                               data-id="${announcement.id}">�ikayet Et</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#deleteComplaintDialog"
                                               data-toggle="modal"
                                               class="delete-complaintDialog btn btn-warning"
                                               data-id="${announcement.id}">�ikayeti Geri �ek</a>
                                        </c:otherwise>
                                    </c:choose>
								</form>
							</td>
 						</tr>
 					</table>
 				</div>
 			</div>
		</div>
	</body>
</html>
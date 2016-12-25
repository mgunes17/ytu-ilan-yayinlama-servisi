<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script rel="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
		<jsp:include page="html/head.html"></jsp:include>
        <title>Harcama İstekleri</title>
	</head>
	<body>
		<script>
			$(document).on("click", ".open-writeReply", function (e) {			
				e.preventDefault();		
				var _self = $(this);			
				var requestId = _self.data('id');
				$("#requestId").val(requestId);	
				$("#requestId2").val(requestId);	
				$(_self.attr('href')).modal('show');
			});
		</script>

		<script>
			$(document).ready(function(){
				$('[data-toggle="popover"]').popover();
			});
		</script>

		 <!-- Modal -->
		  <div class="modal fade" id="acceptModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Harcama Kaydı Gir</h4>
		        </div>
		        <div class="modal-body">
		          <p>Yapılan harcama ile ilgili bilgileri giriniz.</p>
		          <p>Varsa fatura/ödeme bilgisine ait görüntü veya pdf ekleyiniz.</p>
		          
		          <form method="post" action="../acceptsendingrequest" enctype="multipart/form-data">
		          		<div class="form-group">
		          			<textarea rows="10" cols="40" name="description">Açıklama..</textarea>
		          		</div>
                      <div class="form-group">
                          <label for="file1">Dosya Yükleyin</label>
                          <input type="file" name="file" id="file1"/>
                      </div>
                      <div class="form-group">
                          <label for="image1">Görüntü Yükleyin</label>
                          <input type="file" name="image" id="image1" accept="image/*"/>
                      </div>
                            <input type="hidden" id="requestId" name="requestId"/>
					  <button type="submit" class="btn btn-default">Gönder</button>
		          </form>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		   <!-- Modal -->
		  <div class="modal fade" id="rejectModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Harcamayı Reddet</h4>
		        </div>
		        <div class="modal-body">
		          <p>Harcamayı neden yap(a)madığınıza dair açıklamanız:</p>
		          <form method="post" action="../rejectsendingrequest">
		          		<div class="form-group">
		          			<textarea rows="10" cols="40" name="description">Açıklama..</textarea>
		          		</div>
		          		<input type="hidden" name="requestId" id="requestId2"/>
		          		<button type="submit" class="btn btn-default">Gönder</button>	          	
		          </form>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>

		<jsp:include page="html/menu.html"></jsp:include>
		<div class="jumbotron container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<c:choose>
						<c:when test="${istekguncelle eq 1 }">
							<div class="alert alert-success">
								İstek başarıyla onaylandı.
							</div>
						</c:when>
						<c:when test="${istekguncelle eq 2 }">
							<div class="alert alert-danger">
								İstek onaylanırken bir hata meydana geldi.
								Lütfen tekrar deneyin.
							</div>
						</c:when>
						<c:when test="${istekguncelle eq 3 }">
							<div class="alert alert-warning">
								İstek reddedildi.
							</div>
						</c:when>
						<c:when test="${istekguncelle eq 4 }">
							<div class="alert alert-danger">
								İstek reddedilirken bir hata meydana geldi.
								Lütfen tekrar deneyin.
							</div>
						</c:when>
					</c:choose>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Başlık</th>
								<th>Mesaj</th>
								<th>Tutar</th>
								<th>Tarih</th>
								<th>İşlem</th> <!-- Modal Box ile yap -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${spendingList}">
								<tr>
									<td>${item.title}</td>
									<td>${fn:substring(item.content, 0, 20)}...
                                        <a href="#" data-toggle="popover" data-placement="left"
                                            title="Mesaj:" data-content="${item.content}">
                                            <span class="glyphicon glyphicon-info-sign "></span>
                                        </a>
									</td>
									<td align="right">${item.amount}</td>
									<td><fmt:formatDate type="date" value="${item.sentDateTime}"/></td>
									<td>
										<form>
											<a data-id="${item.id }"
												data-toggle="modal"
												title="Add this item"
												class="open-writeReply btn btn-primary"
												href="#acceptModal">
												<span class="glyphicon glyphicon-ok"></span>
											</a>
											<a data-id="${item.id }"
												data-toggle="modal"
												title="Add this item"
												class="open-writeReply btn btn-danger"
												href="#rejectModal">
												<span class="glyphicon glyphicon-remove"></span>
											</a>
										</form>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<jsp:include page="html/head.html"></jsp:include>
        <title>Harcama Ýstekleri</title>
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
		
		 <!-- Modal -->
		  <div class="modal fade" id="acceptModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Harcama Kaydý Gir</h4>
		        </div>
		        <div class="modal-body">
		          <p>Yapýlan harcama ile ilgili bilgileri giriniz.</p>
		          <p>Varsa fatura/ödeme bilgisine ait görüntü veya pdf ekleyiniz.</p>
		          
		          <form method="post" action="../acceptsendingrequest">
		          		<div class="form-group">
		          			<textarea rows="10" cols="40" name="description">Açýklama..</textarea>
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
		          <h4 class="modal-title">Harcamayý Reddet</h4>
		        </div>
		        <div class="modal-body">
		          <p>Harcamayý neden yap(a)madýðýnýza dair açýklamanýz:</p>
		          <form method="post" action="../rejectsendingrequest">
		          		<div class="form-group">
		          			<textarea rows="10" cols="40" name="description">Açýklama..</textarea>
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
		
		
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
				<div class="col-md-3"><jsp:include page="html/menu.html"></jsp:include></div>
				<div class="col-md-7">
					<c:choose>
						<c:when test="${istekguncelle eq 1 }">
							<div class="alert alert-success">
								Ýstek baþarýyla onaylandý.
							</div>
						</c:when>
						<c:when test="${istekguncelle eq 2 }">
							<div class="alert alert-danger">
								Ýstek onaylanýrken bir hata meydana geldi.
								Lütfen tekrar deneyin.
							</div>
						</c:when>
						<c:when test="${istekguncelle eq 3 }">
							<div class="alert alert-warning">
								Ýstek reddedildi.
							</div>
						</c:when>
						<c:when test="${istekguncelle eq 4 }">
							<div class="alert alert-danger">
								Ýstek reddedilirken bir hata meydana geldi.
								Lütfen tekrar deneyin.
							</div>
						</c:when>
					</c:choose>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Baþlýk</th>
								<th style="width:30%">Mesaj</th>
								<th>Tutar</th>
								<th>Oluþturulma Tarihi</th>
								<th>Ýþlem</th> <!-- Modal Box ile yap -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${spendingList}">
								<tr>
									<td>${item.title}</td>
									<td>
                                        <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#${item.id}">
                                            <span class="glyphicon glyphicon-collapse-down"></span> Mesajý Oku
                                        </button>
                                        <div id="${item.id}" class="collapse">
                                            ${item.content}
                                        </div>

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
												Harcama Kaydý Gir
											</a>
											<a data-id="${item.id }" 
												data-toggle="modal" 
												title="Add this item" 
												class="open-writeReply btn btn-danger" 
												href="#rejectModal">
												Harcamayý Redddet
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>Muhasebe Kayıtları</title>
		<jsp:include page="html/head.html"/>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="../js/datePicker.js" charset="UTF-8"></script>
		<script>
			$( function() {
				var dateFormat = "dd/mm/yy",
						from = $( "#from" )
								.datepicker({
									defaultDate: "+1w",
									changeMonth: true,
									numberOfMonths: 2
								})
								.on( "change", function() {
									to.datepicker( "option", "minDate", getDate( this ) );
								}),
						to = $( "#to" ).datepicker({
							defaultDate: "+1w",
							changeMonth: true,
							numberOfMonths: 2
						})
								.on( "change", function() {
									from.datepicker( "option", "maxDate", getDate( this ) );
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
		<div class="container-fluid">
        	<div class="row">
				<div class="col-md-2">
					<h4>Arama Yapın</h4>
					<form action="../filterbalance">
						<div class="form-group">
							<label for="from">Başlangıç Tarihi</label>
							<input type="text" id="from" name="from" class="form-control">
						</div>
						<div class="form-group">
							<label for="to">Bitiş Tarihi</label>
							<input type="text" id="to" name="to" class="form-control">
						</div>
                        <div class="checkbox">
                            <label><input type="checkbox" value="" name="allDate">Tüm Tarihleri Getir</label>
                        </div>
                        <div class="form-group">
                            <label for="dau">BKB Seç</label>
                            <select name="department" id="dau">
                                <c:forEach var="item" items="${dau}">
                                    <option value="${item.unitName}">
                                        <c:out value="${item.unitName}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" value="" name="allDau">Tüm Birimleri Getir</label>
                        </div>
						<button type="submit">Kayıtları Getir</button>
					</form>
				</div>
				<div class="col-md-2">
					<h4>Bakiye Miktarları</h4>
					<table class="table table-bordered">
						<c:forEach var="item" items="${dau}">
						<tr>
							<th>${item.unitName}</th>
							<td align="right">${item.balance}</td>
						<tr>
							</c:forEach>
					</table>
				</div>
            </div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<h4>İşlem Kayıtları</h4>
					<table class="table table-hover">
						<thead>
						<tr>
							<th>İşlem tarihi</th>
                            <th>Açıklama</th>
							<th>Birim Adı</th>
							<th>Onay veren kullanıcı</th>
							<th>Miktar (TL)</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="item" items="${accounting }">
							<tr>
                                <td><fmt:formatDate type="date" value="${item.accountingPK.dateTime}"/></td>
                                <td></td>
								<td>${item.dauUser.dau.unitName }</td>
								<td>${item.dauUser.userName }</td>
								<td align="right">${item.amount}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-4"></div>
			</div>
        </div>
	</body>
</html>
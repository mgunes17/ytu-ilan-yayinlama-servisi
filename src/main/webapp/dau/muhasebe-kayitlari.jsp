<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="html/head.html"></jsp:include>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>Hesap ��lem Ge�mi�i</title>
	</head>
	<body>
		<jsp:include page="html/menu.html"></jsp:include>
		<div class="jumbotron container-fluid">
			<div class="row">
				<div class="col-md-1"></div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <p>Arama Yap�n</p>
                        </div>
                        <div class="panel-body">
                            <form action="#" method="post">
                                <div class="form-group">
                                    selectbox-kullan�c� se�imi
                                </div>
                                <div class="form-group">
                                    radio harcama kabul t�m�
                                </div>
                                <div class="form-group">
                                    tarih aral��� se�imi
                                </div>
                                <button type="submit" class="btn btn-success">Ara</button>
                            </form>
                        </div>
                    </div>
                </div>
				<div class="col-md-6">
					<h4>BKB bakiyesi: ${user.dau.balance}</h4>
					
					<table class="table table-hover">
						<thead>
							<tr>
								<th>��lemi yapan kullan�c�</th>
                                <th>A��klama</th>
								<th>��lem tarihi</th>
								<th>Miktar</th>
							</tr>	
						</thead>
						<tbody>
							<c:forEach var="item" items="${accounting }">
								<tr>
									<td>${item.dauUser.userName }</td>
                                    <td>--ilgili a��klama</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${item.accountingPK.dateTime}"/></td>
									<td align="right">${item.amount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
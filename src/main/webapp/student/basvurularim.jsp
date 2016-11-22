<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<jsp:include page="../html/head.html"></jsp:include>
		<title>Ba�vurular</title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
 				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 				<div class="col-md-7">
 					<h4>Yapm�� Oldu�unuz Ba�vurular</h4>
 					
 					<table class="table table-bordered">
 						<thead>
 							<tr>
 								<th>�lan Ad�</th>
 								<th>�lan�n Durumu</th>
 								<th>Ba�vuru Zaman�</th>
 								<th>��lem</th>
 							</tr>
 						</thead>
 						<tbody>
							<c:forEach var="item" items="${student.myApplications }">
								<tr>
									<td>${item.pk.announcement.title }</td>
									<td>${item.pk.announcement.state.title }</td>
									<td><fmt:formatDate value="${item.timeToApplication}"/></td>
									<td>
										<form>
											<input type="hidden" name="deleteUrl" value="myapplications">
											<input type="hidden" name="announcement" value="${item.pk.announcement.id }">
											<input type="submit" formaction="../announcementdetailtostudent" value="�lana Git"/>
											<input type="submit" formaction="../deleteapplication" value="Ba�vuruyu Geri �ek"/>
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
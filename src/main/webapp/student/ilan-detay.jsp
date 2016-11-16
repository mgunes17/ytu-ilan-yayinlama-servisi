<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
		<title>�lan Detay</title>
		<jsp:include page="../html/head.html"></jsp:include>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="html/header.html"></jsp:include>
			</div>
			
			<div class="row">
 				<div class="col-md-3"><jsp:include page="html/menu.html"/></div>
 				<div class="col-md-4">
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
 							<td>G�r�nt�lenme Say�s�</td>
 							<td>${announcement.numberOfPageViews}</td>
 						</tr>
 						<tr>
 							<td colspan="2">
 								<form action = "../applicationtoannouncement" method = "post">
									<input type = "hidden" name = "ann" value = "${announcement.id}" >
									<input type = "submit" value = "�lana Ba�vur">
								</form>
							</td>
 						</tr>
 					</table>
 				</div>
 			</div>
		</div>	
	
	
	</body>
</html>
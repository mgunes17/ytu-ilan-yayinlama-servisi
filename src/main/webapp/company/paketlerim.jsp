<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="html/head.html"/>
		<title>Paketlerim</title>
	</head>
	<body>
		<jsp:include page="html/menu.html"/>
		<div class="jumbotron container-fluid">
			<div class="row">
                <div class="col-md-1"></div>
				<div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <p>Arama Kriterleriniz</p>
                        </div>
                        <div class="panel-body">
                            <form method="post" action="../searchmypackets">
                                <div class="form-group">
                                    <label for="state">Durumu</label>
                                    <select class="form-control" id="state" name="packetState">
                                        <c:forEach var="item" items="${packetStates}">
                                            <option value="${item.id}">
                                                <c:out value="${item.title}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success">Getir</button>
                            </form>
                        </div>
                    </div>
                </div>
				<div class="col-md-7">
                    <c:if test="${fn:length(packets) eq 0}">
                        <p>Sonuç yok.</p>
                        <p>Yan paneli kullanarak arama yapabilirsiniz.</p>
                    </c:if>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Durumu
                                    <a href="../ordermypackets?condition=announcement_packet_state&type=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../ordermypackets?condition=announcement_packet_state&type=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>Paket Başlığı</th>
								<th>Kullanılan/Kalan</th>
								<th>Onay Zamanı
                                    <a href="../ordermypackets?condition=time_to_approved&type=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../ordermypackets?condition=time_to_approved&type=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>SKT <a href="#" title="Son Kullanım Tarihi"><span class="glyphicon glyphicon-question-sign"></span></a>
                                    <a href="../ordermypackets?condition=time_to_expired&type=asc" title="Artan Sırala">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </a>
                                    <a href="../ordermypackets?condition=time_to_expired&type=desc" title="Azalan Sırala">
                                        <span class="glyphicon glyphicon-arrow-down"></span>
                                    </a>
                                </th>
								<th>İşlem</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${packets}">
								<tr>
									<td>${item.state.title}</td>
									<td>${item.packet.title}</td>
									<td align="right">${item.usedAnnouncements}/${item.packet.announcementCount - item.usedAnnouncements}</td>
									<td align="right"><fmt:formatDate pattern="dd-MM-yyyy" value="${item.timeToApproved}"/></td>
									<td align="right"><fmt:formatDate pattern="dd-MM-yyyy" value="${item.timeToExpired}"/></td>
                                    <td>

                                    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
            </div>
			<div class="row">
				<jsp:include page="../html/footer.html"></jsp:include>
			</div>
		</div>
	</body>
</html>
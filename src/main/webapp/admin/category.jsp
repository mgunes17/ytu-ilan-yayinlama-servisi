<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<ul>
    <c:forEach var="node2" items="${node.children}">
        <li>
        	<c:set var="node" value="${node2}" scope="request"/>
            ${node2.id} <!-- or whatever else you want to display -->
            <jsp:include page="category.jsp" />
        </li>
    </c:forEach>
</ul>

<hr>
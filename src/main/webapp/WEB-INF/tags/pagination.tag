<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="url" required="true" %>
<%@ attribute name="page" required="true" type="org.springframework.data.domain.Page" %>
<%@ attribute name="body" required="true" type="java.util.List" %>
<%@ attribute name="querySymbol" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div>
    <ul class="pagination">
        <li class="page-item disabled">
            <a class="page-link" href="#"><spring:message code="pagination.pages"/></a>
        </li>
        <c:forEach items="${body}" var="p">
            <c:choose>
                <c:when test="${(p-1) == page.getNumber()}">
                    <li class="page-item active">
                        <a class="page-link" href="#">${p}</a>
                    </li>
                </c:when>
                <c:when test="${p == -1}">
                    <li class="page-item disabled">
                        <a class="page-link" href="#">...</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="${url}${querySymbol}page=${(p-1)}">${p}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>

</div>


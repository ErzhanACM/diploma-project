<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="toiList" required="true" type="java.util.List" %>
<%@ attribute name="user" required="false" type="kz.kstu.almasov.diplomaproject.entity.user.User" %>
<%@ attribute name="creator" required="false" type="kz.kstu.almasov.diplomaproject.entity.user.User" %>
<%@ attribute name="url" required="true" %>
<%@ attribute name="page" required="true" type="org.springframework.data.domain.Page" %>
<%@ attribute name="body" required="true" type="java.util.List" %>
<%@ attribute name="querySymbol" required="true" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:if test="${empty toiList}">
    <div class="my-5">
        <c:if test="${empty creator and empty user}">
            <h5><spring:message code="your.search.returner.no.mathces"/></h5>
        </c:if>
        <c:if test="${not empty creator}">
            <div class="row justify-content-center">
                <a href="/user/${creator.id}" class="link-center red-link ml-2">${creator.username}</a>
            </div>
            <h5 class="page-title"><spring:message code="user.has.organized.no.toi"/></h5>
        </c:if>
        <c:if test="${not empty user}">
            <div class="row justify-content-center">
                <a href="/user/${user.id}" class="link-center red-link ml-2">${user.username}</a>
            </div>
            <h5 class="page-title"><spring:message code="user.has.no.favorite.toi"/></h5>
        </c:if>
    </div>
</c:if>

<c:if test="${not empty toiList}">

    <div class="row justify-content-center mt-4">
        <c:if test="${empty creator and empty user}">
            <h5 class="page-title"><spring:message code="tois.found"/></h5>
        </c:if>
        <c:if test="${not empty creator}">
            <h5 class="page-title"><spring:message code="tois.of.user"/></h5><a href="/user/${creator.id}"
                                                                                class="red-link ml-2">${creator.username}</a>
        </c:if>
        <c:if test="${not empty user}">
            <h5 class="page-title"><spring:message code="favorite.tois.of.user"/></h5><a href="/user/${user.id}"
                                                                                class="red-link ml-2">${user.username}</a>
        </c:if>
    </div>

    <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

    <div class="mt-3" id="table-div">
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col"><spring:message code="label.toi.name"/></th>
                <th scope="col"><spring:message code="label.toi.type"/></th>
                <th scope="col"><spring:message code="label.toi.date"/></th>
                <th scope="col"><spring:message code="label.toi.city"/></th>
                <th scope="col"><spring:message code="label.toi.place"/></th>
                <th scope="col"><spring:message code="label.toi.number.of.guests"/></th>
                <c:if test="${empty creator}">
                    <th scope="col"><spring:message code="label.toi.creator"/></th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${toiList}" var="toi">
                <tr onclick="document.location = '${toi.id}';">
                    <td scope="row">${toi.id}</td>
                    <td>${toi.name}</td>
                    <td><spring:message code="${toi.type.name().toLowerCase()}"/></td>
                    <td>${toi.date}</td>
                    <td><spring:message code="${toi.city}"/></td>
                    <td><spring:message code="${toi.place}"/></td>
                    <td>${toi.numberOfGuests}</td>
                    <c:if test="${empty creator}">
                        <td><a href="/user/${toi.creator.id}">${toi.creator.username}</a></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

</c:if>


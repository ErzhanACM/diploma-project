<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="restaurantList" required="true" type="java.util.List" %>
<%@ attribute name="user" required="false" type="kz.kstu.almasov.diplomaproject.entity.user.User" %>
<%@ attribute name="administrator" required="false" type="kz.kstu.almasov.diplomaproject.entity.user.User" %>
<%@ attribute name="url" required="true" %>
<%@ attribute name="page" required="true" type="org.springframework.data.domain.Page" %>
<%@ attribute name="body" required="true" type="java.util.List" %>
<%@ attribute name="querySymbol" required="true" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${empty restaurantList}">
    <div class="my-5">
        <c:if test="${empty administrator and empty user}">
            <h5><spring:message code="your.search.returner.no.mathces"/></h5>
        </c:if>
        <c:if test="${not empty administrator}">
            <div class="row justify-content-center">
                <a href="/user/${administrator.id}" class="link-center red-link ml-2">${administrator.username}</a>
            </div>
            <h5 class="page-title"><spring:message code="user.has.no.restaurant"/></h5>
        </c:if>
        <c:if test="${not empty user}">
            <div class="row justify-content-center">
                <a href="/user/${user.id}" class="link-center red-link ml-2">${user.username}</a>
            </div>
            <h5 class="page-title"><spring:message code="user.has.no.favorite.restaurant"/></h5>
        </c:if>
    </div>
</c:if>

<c:if test="${not empty restaurantList}">

    <div class="row justify-content-center mt-4">
        <c:if test="${empty administrator and empty user}">
            <h5 class="page-title"><spring:message code="restaurants.found"/></h5>
        </c:if>
        <c:if test="${not empty administrator}">
            <h5 class="page-title"><spring:message code="restaurants.of.user"/></h5><a href="/user/${administrator.id}"
                                                                                       class="red-link ml-2">${administrator.username}</a>
        </c:if>
        <c:if test="${not empty user}">
            <h5 class="page-title"><spring:message code="favorite.restaurants.of.user"/></h5><a href="/user/${user.id}"
                                                                                                class="red-link ml-2">${user.username}</a>
        </c:if>
    </div>

    <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

    <div class="row my-3" id="cards">
        <c:forEach items="${restaurantList}" var="restaurant">
            <div class="col-md-4 mt-3">
                <div class="card card-custom">
                    <img
                    <c:if test="${not empty restaurant.avatarFileName}">
                            src="/img/${restaurant.avatarFileName}"
                    </c:if>
                    <c:if test="${empty restaurant.avatarFileName}">
                            src="<c:url value="/resources/img/unknown_restaurant_avatar.png"/>"
                    </c:if> class="card-img-top" alt="">
                    <div class="card-body">
                        <h5 class="card-title"><a href="/restaurant/${restaurant.id}" class="red-link">${restaurant.name}</a></h5>
                        <h6><spring:message code="rating"/>: ${restaurant.rating}/10</h6>
                        <p class="my-3"><spring:message code="administrator"/>: <a
                                href="/user/${restaurant.administrator.id}" class="red-link">${restaurant.administrator.username}</a></p>
                        <p class="card-text">${restaurant.city} ${restaurant.address}</p>
                        <p class="card-text"><spring:message code="label.capacity" />: ${restaurant.capacity}</p>
                        <p class="card-text"><spring:message code="label.price.per.person" />: ${restaurant.pricePerPerson}</p>
                        <div class="row justify-content-center">
                            <form:form method="get" action="/restaurant/${restaurant.id}">
                                <button type="submit" class="btn custom-btn dark-btn"><spring:message code="button.open.page" /></button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

</c:if>


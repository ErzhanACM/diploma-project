<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="restaurant_admin" required="true" type="kz.kstu.almasov.diplomaproject.entity.user.RestaurantAdmin" %>
<%@ attribute name="user" required="true" type="kz.kstu.almasov.diplomaproject.entity.user.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="col-md-4 mt-3">
    <div class="card card-custom">
        <img
        <c:if test="${not empty user.avatarFileName}">
                src="/img/${user.avatarFileName}"
        </c:if>
        <c:if test="${empty user.avatarFileName}">
                src="<c:url value="/resources/img/unknown_user_avatar.png"/>"
        </c:if>
                class="card-img-top mt-4" alt="${user.username}_avatar">
        <div class="card-body">
            <h5 class="card-title"><a href="/user/${user.id}" class="red-link">${user.username}</a></h5>
            <h6 class="my-3">${user.firstName} ${user.secondName} ${user.patronymic}</h6>
            <p class="card-text"><spring:message code="label.experience"/>: ${restaurant_admin.experience} <spring:message
                    code="label.years"/></p>
            <div class="row justify-content-center">
                <form:form method="get" action="/user/${user.id}">
                    <button type="submit" class="btn custom-btn dark-btn"><spring:message
                            code="button.open.page"/></button>
                </form:form>
            </div>
        </div>
    </div>
</div>


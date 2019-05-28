<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title><spring:message code="app.name"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <!-- for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/user_page_style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/toi_page_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container emp-profile">

    <div class="row">
        <div class="col-md-4">
            <div class="profile-img">
                <c:if test="${empty restaurant.avatarFileName}">
                    <img src="<c:url value="/resources/img/unknown_restaurant_avatar.png"/>"
                         alt=""/>
                </c:if>
                <c:if test="${not empty restaurant.avatarFileName}">
                    <img src="/img/${restaurant.avatarFileName}"
                         alt=""/>
                </c:if>
                <c:if test="${isRestaurantAdmin}">
                    <div class="file btn btn-lg btn-primary">
                        <spring:message code="button.change.photo"/>
                        <form:form method="get" action="/restaurant/updateAvatar">
                            <input type="submit"/>
                        </form:form>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="col-md-6">
            <div class="profile-head">
                <h5>
                    ${restaurant.name}
                </h5>
                <h6 class="proile-rating">
                    <spring:message code="rating"/>: <span>${restaurant.rating}/10</span>
                </h6>
            </div>
        </div>
        <div class="col-md-2">
            <form action="/restaurant/addToToi" method="get">
                <input type="submit" class="btn custom-btn red-btn" name="btnAddMore" value="Add to toi"/>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="profile-work">
                <p><spring:message code="page.actions"/></p>
                <a href="/restaurant/reviewList/${restaurant.id}"><spring:message
                        code="restaurant.page.option.reviews"/></a><br/>
                <a href="/user/${restaurant.administrator.id}"><spring:message
                        code="restaurant.page.option.administrator.page"/></a><br/>
                <c:if test="${isRestaurantAdmin}">
                    <a href="/restaurant/editRestaurant/${restaurant.id}"><spring:message
                            code="restaurant.page.option.edit"/></a><br/>
                    <a href=""><spring:message code="restaurant.page.option.delete"/></a><br/>
                </c:if>
                <c:if test="${!isRestaurantAdmin}">
                    <form:form method="get" action="/restaurant/addReview">
                        <button type="submit" class=""><spring:message
                                code="restaurant.page.option.add.review"/></button>
                        <br/>
                        <input type="hidden" name="restaurant" value="${restaurant.id}">
                        <input type="hidden" name="user"
                               value="<security:authentication property="principal.id"/>">
                    </form:form>
                    <c:if test="${!isFavorite}">
                        <form:form method="post" action="/user/addRestaurantToFavorites/${restaurant.id}">
                            <button type="submit" class=""><spring:message
                                    code="restaurant.page.option.add.to.favorites"/></button>
                            <br/>
                        </form:form>
                    </c:if>
                    <c:if test="${isFavorite}">
                        <form:form method="post" action="/user/deleteRestaurantFromFavorites/${restaurant.id}">
                            <button type="submit" class=""><spring:message
                                    code="restaurant.page.option.delete.from.favorites"/></button>
                            <br/>
                        </form:form>
                    </c:if>
                </c:if>
            </div>
        </div>
        <div class="col-md-8">
            <div class="tab-content profile-tab" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="row">
                        <div class="col-md-3">
                            <label><spring:message code="administrator"/></label>
                        </div>
                        <div class="col-md-9">
                            <p>${restaurant.administrator.username}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label><spring:message code="label.city"/></label>
                        </div>
                        <div class="col-md-9">
                            <p>${restaurant.city}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label><spring:message code="label.address"/></label>
                        </div>
                        <div class="col-md-9">
                            <p>${restaurant.address}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label><spring:message code="label.capacity"/></label>
                        </div>
                        <div class="col-md-9">
                            <p>${restaurant.capacity}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label><spring:message code="label.price.per.person"/></label>
                        </div>
                        <div class="col-md-9">
                            <p>${restaurant.pricePerPerson}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="my-4"><spring:message code="label.description"/></label><br/>
                            <p>${restaurant.description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<tag:footer/>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>


</body>
</html>
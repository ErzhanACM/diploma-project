<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title><spring:message code="app.name" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <!-- for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container mt-5">

    <c:if test="${empty user and empty creator}">

        <div class="row justify-content-center mt-4">
            <h4 class="page-title"><spring:message code="page.title.restaurant.searching"/></h4>
        </div>

    </c:if>

    <div class="card mt-3">
        <div class="card-header" id="headingOne">
            <div class="row justify-content-center my-2">
                <p class="white-p centered-p"><spring:message
                        code="headline.restaurant.searching.parameters.and.sorting"/></p>
            </div>
            <h5 class="mb-2">
                <button class="btn custon-btn light-btn" type="button" data-toggle="collapse"
                        data-target="#option_search" aria-expanded="false" aria-controls="option_search">
                    <spring:message code="button.open.parameters.for.search.and.sort"/>
                </button>
            </h5>
        </div>

        <div class="collapse multi-collapse <c:if test="${not empty searchedRestaurant}">show</c:if>"
             aria-labelledby="headingOne" id="option_search">
            <div class="card-body">

                <form:form method="get" action="/restaurant/searchRestaurant" class="needs-validation" novalidate="true">

                    <div class="row">
                        <div class="col-md-3">
                            <label for="restaurantName"><spring:message code="label.restaurant.name"/></label>
                            <input class="form-control  <c:if test="${not empty nameError}">is-invalid</c:if>"
                                   type="text" id="restaurantName" name="name"
                                   placeholder="<spring:message code="placeholder.restaurant.name"/>"
                                   value="<c:if test="${not empty searchedRestaurant}">${searchedRestaurant.name}</c:if>">
                            <div class="invalid-feedback">
                                <spring:message code="${nameError}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="restaurantCity"><spring:message code="label.city"/></label>
                            <select class="form-control <c:if test="${not empty cityError}">is-invalid</c:if>"
                                    name="city" id="restaurantCity">
                                <c:if test="${not empty searchedRestaurant.city}">
                                    <option value="${searchedRestaurant.city}" selected><spring:message
                                            code="${searchedRestaurant.city}"/></option>
                                </c:if>
                                <option value=""><spring:message code="undefined"/></option>
                                <option value="temirtau"><spring:message code="temirtau"/></option>
                                <option value="karaganda"><spring:message code="karaganda"/></option>
                                <option value="almaty"><spring:message code="almaty"/></option>
                                <option value="nursultan"><spring:message code="nursultan"/></option>
                                <option value="nursultan"><spring:message code="nursultan"/></option>
                                <option value="nursultan"><spring:message code="nursultan"/></option>
                                <option value="nursultan"><spring:message code="nursultan"/></option>
                                <option value="nursultan"><spring:message code="nursultan"/></option>
                                <option value="nursultan"><spring:message code="nursultan"/></option>
                            </select>
                            <div class="invalid-feedback">
                                <spring:message code="${cityError}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="restaurantAddress"><spring:message code="label.address"/></label>
                            <input class="form-control  <c:if test="${not empty addressError}">is-invalid</c:if>"
                                   type="text" id="restaurantAddress" name="address"
                                   placeholder="<spring:message code="placeholder.address"/>"
                                   value="<c:if test="${not empty searchedRestaurant}">${searchedRestaurant.address}</c:if>">
                            <div class="invalid-feedback">
                                <spring:message code="${addressError}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="restaurantRating"><spring:message code="label.rating"/></label>
                            <input class="form-control  <c:if test="${not empty ratingError}">is-invalid</c:if>"
                                   type="text" id="restaurantRating" name="rating"
                                   placeholder="<spring:message code="placeholder.rating"/>"
                                   value="<c:if test="${not empty searchedRestaurant}">${searchedRestaurant.rating}</c:if>">
                            <div class="invalid-feedback">
                                <spring:message code="${ratingError}"/>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">

                        <div class="col-md-3">
                            <label for="restaurantCapacity"><spring:message code="label.capacity"/></label>
                            <input class="form-control  <c:if test="${not empty capacityError}">is-invalid</c:if>"
                                   type="text" id="restaurantCapacity" name="capacity"
                                   placeholder="<spring:message code="placeholder.capacity"/>"
                                   value="<c:if test="${not empty searchedRestaurant}">${searchedRestaurant.capacity}</c:if>">
                            <div class="invalid-feedback">
                                <spring:message code="${capacityError}"/>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="restaurantPricePerPerson"><spring:message code="label.price.per.person"/></label>
                            <input class="form-control  <c:if test="${not empty pricePerPersonError}">is-invalid</c:if>"
                                   type="text" id="restaurantPricePerPerson" name="pricePerPerson"
                                   placeholder="<spring:message code="placeholder.price.per.person"/>"
                                   value="<c:if test="${not empty searchedRestaurant}">${searchedRestaurant.pricePerPerson}</c:if>">
                            <div class="invalid-feedback">
                                <spring:message code="${pricePerPersonError}"/>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="sortOptions"><spring:message code="label.sort.by"/></label>
                            <select class="form-control" name="sort" id="sortOptions">
                                <c:if test="${not empty sort}">
                                    <option value="${sort}"><spring:message code="${sort}"/></option>
                                </c:if>
                                <option value="name"><spring:message code="by.name"/></option>
                                <option value="city"><spring:message code="by.city"/></option>
                                <option value="address"><spring:message code="by.address"/></option>
                                <option value="capacity"><spring:message code="by.capacity"/></option>
                                <option value="pricePerPerson"><spring:message code="by.price.per.person"/></option>
                            </select>
                        </div>
                        <div class="col-md-3 pt-4">
                            <div class="row justify-content-center">
                                <button type="submit" class="btn custom-btn dark-btn px-4 py-2"><spring:message
                                        code="button.search"/></button>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="favorite" value="${favorite}">
                    <input type="hidden" name="administrator"
                           value="<c:if test="${not empty administrator}">${administrator.id}</c:if>">
                </form:form>

            </div>
        </div>
    </div>

    <tag:restaurant_cards restaurantList="${restaurantList}" user="${user}" administrator="${administrator}" url="${url}" page="${page}"
                          body="${body}" querySymbol="${querySymbol}"/>

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
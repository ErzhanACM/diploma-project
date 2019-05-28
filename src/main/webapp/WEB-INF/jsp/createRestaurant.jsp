<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="<c:url value="/resources/css/create_toi_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container px-4 pt-4">

    <div class="row justify-content-center mt-4">
        <h4 class="page-title"><spring:message code="page.title.registrating.restaurant"/></h4>
    </div>

    <div class="row justify-content-center mt-2">
        <p><spring:message code="headline.restaurant.registrating.rule"/></p>
    </div>

    <div class="row justify-content-center mb-4">
        <p class="hint"><spring:message code="headline.required.fields.are.marked"/> <span
                class="hint-span">*</span></p>
    </div>

    <form:form method="post" action="/restaurant/createRestaurant" class="needs-validation" novalidate="true">

        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="restaurantName"><spring:message code="label.restaurant.name"/></label>
                <input class="form-control <c:if test="${not empty nameError}">is-invalid</c:if>" type="text"
                       id="restaurantName" name="name"
                       value="<c:if test="${not empty creatingRestaurant}">${creatingRestaurant.name}</c:if>"
                       placeholder="<spring:message code="placeholder.restaurant.name"/>" required>
                <div class="invalid-feedback">
                    <spring:message code="${nameError}"/>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-2 mb-3">
                <label for="restaurantCity"><spring:message code="label.city"/></label>
                <select class="form-control <c:if test="${not empty cityError}">is-invalid</c:if>" name="city"
                        id="restaurantCity">
                    <c:if test="${not empty creatingRestaurant.city}">
                        <option value="${creatingRestaurant.city}" selected><spring:message
                                code="${creatingRestaurant.city}"/></option>
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

            <div class="col-md-4 mb-3">
                <label for="restaurantAddress"><spring:message code="label.address"/></label>
                <input class="form-control <c:if test="${not empty addressError}">is-invalid</c:if>" type="text"
                       id="restaurantAddress" name="address"
                       value="<c:if test="${not empty creatingRestaurant}">${creatingRestaurant.address}</c:if>"
                       placeholder="<spring:message code="placeholder.address" />"
                       required>
                <div class="invalid-feedback">
                    <spring:message code="${addressError}"/>
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label for="restaurantCapacity"><spring:message code="label.capacity"/></label>
                <input class="form-control <c:if test="${not empty capacityError}">is-invalid</c:if>"
                       type="text"
                       id="restaurantCapacity" name="capacity"
                       value="<c:if test="${not empty creatingRestaurant}">${creatingRestaurant.capacity}</c:if>"
                       placeholder="<spring:message code="placeholder.capacity"/>"
                       required>
                <div class="invalid-feedback">
                    <spring:message code="${capacityError}"/>
                </div>
            </div>

            <div class="col-md-3 mb-3">
                <label for="restaurantPricePerPerson"><spring:message code="label.price.per.person"/></label>
                <input class="form-control <c:if test="${not empty pricePerPersonError}">is-invalid</c:if>"
                       type="text"
                       id="restaurantPricePerPerson" name="pricePerPerson"
                       placeholder="<spring:message code="placeholder.price.per.person" />"
                       value="<c:if test="${not empty creatingRestaurant}">${creatingRestaurant.pricePerPerson}</c:if>"
                       required>
                <div class="invalid-feedback">
                    <spring:message code="${pricePerPersonError}"/>
                </div>
            </div>
        </div>

        <div class="form-row">

            <div class="col-md-8 mb-3">
                <label for="restaurantDescription"><spring:message code="label.description"/></label>
                <textarea class="form-control <c:if test="${not empty descriptionError}">is-invalid</c:if>"
                          type="textarea" rows="5" minlength="10" id="restaurantDescription" name="description"
                          placeholder="<spring:message code="placeholder.description"/>"><c:if
                        test="${not empty creatingRestaurant}">${creatingRestaurant.description}</c:if></textarea>
                <div class="invalid-feedback">
                    <spring:message code="${descriptionError}"/>
                </div>
            </div>

        </div>


        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="row justify-content-center">
            <button class="btn mt-3 px-5 custom-btn dark-btn " type="submit"><spring:message
                    code="button.register"/></button>
        </div>
    </form:form>


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

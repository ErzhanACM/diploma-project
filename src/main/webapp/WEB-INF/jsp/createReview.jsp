<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Diploma project</title>
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
        <h4 class="page-title"><spring:message code="page.title.adding.review"/></h4>
    </div>

    <div class="row justify-content-center mt-2">
        <p><spring:message code="headline.review.creating.rule"/></p>
    </div>

    <div class="row justify-content-center mb-4">
        <p class="hint"><spring:message code="headline.required.fields.are.marked"/> <span
                class="hint-span">*</span></p>
    </div>

    <form:form method="post" action="/tamada/addReview" class="needs-validation" novalidate="true">

        <div class="form-row">
            <p><spring:message code="tamada"/>: ${tamada.user.username}</p>
        </div>

        <div class="form-row mb-3">

            <div class="col">
                <label for="reviewRating"><spring:message code="rating"/></label>
                <div id="reviewRating">
                    <label class="checkbox-inline mr-3">
                        <input type="radio" name="rating" value="1">1
                    </label>
                    <label class="checkbox-inline mr-3">
                        <input type="radio" name="rating" value="2">2
                    </label>
                    <label class="checkbox-inline mr-3">
                        <input type="radio" name="rating" value="3">3
                    </label>
                </div>
                <div class="invalid-feedback">
                    <spring:message code="${ratingError}"/>
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-8 mb-3">
                <label for="reviewHeadline"><spring:message code="label.headline"/></label>
                <input id="reviewHeadline" type="text" name="headline"
                       class="form-control <c:if test="${not empty headlineError}">is-invalid</c:if>"
                       placeholder="<spring:message code="placeholder.headline"/>"
                       value="<c:if test="${not empty tamadaReview}">${tamadaReview.headline}</c:if>">
                <div class="invalid-feedback">
                    <spring:message code="${headlineError}"/>
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-8 mb-3">
                <label for="reviewText"><spring:message code="label.text"/></label>
                <textarea class="form-control <c:if test="${not empty textError}">is-invalid</c:if>"
                          type="textarea" rows="7" minlength="10" id="reviewText" name="text"
                          placeholder="<spring:message code="placeholder.text"/>"><c:if test="${not empty tamadaReview}">${tamadaReview.text}</c:if></textarea>
                <div class="invalid-feedback">
                    <spring:message code="${textError}"/>
                </div>
            </div>

        </div>
        <input type="text" value="${tamada.id}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" name="tamadaId" value="${tamada.id}">
        <input type="hidden" name="userId" value="<security:authentication property="principal.id" />">
        <div class="row justify-content-center">
            <button class="btn mt-3 px-5 custom-btn dark-btn " type="submit"><spring:message
                    code="button.add.review"/></button>
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

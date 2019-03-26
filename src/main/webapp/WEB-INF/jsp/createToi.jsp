<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h4 class="page-title"><spring:message code="page.title.toi.creating"/></h4>
    </div>

    <div class="row justify-content-center mt-2">
        <p><spring:message code="headline.toi.creating.rule"/></p>
    </div>

    <div class="row justify-content-center mb-4">
        <p class="hint"><spring:message code="headline.toi.creating.required.fields.are.marked"/> <span
                class="hint-span">*</span></p>
    </div>

    <form:form method="post" action="/toi/createToi" class="needs-validation" novalidate="true">

        <div class="form-row">

            <div class="col-md-3 mb-3">
                <label for="toiType"><spring:message code="label.toi.type"/> *</label>
                <select class="form-control <c:if test="${not empty typeError}">is-invalid</c:if>" name="selectedType"
                        id="toiType" required>
                    <c:if test="${not empty selectedType}">
                        <option value="${selectedType}" selected><spring:message code="${selectedType}"/></option>
                    </c:if>
                    <option value="wedding"><spring:message code="wedding"/></option>
                    <option value="anniversary"><spring:message code="anniversary"/></option>
                    <option value="birthday"><spring:message code="birthday"/></option>
                    <option value="jubilee"><spring:message code="jubilee"/></option>
                </select>
                <div class="invalid-feedback">
                    <spring:message code="${typeError}"/>
                </div>
            </div>

            <div class="col-md-5 mb-3">
                <label for="toiName"><spring:message code="label.toi.name"/> *</label>
                <input class="form-control <c:if test="${not empty nameError}">is-invalid</c:if>" type="text"
                       id="toiName" name="name" placeholder="<spring:message code="placeholder.toi.name"/>"
                       value="<c:if test="${not empty creatingToi}">${creatingToi.name}</c:if>" required>
                <div class="invalid-feedback">
                    <spring:message code="${nameError}"/>
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-3 mb-3">
                <label for="toiDate"><spring:message code="label.toi.date"/> *</label>
                <input class="form-control <c:if test="${not empty dateError}">is-invalid</c:if>" type="date"
                       id="toiDate" name="date" placeholder=""
                       value="<c:if test="${not empty creatingToi}">${selectedDate}</c:if>" required>
                <div class="invalid-feedback">
                    <spring:message code="${dateError}"/>
                </div>
            </div>

            <div class="col-md-5 mb-3">
                <label for="toiWhereabouts"><spring:message code="label.toi.whereabouts"/> *</label>
                <input class="form-control <c:if test="${not empty whereaboutsError}">is-invalid</c:if>" type="text"
                       id="toiWhereabouts" name="whereabouts"
                       placeholder="<spring:message code="placeholder.toi.whereabouts"/>"
                       value="<c:if test="${not empty creatingToi}">${creatingToi.whereabouts}</c:if>" required>
                <div class="invalid-feedback">
                    <spring:message code="${whereaboutsError}"/>
                </div>
            </div>

        </div>

        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-md-2 pt-0"><spring:message code="label.toi.place"/> *</legend>
                <div class="col-md-5">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="selectedPlace" id="gridRadios1"
                               value="restaurant" checked>
                        <label class="form-check-label" for="gridRadios1">
                            <spring:message code="restaurant"/> / <spring:message code="coffee"/>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="selectedPlace" id="gridRadios2" value="home">
                        <label class="form-check-label" for="gridRadios2">
                            <spring:message code="place.home"/>
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>

        <div class="divider"></div>

        <div class="row justify-content-center mb-1">
            <p><spring:message code="headline.toi.creating.additional.information"/></p>
        </div>

        <div class="row justify-content-center mb-4">
            <p class="hint"><spring:message code="headline.toi.creating.skip.step"/></p>
        </div>

        <div class="form-row">

            <div class="col-md-3 mb-3">
                <label for="toiNumberOfGuests"><spring:message code="label.toi.number.of.giests"/></label>
                <input class="form-control <c:if test="${not empty numberOfGuestsError}">is-invalid</c:if>" type="text"
                       id="toiNumberOfGuests" name="numberOfGuests"
                       placeholder="<spring:message code="placeholder.toi.number.of.giests"/>"
                       value="<c:if test="${not empty creatingToi}">${creatingToi.numberOfGuests}</c:if>">
                <div class="invalid-feedback">
                    <spring:message code="${numberOfGuestsError}"/>
                </div>
            </div>
        </div>

        <div class="form-row">

            <div class="col-md-9 mb-3">
                <label for="toiDescription"><spring:message code="label.toi.description"/></label>
                <textarea class="form-control <c:if test="${not empty descriptionError}">is-invalid</c:if>"
                          type="textarea" rows="5" minlength="10" id="toiDescription" name="description"
                          placeholder="<spring:message code="placeholder.toi.description"/>"><c:if
                        test="${not empty creatingToi}">${creatingToi.description}</c:if></textarea>
                <div class="invalid-feedback">
                    <spring:message code="${descriptionError}"/>
                </div>
            </div>

        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="row justify-content-center">
            <button class="btn mt-3 px-5 custom-btn dark-btn " type="submit"><spring:message code="button.create.toi"/></button>
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

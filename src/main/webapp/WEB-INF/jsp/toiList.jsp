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
</head>
<body>

<tag:navbar/>

<div class="container mt-5">

    <c:if test="${empty user}">

        <div class="row justify-content-center mt-4">
            <h4 class="page-title"><spring:message code="page.title.toi.searching"/></h4>
        </div>

        <div class="card mt-3">
            <div class="card-header" id="headingOne">
                <div class="row justify-content-center my-2">
                    <p class="white-p centered-p"><spring:message
                            code="headline.toi.searching.parameters.and.sorting"/></p>
                </div>
                <h5 class="mb-2">
                    <button class="btn custon-btn light-btn" type="button" data-toggle="collapse"
                            data-target="#option_search" aria-expanded="false" aria-controls="option_search">
                        <spring:message code="button.open.parameters.for.search.and.sort"/>
                    </button>
                </h5>
            </div>

            <div class="collapse multi-collapse <c:if test="${not empty searchedToi}">show</c:if>"
                 aria-labelledby="headingOne" id="option_search">
                <div class="card-body">

                    <form:form method="get" action="/toi/searchToi" class="needs-validation" novalidate="true">

                        <div class="row">
                            <div class="col-md-3">
                                <label for="toiName"><spring:message code="label.toi.name"/> *</label>
                                <input class="form-control  <c:if test="${not empty nameError}">is-invalid</c:if>"
                                       type="text" id="toiName" name="name"
                                       placeholder="<spring:message code="placeholder.toi.name"/>"
                                       value="<c:if test="${not empty searchedToi}">${searchedToi.name}</c:if>">
                                <div class="invalid-feedback">
                                    <spring:message code="${nameError}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="toiType"><spring:message code="label.toi.type"/> *</label>
                                <select class="form-control <c:if test="${not empty typeError}">is-invalid</c:if>"
                                        name="type" id="toiType">
                                    <c:if test="${not empty searchedToi.type}">
                                        <option value="${searchedToi.type}" selected><spring:message
                                                code="${searchedToi.type}"/></option>
                                    </c:if>
                                    <option value=""><spring:message code="undefined"/></option>
                                    <option value="wedding"><spring:message code="wedding"/></option>
                                    <option value="anniversary"><spring:message code="anniversary"/></option>
                                    <option value="birthday"><spring:message code="birthday"/></option>
                                    <option value="jubilee"><spring:message code="jubilee"/></option>
                                </select>
                                <div class="invalid-feedback">
                                    <spring:message code="${typeError}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="toiDate1"><spring:message code="label.toi.date"/> *</label>
                                <input class="form-control <c:if test="${not empty dateError}">is-invalid</c:if>"
                                       type="date" id="toiDate1" name="date1"
                                       value="<c:if test="${not empty searchedToi}">${selectedDate1}</c:if>">
                                <div class="invalid-feedback">
                                    <spring:message code="${dateError}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="toiDate2"><spring:message code="label.toi.date"/> *</label>
                                <input class="form-control <c:if test="${not empty dateError}">is-invalid</c:if>"
                                       type="date" id="toiDate2" name="date2"
                                       value="<c:if test="${not empty searchedToi}">${selectedDate2}</c:if>">
                                <div class="invalid-feedback">
                                    <spring:message code="${dateError}"/>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-2">
                                <label for="toiCity"><spring:message code="label.toi.city"/> *</label>
                                <select class="form-control <c:if test="${not empty cityError}">is-invalid</c:if>"
                                        name="city" id="toiCity">
                                    <c:if test="${not empty searchedToi.city}">
                                        <option value="${searchedToi.city}" selected><spring:message
                                                code="${searchedToi.city}"/></option>
                                    </c:if>
                                    <option value=""><spring:message code="undefined"/></option>
                                    <option value="temirtau"><spring:message code="temirtau"/></option>
                                    <option value="karaganda"><spring:message code="karaganda"/></option>
                                    <option value="astana"><spring:message code="astana"/></option>
                                    <option value="almaty"><spring:message code="almaty"/></option>
                                    <option value="nursultan"><spring:message code="nursultan"/></option>
                                </select>
                                <div class="invalid-feedback">
                                    <spring:message code="${cityError}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="toiNumberOfGuests"><spring:message
                                        code="label.toi.number.of.guests"/></label>
                                <input class="form-control <c:if test="${not empty numberOfGuestsError}">is-invalid</c:if>"
                                       type="text"
                                       id="toiNumberOfGuests" name="numberOfGuests"
                                       placeholder="<spring:message code="placeholder.toi.number.of.giests"/>"
                                       value="<c:if test="${not empty searchedToi}">${searchedToi.numberOfGuests}</c:if>">
                                <div class="invalid-feedback">
                                    <spring:message code="${numberOfGuestsError}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <fieldset class="form-group">
                                    <div class="row ml-1">
                                        <label><spring:message code="label.toi.place"/></label>
                                        <div class="row ml-1 mt-2">
                                            <div class="form-check  ml-1">
                                                <input class="form-check-input" type="radio" name="place"
                                                       id="gridRadios0" value="" checked>
                                                <label class="form-check-label" for="gridRadios0">
                                                    <spring:message code="undefined"/>
                                                </label>
                                            </div>
                                            <div class="form-check  ml-1">
                                                <input class="form-check-input" type="radio" name="place"
                                                       id="gridRadios1" value="restaurant">
                                                <label class="form-check-label" for="gridRadios1">
                                                    <spring:message code="restaurant"/>
                                                </label>
                                            </div>
                                            <div class="form-check  ml-1">
                                                <input class="form-check-input" type="radio" name="place"
                                                       id="gridRadios2" value="home">
                                                <label class="form-check-label" for="gridRadios2">
                                                    <spring:message code="place.home"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-md-2">
                                <label for="sortOptions"><spring:message code="label.sort.by"/></label>
                                <select class="form-control" name="sort" id="sortOptions">
                                    <c:if test="${not empty sort}">
                                        <option value="${sort}"><spring:message code="${sort}"/></option>
                                    </c:if>
                                    <option value="name"><spring:message code="by.name"/></option>
                                    <option value="type"><spring:message code="by.type"/></option>
                                    <option value="date"><spring:message code="by.date"/></option>
                                    <option value="city"><spring:message code="by.city"/></option>
                                    <option value="place"><spring:message code="by.place"/></option>
                                </select>
                            </div>
                            <div class="col-md-2 pt-4">
                                <div class="row justify-content-center">
                                    <button type="submit" class="btn custom-btn dark-btn px-4 py-2"><spring:message code="button.search"/></button>
                                </div>
                            </div>
                        </div>
                    </form:form>

                </div>
            </div>
        </div>

    </c:if>

    <tag:table_of_tois toiList="${toiList}" user="${user}" url="${url}" page="${page}" body="${body}"
                       querySymbol="${querySymbol}"/>

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
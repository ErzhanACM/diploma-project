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
    <div class="row justify-content-center mt-4">
        <h4 class="page-title"><spring:message code="page.title.tamada.searching"/></h4>
    </div>

    <div class="card mt-3 mb-5">
        <div class="card-header" id="headingOne">
            <div class="row justify-content-center my-2">
                <p class="white-p centered-p"><spring:message
                        code="headline.tamada.searching.parameters.and.sorting"/></p>
            </div>
            <h5 class="mb-2">
                <button class="btn custon-btn light-btn" type="button" data-toggle="collapse"
                        data-target="#option_search" aria-expanded="false" aria-controls="option_search"><spring:message
                        code="button.open.parameters.for.search.and.sort"/></button>
            </h5>
        </div>

        <div class="collapse multi-collapse <c:if test="${not empty searchedTamada}">show</c:if>" aria-labelledby="headingOne" id="option_search">
            <div class="card-body">
                <form:form method="get" action="/tamada/searchTamada" class="needs-validation" novalidate="true">

                <div class="row">
                    <div class="col-md-4">
                        <label for="tamadaRating"><spring:message code="rating"/></label>
                        <input class="form-control <c:if test="${not empty ratingError}">is-invalid</c:if>" type="text" id="tamadaRating" name="rating"
                               value="<c:if test="${not empty searchedTamada}">${searchedTamada.rating}</c:if>">
                        <div class="invalid-feedback">
                            <spring:message code="${ratingError}"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="tamadaServicesPrice"><spring:message code="label.price.for.services"/>(max)</label>
                        <input class="form-control <c:if test="${not empty servicesPriceError}">is-invalid</c:if>" type="text"
                               id="tamadaServicesPrice" name="servicesPrice"
                               value="<c:if test="${not empty searchedTamada}">${searchedTamada.servicesPrice}</c:if>">
                        <div class="invalid-feedback">
                            <spring:message code="${servicesPriceError}"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="tamadaExperience"><spring:message code="label.experience"/></label>
                        <input class="form-control <c:if test="${not empty experienceError}">is-invalid</c:if>" type="text"
                               id="tamadaExperience" name="experience"
                               value="<c:if test="${not empty searchedTamada}">${searchedTamada.experience}</c:if>">
                        <div class="invalid-feedback">
                            <spring:message code="${experienceError}"/>
                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-4">
                        <label><spring:message code="label.language.proficiency"/>:</label>
                        <br>
                        <label class="checkbox-inline">
                            <input class="ml-2 pr-3" type="checkbox" name="english" value=""
                                   <c:if test="${selected_languages.contains('english')}">checked</c:if>><spring:message
                                code="english"/>
                        </label>
                        <label class="checkbox-inline">
                            <input class="ml-2 pr-3" type="checkbox" name="russian" value=""
                                   <c:if test="${selected_languages.contains('russian')}">checked</c:if>><spring:message
                                code="russian"/>
                        </label>
                        <label class="checkbox-inline">
                            <input class="ml-2 pr-3" type="checkbox" name="kazakh" value=""
                                   <c:if test="${selected_languages.contains('kazakh')}">checked</c:if>><spring:message
                                code="kazakh"/>
                        </label>
                        <label class="checkbox-inline">
                            <input class="ml-2 pr-3" type="checkbox" name="french" value=""
                                   <c:if test="${selected_languages.contains('french')}">checked</c:if>><spring:message
                                code="french"/>
                        </label>
                        <label class="checkbox-inline">
                            <input class="ml-2 pr-3" type="checkbox" name="italian" value=""
                                   <c:if test="${selected_languages.contains('italian')}">checked</c:if>><spring:message
                                code="italian"/>
                        </label>
                    </div>

                    <div class="col-md-4">
                        <label for="sortOptions"><spring:message code="label.sort.by"/></label>
                        <select class="form-control" name="sort" id="sortOptions">
                            <c:if test="${not empty sort}">
                                <option value="${sort}"><spring:message code="by.${sort}"/></option>
                            </c:if>
                            <option value="servicesPrice"><spring:message code="by.servicesPrice"/></option>
                            <option value="experience"><spring:message code="by.experience"/></option>
                        </select>
                    </div>

                    <div class="col-md-4 mt-4">
                        <div class="row justify-content-center">
                            <button type="submit" class="btn custom-btn dark-btn px-4 py-2"><spring:message
                                    code="button.search"/></button>
                        </div>
                    </div>
                </div>

                </form:form>

            </div>
        </div>
    </div>

    <c:if test="${empty tamadaList}">
        <div class="my-5">
            <h5><spring:message code="your.search.returner.no.mathces"/></h5>
        </div>
    </c:if>

    <c:if test="${not empty tamadaList}">

        <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

        <div class="row mt-3 mb-4" id="cards">

            <c:forEach items="${tamadaList}" var="tamada">
                <tag:tamada_card tamada="${tamada}" user="${tamada.user}"/>
            </c:forEach>

        </div>

        <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

    </c:if>

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
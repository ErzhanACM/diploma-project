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
        <h4 class="page-title">Поиск Тоя</h4>
    </div>

    <div class="card mt-3">
        <div class="card-header" id="headingOne">
            <div class="row justify-content-center my-2">
                <p class="white-p centered-p">Вы можете найти той быстрее указав конкретные параметры чтобы сузить
                    область поиска, а также настроить сортировку</p>
            </div>
            <h5 class="mb-2">
                <button class="btn custon-btn light-btn" type="button" data-toggle="collapse"
                        data-target="#option_search" aria-expanded="false" aria-controls="option_search">Открыть
                    параметры для поиска и сортировки
                </button>
            </h5>
        </div>

        <div class="collapse multi-collapse" aria-labelledby="headingOne" id="option_search">
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
                                    name="selectedType" id="toiType">
                                <c:if test="${not empty selectedType}">
                                    <option value="${selectedType}" selected><spring:message
                                            code="${selectedType}"/></option>
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
                            <label for="toiWhereabouts"><spring:message code="label.toi.whereabouts"/> *</label>
                            <input class="form-control <c:if test="${not empty whereaboutsError}">is-invalid</c:if>"
                                   type="text" id="toiWhereabouts" name="whereabouts"
                                   placeholder="<spring:message code="placeholder.toi.whereabouts"/>"
                                   value="<c:if test="${not empty searchedToi}">${searchedToi.whereabouts}</c:if>">
                            <div class="invalid-feedback">
                                <spring:message code="${whereaboutsError}"/>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="toiNumberOfGuests"><spring:message code="label.toi.number.of.giests"/></label>
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
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="selectedPlace"
                                                   id="gridRadios1" value="restaurant" checked>
                                            <label class="form-check-label" for="gridRadios1">
                                                <spring:message code="restaurant"/> / <spring:message code="coffee"/>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="selectedPlace"
                                                   id="gridRadios2" value="home">
                                            <label class="form-check-label" for="gridRadios2">
                                                <spring:message code="place.home"/>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-md-3">
                            <label for="toiName"><spring:message code="label.sort.by"/></label>
                            <select class="form-control">
                                <option>Название</option>
                                <option>Тип</option>
                                <option>Дата</option>
                                <option>Город</option>
                                <option>Место проведения</option>
                            </select>
                        </div>
                        <div class="col-md-2 pt-4">
                            <div class="row justify-content-center">
                                <button type="submit" class="btn custom-btn dark-btn px-4 py-2">Поиск</button>
                            </div>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>
    </div>

    <c:if test="${empty toiList}">
        <div class="my-5">
            <h5>Your search returned no matches</h5>
        </div>
    </c:if>

    <div class="mt-3" id="table-div">
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Type</th>
                <th scope="col">Date</th>
                <th scope="col">Whereabouts</th>
                <th scope="col">Place</th>
                <th scope="col">Number of guests</th>
                <th scope="col">Creator</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${toiList}" var="toi">
                <tr onclick="document.location = '${toi.id}';">
                    <td scope="row">${toi.id}</td>
                    <td>${toi.name}</td>
                    <td>${toi.type}</td>
                    <td>${toi.date}</td>
                    <td>${toi.whereabouts}</td>
                    <td>${toi.place}</td>
                    <td>${toi.numberOfGuests}</td>
                    <td><a href="/user/${toi.creator.id}">${toi.creator.username}</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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
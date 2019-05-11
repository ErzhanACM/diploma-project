<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
    <link rel="stylesheet" href="<c:url value="/resources/css/user_page_style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/toi_page_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container mt-5">

    <div class="row">
        <div class="col-md-9">
            <h4 class="mb-4">${toi.name}</h4>

            <div class="row profile-head">

                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="about-tab" data-toggle="tab" href="#about" role="tab"
                           aria-controls="about" aria-selected="true"><spring:message code="nav.item.about"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="cooperation-tab" data-toggle="tab" href="#cooperation" role="tab"
                           aria-controls="cooperation" aria-selected="false"><spring:message code="nav.item.cooperation"/></a>
                    </li>
                </ul>

            </div>

            <div class="row">
                <div class="col">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="about" role="tabpanel" aria-labelledby="about-tab">
                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-user"></i> <spring:message code="label.organizer"/></label>
                                </div>
                                <div class="col-md-9">
                                    <a href="/user/${toi.creator.id}" class="red-link">${toi.creator.username}</a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-gift"></i> <spring:message code="label.toi.type"/></label>
                                </div>
                                <div class="col-md-9">
                                    <p>${toi.type}</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-calendar"></i> <spring:message code="label.toi.date"/></label>
                                </div>
                                <div class="col-md-9">
                                    <p>${toi.date}</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-map-marker"></i> <spring:message code="label.toi.city"/></label>
                                </div>
                                <div class="col-md-9">
                                    <p>${toi.city}</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-building"></i> <spring:message code="label.toi.place"/></label>
                                </div>
                                <div class="col-md-9">
                                    <p>${toi.place}</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-users"></i> <spring:message code="label.toi.number.of.guests"/></label>
                                </div>
                                <div class="col-md-9">
                                    <p>${toi.numberOfGuests}</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label><i class="fa fa-pencil"></i> <spring:message code="label.toi.description"/></label>
                                </div>
                                <div class="col-md-9">
                                    <p>${toi.description}</p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="cooperation" role="tabpanel" aria-labelledby="cooperation-tab">
                            <div class="row">
                                <div class="col-md-2">
                                    <label><i class="fa fa-microphone"></i> <spring:message code="label.for.tamada"/></label>
                                </div>
                                <div class="col-md-8">
                                    <p>Требуется Тамада со знанием 3 языков (казахский, русский, английский)
                                        для проведения свадьбы в апреле 2019. Город Темиртау. Опыт работы от 5 лет.
                                        Вежливый, без пошлых приколов и конкурсов.</p>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-sm custom-btn red-btn"><spring:message code="button.respond"/>!</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label><i class="fa fa-glass"></i> <spring:message code="label.for.restaurant.administrator"/></label>
                                </div>
                                <div class="col-md-8">
                                    <p>Требуется Тамада со знанием 3 языков (казахский, русский, английский)
                                        для проведения свадьбы в апреле 2019. Город Темиртау. Опыт работы от 5 лет.
                                        Вежливый, без пошлых приколов и конкурсов.</p>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-sm custom-btn red-btn"><spring:message code="button.respond"/>!</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-3">
            <div class="profile-work">
                <p><spring:message code="for.organizer"/></p>
                <a href="#"><spring:message code="button.edit.toi"/></a><br/>
                <a href="#">Search restaurant for this toi</a><br/>
                <a href="#">Search tamada for this toi</a>
                <a href="#">Add guest list for this toi</a>
                <p><spring:message code="for.performer"/></p>
                <a href="#"><spring:message code="button.edit.toi"/></a><br/>
                <c:if test="${isFavorite}">
                <form:form method="post" action="/user/deleteToiFromFavorites/${toi.id}">
                    <button type="submit" class=""><spring:message
                            code="action.delete.from.favorites"/></button>
                    <br/>
                </form:form>
                </c:if>
                <c:if test="${!isFavorite}">
                    <form:form method="post" action="/user/addToiToFavorites/${toi.id}">
                        <button type="submit" class=""><spring:message
                                code="action.add.to.favorites"/></button>
                        <br/>
                    </form:form>
                </c:if>
                <a href="#">SQL</a><br/>
                <a href="#">Java, Spring framework</a><br/>
                <a href="#">HTML, CSS, JS</a><br/>
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
<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Diploma project</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <!-- for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/home_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container-fluid px-2 py-2">

    <div class="row mt-4 justify-content-center ">

        <div class="col-md-6">
            <h2><spring:message code="app.name"/></h2>
            <h3 class="text-uppercase"><spring:message code="plan.and.organize.your.events.with.pleasure"/></h3>
        </div>

    </div>

    <div class="row mt-4 justify-content-center ">

        <div class="col-md-6">
            <h4><spring:message code="about"/> <spring:message code="app.name"/></h4>
        </div>

    </div>

    <div class="row my-4 justify-content-center">

        <div class="col-md-3">
            <img src="<c:url value="/resources/img/about1.jpg"/>">
        </div>

        <div class="col-md-3">
            <h5 class="mt-3"><spring:message code="organizing.events" /></h5>
            <div class="mt-4">
                <p><spring:message code="create.your.events" /></p>
                <p><spring:message code="find.tamadas" /></p>
                <p><spring:message code="find.restaurants" /></p>
                <p><spring:message code="have.deal.with.them.with.no.problem" /></p>
            </div>
        </div>

    </div>

    <div class="row my-5 justify-content-center">

        <div class="col-md-3">
            <h5 class="mt-3"><spring:message code="platform.for.cooperation" /></h5>
            <div class="mt-4">
                <p><spring:message code="find.customers" /></p>
                <p><spring:message code="offer.cooperation" /></p>
                <p><spring:message code="find.suitable.event.tamada.restaurant" /></p>
            </div>
        </div>

        <div class="col-md-3">
            <img src="<c:url value="/resources/img/about2.jpg"/>">
        </div>

    </div>

    <div class="row my-4 justify-content-center">

        <div class="col-md-3">
            <img src="<c:url value="/resources/img/about3.jpg"/>">
        </div>

        <div class="col-md-3">
            <h5 class="mt-3"><spring:message code="learn.about.organizing" /></h5>
            <div class="mt-4">
                <p><spring:message code="learn.lot.of.useful.information" /></p>
                <p><spring:message code="get.experience.in.organizing" /></p>
                <p><spring:message code="share.useful.information" /></p>
                <p><spring:message code="save.favorite.tamadas.and.restaurants" /></p>
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




<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>

<tag:navbar/>

<div class="container mt-5">

    <c:if test="${empty user and empty creator}">

        <div class="row justify-content-center mt-4">
            <h4 class="page-title"><spring:message code="page.title.restaurant.admin.list"/></h4>
        </div>

    </c:if>

    <c:if test="${empty restauranAdmintList}">
        <div class="row justify-content-center mt-4">
            <div class="my-5">
                <h5><spring:message code="there.is.no.restaurant.admin"/></h5>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty restauranAdmintList}">
        <div class="row justify-content-center mt-4">
            <h5><spring:message code="restaurant.admins.found"/></h5>
        </div>

        <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

        <div class="row mt-3 mb-4" id="cards">

            <c:forEach items="${restauranAdmintList}" var="restauranAdmint">
                <tag:restaurant_admin_card restaurant_admin="${restauranAdmint}" user="${restauranAdmint.user}"/>
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
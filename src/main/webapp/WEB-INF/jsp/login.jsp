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
    <link rel="stylesheet" href="<c:url value="/resources/css/login_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container mt-5">
    <div class="row">

        <div class="col-md-7">
            <h2><spring:message code="title.sign.in"/></h2>
            <h4 class="my-4"><spring:message code="login.rules"/></h4>
            <p><i class="fa fa-check mr-2"></i><spring:message code="login.rules.username.length"/></p>
            <p><i class="fa fa-check mr-2"></i><spring:message code="login.rules.username.first.character"/></p>
            <p><i class="fa fa-check mr-2"></i><spring:message code="login.rules.username.content"/></p>
            <p><i class="fa fa-check mr-2"></i><spring:message code="login.rules.password.length"/></p>
            <p><i class="fa fa-check mr-2"></i><spring:message code="login.rules.password.content"/></p>
        </div>

        <div class="col-md-5">
            <h4 class="mb-4 alarm"><spring:message code="${message}"/></h4>

            <form:form method="post" action="/login" class="needs-validation" novalidate="true">

                <div class="form-row">
                    <div class="col-md-12 mb-3">
                        <label for="username"><spring:message code="label.username"/>:</label>
                        <input class="form-control" type="text"
                               id="username" name="username" placeholder="<spring:message code="placeholder.username"/>"
                               value="" required>
                        <div class="invalid-feedback">
                            USERNAME_ERROR
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-12 mb-3">
                        <label for="password"><spring:message code="label.password"/>:</label>
                        <input class="form-control" type="password"
                               id="password" name="password" placeholder="<spring:message code="placeholder.password"/>"
                               value="" required>
                        <div class="invalid-feedback">
                            PASSWORD_ERROR
                        </div>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="row justify-content-center">
                    <button type="submit" class="btn btn-dark custom-btn dark-btn mt-3"><spring:message code="button.sign.in"/></button>
                </div>
            </form:form>
        </div>

    </div>

    <div class="row justify-content-center mt-4">
        <div>
            <h3><spring:message code="headline.do.not.have.account"/></h3>
            <h4><spring:message code="headline.if.do.not.have.account.register"/></h4>
            <div class="row justify-content-center">
                <a href="/registration" class="btn btn-dark custom-btn dark-btn mt-4"><spring:message code="button.sign.up"/>!</a>
            </div>
        </div>
    </div>
</div>



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
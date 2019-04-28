<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
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

<div class="container px-4 pt-4">

    <div class="row justify-content-center mt-4">
        <h4 class="page-title"><spring:message code="page.title.adding.photo"/></h4>
    </div>

    <div class="row justify-content-center my-3">
        <p class="successColor"><spring:message code="${message}"/></p>
    </div>

    <form:form method="post" action="/user/updateAvatar" class="needs-validation" novalidate="true"
               enctype="multipart/form-data">

        <div class="form-row">

            <div class="col-md-4 mb-3">
                <label for="fileInput"><spring:message code="label.select.file"/></label>
                <input id="fileInput" class="btn custom-btn dark-btn" type="file" name="file" required/>
                <div class="invalid-feedback">
                    FILE_ERROR
                </div>
            </div>

        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="row justify-content-center">
            <button class="btn mt-3 px-5 custom-btn dark-btn " type="submit"><spring:message
                    code="button.save"/></button>
        </div>


    </form:form>

</div>

<tag:footer/>

</body>
</html>

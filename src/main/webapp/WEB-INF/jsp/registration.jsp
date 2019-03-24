<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Spring Boot Test App</title>
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
            <h2><spring:message code="title.sign.up"/></h2>
            <h4 class="my-4">When registrate follow the rules below</h4>
            <p><i class="fa fa-check mr-2"></i>Should select one of user types</p>
            <p><i class="fa fa-check mr-2"></i>LOGIN must be between 3 and 20 characters</p>
            <p><i class="fa fa-check mr-2"></i>LOGIN must begin with a latin character</p>
            <p><i class="fa fa-check mr-2"></i>LOGIN must contain only Latin characters, numbers, "_" and "-"</p>
            <p><i class="fa fa-check mr-2"></i>PASSWORD must be between 6 and 20 characters</p>
            <p><i class="fa fa-check mr-2"></i>PASSWORD must contain only Latin characters and numbers</p>
            <p><i class="fa fa-check mr-2"></i>PASSWORDS must be equal</p>
        </div>

        <div class="col-md-5">
            <h5 class="mb-4 alarm">${message}</h5>

            <form:form method="post" action="/registration" class="needs-validation" novalidate="true">

                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="email">Email:</label>
                        <input class="form-control <c:if test="${not empty emailError}">is-invalid</c:if>" type="email"
                               id="email" name="email" placeholder="enter your email"
                               value="<c:if test="${not empty user}">${user.email}</c:if>" required>
                        <div class="invalid-feedback">
                            <spring:message code="${emailError}"/>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="role">Role:</label>
                        <select class="form-control" name="role"
                                id="role" required>
                            <c:if test="${not empty selectedRole}">
                                <option value="${selectedRole}" selected>${selectedRole}</option>
                            </c:if>
                            <option value="user">User</option>
                            <option value="tamada">Tamada</option>
                            <option value="restaurant">Restaurants admin</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="username">Userame:</label>
                        <input class="form-control <c:if test="${not empty usernameError}">is-invalid</c:if>"
                               type="text"
                               id="username" name="username" placeholder="enter your username"
                               value="<c:if test="${not empty user}">${user.username}</c:if>" required>
                        <div class="invalid-feedback">
                                <spring:message code="${usernameError}"/>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="password">Password:</label>
                        <input class="form-control <c:if test="${not empty passwordError}">is-invalid</c:if>"
                               type="password"
                               id="password" name="password" placeholder="enter your password"
                               value="" required>
                        <div class="invalid-feedback">
                            <spring:message code="${passwordError}"/>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="confirm_password">Confirm password:</label>
                        <input class="form-control <c:if test="${not empty password2Error}">is-invalid</c:if>"
                               type="password"
                               id="confirm_password" name="password2" placeholder="retype password"
                               value="" required>
                        <div class="invalid-feedback">
                            <spring:message code="${password2Error}"/>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="row justify-content-center">
                    <button type="submit" class="btn btn-dark custom-btn dark-btn mt-3">Sign In</button>
                </div>
            </form:form>
        </div>

    </div>

    <div class="row justify-content-center mt-4">
        <div>
            <h3>Don't you have an account?</h3>
            <h4>If for some reason you still don't have an account you can register!</h4>
            <div class="row justify-content-center">
                <a href="/registration" class="btn btn-dark custom-btn dark-btn mt-4">Sign up!</a>
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
<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Spring Boot Test App</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <!-- for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container px-4 pt-4">

    <div class="row justify-content-center mt-4">
        <h4 class="page-title">Additional registration</h4>
    </div>

    <div class="row justify-content-center mt-2">
        <p>You have created your account, but you can also tell us more about yourself!</p>
    </div>

    <div class="row justify-content-center mb-4">
        <p class="hint">You don't have to fill in all fields, just only you would like</p>
    </div>

    <form:form method="post" action="/updateUser" class="needs-validation" novalidate="true">

        <div class="form-row">

            <div class="col-md-4 mb-3">
                <label for="secondName">Second Name</label>
                <input class="form-control" type="text"
                       id="secondName" name="secondName" placeholder="Enter second name"
                       value="">
                <div class="invalid-feedback">
                    SECOND_NAME_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="firstName">First Name</label>
                <input class="form-control" type="text"
                       id="firstName" name="firstName" placeholder="Enter first name"
                       value="">
                <div class="invalid-feedback">
                    FIRST_NAME_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="patronymic">Patronymic</label>
                <input class="form-control" type="text"
                       id="patronymic" name="patronymic" placeholder="Enter patronymic"
                       value="">
                <div class="invalid-feedback">
                    PATRONYMIC_ERROR
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-3 mb-3">
                <label for="birthday">Birthday</label>
                <input class="form-control" type="date"
                       id="birthday" name="birthday" placeholder=""
                       value="" required>
                <div class="invalid-feedback">
                    BIRTHDAY_ERROR
                </div>
            </div>

            <div class="col-md-3 mb-3">
                <label for="city">City/Town</label>
                <select class="form-control" name="city"
                        id="city" required>
                    <option value="">undefined</option>
                    <option value="wedding">Темиртау</option>
                    <option value="anniversary">Караганда</option>
                    <option value="birthday">Астана</option>
                    <option value="jubilee">Алматы</option>
                </select>
                <div class="invalid-feedback">
                    CITY_ERROR
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <label for="address">Address</label>
                <input class="form-control" type="text"
                       id="address" name="address" placeholder="enter address"
                       value="" required>
                <div class="invalid-feedback">
                    ADDRESS_ERROR
                </div>
            </div>

        </div>

        <div class="divider"></div>

        <div class="row justify-content-center mb-1">
            <p>You can also add your contact information</p>
        </div>

        <div class="form-row">

            <div class="col-md-4 mb-3">
                <label for="phoneNumber">Phone</label>
                <input class="form-control" type="tel"
                       id="phoneNumber" name="phone" placeholder="Enter phone number"
                       value="">
                <div class="invalid-feedback">
                    PHONE_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="skype">Skype</label>
                <input class="form-control" type="text"
                       id="skype" name="skype" placeholder="Enter skype"
                       value="">
                <div class="invalid-feedback">
                    SKYPE_ERROR
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-8 mb-3">
                <label for="aboutYourself">About yourself</label>
                <textarea class="form-control" type="textarea" rows="5" minlength="10"
                          id="aboutYourself" name="aboutYourself" placeholder="add some about yourself"
                          value=""></textarea>
                <div class="invalid-feedback">
                    ABOUT_YOURSELF_ERROR
                </div>
            </div>

        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="row justify-content-center">
            <button class="btn mt-3 px-5 custom-btn dark-btn " type="submit">Save</button>
        </div>
    </form:form>

</div>

<tag:footer/>

</body>
</html>

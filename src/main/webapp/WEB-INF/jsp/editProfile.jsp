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
        <h4 class="page-title"><spring:message code="page.title.profile.editing"/></h4>
    </div>

    <div class="row justify-content-center mt-2">
        <p><spring:message code="headline.profile.editing.rule"/></p>
    </div>

    <div class="row justify-content-center mt-1">
        <p class="hint"><spring:message code="headline.profile.editing.required.fields.are.marked"/> <span class="hint-span">*</span></p>
    </div>

    <div class="row justify-content-center my-3">
        <p class="successColor"><spring:message code="${message}"/></p>
    </div>

    <form:form method="post" action="/user/updateUser" class="needs-validation" novalidate="true">

        <div class="form-row">

            <div class="col-md-4 mb-3">
                <label for="secondName"><spring:message code="label.second.name"/></label>
                <input class="form-control" type="text"
                       id="secondName" name="secondName" placeholder="<spring:message code="placeholder.second.name"/>"
                       value="${user.secondName}">
                <div class="invalid-feedback">
                    SECOND_NAME_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="firstName"><spring:message code="label.first.name"/></label>
                <input class="form-control" type="text"
                       id="firstName" name="firstName" placeholder="<spring:message code="placeholder.first.name"/>"
                       value="${user.firstName}">
                <div class="invalid-feedback">
                    FIRST_NAME_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="patronymic"><spring:message code="label.patronymic"/></label>
                <input class="form-control" type="text"
                       id="patronymic" name="patronymic" placeholder="<spring:message code="placeholder.patronymic"/>"
                       value="${user.patronymic}">
                <div class="invalid-feedback">
                    PATRONYMIC_ERROR
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-3 mb-3">
                <label for="birthday"><spring:message code="label.birthday"/></label>
                <input class="form-control <c:if test="${not empty birthdayError}">is-invalid</c:if>" type="date"
                       id="birthday" name="birthday" placeholder=""
                       value="${user.birthday}" required>
                <div class="invalid-feedback">
                    <spring:message code="${birthdayError}"/>
                </div>
            </div>

            <div class="col-md-3 mb-3">
                <label for="city"><spring:message code="label.city"/></label>
                <select class="form-control" name="city"
                        id="city" required>
                    <c:if test="${not empty user.city}">
                        <option value="${user.city}" selected><spring:message code="${user.city}"/></option>
                    </c:if>
                    <option value=""><spring:message code="undefined"/></option>
                    <option value="temirtau"><spring:message code="temirtau"/></option>
                    <option value="karaganda"><spring:message code="karaganda"/></option>
                    <option value="astana"><spring:message code="astana"/></option>
                    <option value="almaty"><spring:message code="almaty"/></option>
                    <option value="nursultan"><spring:message code="nursultan"/></option>
                </select>
                <div class="invalid-feedback">
                    CITY_ERROR
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <label for="address"><spring:message code="label.address"/></label>
                <input class="form-control" type="text"
                       id="address" name="address" placeholder="<spring:message code="placeholder.address"/>"
                       value="${user.address}" required>
                <div class="invalid-feedback">
                    ADDRESS_ERROR
                </div>
            </div>

        </div>

        <div class="divider"></div>

        <div class="row justify-content-center mb-1">
            <p><spring:message code="headline.profile.editing.contact.information"/></p>
        </div>

        <div class="form-row">

            <div class="col-md-4 mb-3">
                <label for="phoneNumber"><spring:message code="label.phone"/></label>
                <input class="form-control" type="tel"
                       id="phoneNumber" name="phone" placeholder="<spring:message code="placeholder.phone"/>"
                       value="${user.phone}">
                <div class="invalid-feedback">
                    PHONE_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="skype"><spring:message code="label.skype"/></label>
                <input class="form-control" type="text"
                       id="skype" name="skype" placeholder="<spring:message code="placeholder.skype"/>"
                       value="${user.skype}">
                <div class="invalid-feedback">
                    SKYPE_ERROR
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="email"><spring:message code="label.email"/></label>
                <input class="form-control <c:if test="${not empty emailError}">is-invalid</c:if>" type="email"
                       id="email" name="email" placeholder="<spring:message code="placeholder.email"/>"
                       value="${user.email}">
                <div class="invalid-feedback">
                    <spring:message code="${emailError}"/>
                </div>
            </div>

        </div>

        <div class="form-row">

            <div class="col-md-8 mb-3">
                <label for="aboutYourself"><spring:message code="label.about.myself"/></label>
                <textarea class="form-control" type="textarea" rows="8" minlength="10"
                          id="aboutYourself" name="aboutMyself" placeholder="<spring:message code="placeholder.about.myself"/>">${user.aboutMyself}</textarea>
                <div class="invalid-feedback">
                    ABOUT_YOURSELF_ERROR
                </div>
            </div>

        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" name="id" value="${user.id}">
        <input type="hidden" name="oldEmail" value="${user.oldEmail}">
        <div class="row justify-content-center">
            <button class="btn mt-3 px-5 custom-btn dark-btn " type="submit"><spring:message code="button.save"/></button>
        </div>
    </form:form>

</div>

<tag:footer/>

</body>
</html>

<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
    <link rel="stylesheet" href="<c:url value="/resources/css/user_page_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container mt-3">
    <div class="container emp-profile">

        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">

                    <img src="/img/unknown_avatar.jpg"
                         alt=""/>

                    <div class="file btn btn-lg btn-primary">
                        Change Photo
                        <input type="file" name="file"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                    <h5>
                        ${user.username}
                    </h5>
                    <h6>
                        ${user.secondName} ${user.firstName} ${user.patronymic}
                    </h6>
                    <p class="proile-rating">RANKING : <span>8/10</span></p>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                               aria-controls="home" aria-selected="true">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contacts-tab" data-toggle="tab" href="#contacts" role="tab"
                               aria-controls="contacts" aria-selected="false">Contacts</a>
                        </li>
                        <c:if test="${isTamadaOrRestaurantAdmin}">
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                   aria-controls="profile" aria-selected="false">Terms of cooperation</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <form action="/user/editProfile" method="get">
                    <input type="submit" class="btn custom-btn dark-btn" name="btnAddMore" value="Edit Profile"/>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-work">
                    <c:if test="${myPage}">
                        <p>WORK LINK</p>
                        <a href="/user/editProfile">Edit Profile</a><br/>
                        <a href="">Settings</a><br/>
                        <a href="">Tois</a><br/>
                        <a href="">Messages</a><br/>
                        <a href="">Favorites</a><br/>
                    </c:if>
                    <c:if test="${!myPage}">
                        <p>SKILLS</p>
                        <a href="">Subscribe</a><br/>
                        <a href="">Unsubscribe</a><br/>
                        <a href="">Write message</a><br/>
                        <a href="">Add to favorites</a><br/>
                    </c:if>
                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-2">
                                <label>Username</label>
                            </div>
                            <div class="col-md-9">
                                <p>${user.username}</p>
                            </div>
                        </div>
                        <c:if test="${(not empty user.secondName) or (not empty user.firstName) or (not empty user.patronymic)}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Full name</label>
                                </div>
                                <div class="col-md-9">
                                    <p><c:if test="${not empty user.secondName}">${user.secondName}</c:if> <c:if
                                            test="${not empty user.firstName}">${user.firstName}</c:if> <c:if
                                            test="${not empty user.patronymic}">${user.patronymic}</c:if></p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty user.birthday}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Birthday</label>
                                </div>
                                <div class="col-md-9">
                                    <p>${user.birthday}</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty user.city}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>City</label>
                                </div>
                                <div class="col-md-9">
                                    <p>${user.city}</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty user.address}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Address</label>
                                </div>
                                <div class="col-md-9">
                                    <p>${user.address}</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty user.aboutMyself}">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="my-4">Your Bio</label><br/>
                                    <p>${user.aboutMyself}</p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="tab-pane fade" id="contacts" role="tabpanel" aria-labelledby="contacts-tab">
                        <div class="row">
                            <div class="col-md-2">
                                <label>E-mail</label>
                            </div>
                            <div class="col-md-6">
                                <p>${user.email}</p>
                            </div>
                        </div>
                        <c:if test="${not empty user.phone}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.phone}</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty user.skype}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Skype</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.skype}</p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Experience</label>
                            </div>
                            <div class="col-md-6">
                                <p>Junior</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Hourly Rate</label>
                            </div>
                            <div class="col-md-6">
                                <p>10$/hr</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Total Projects</label>
                            </div>
                            <div class="col-md-6">
                                <p>2</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>English Level</label>
                            </div>
                            <div class="col-md-6">
                                <p>Intermediate</p>
                            </div>
                        </div>
                    </div>
                </div>
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
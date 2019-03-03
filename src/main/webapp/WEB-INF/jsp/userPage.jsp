<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Spring Boot Test App</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/user_page_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container mt-5">
    <div class="container emp-profile">
        <form method="post">
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
                            Creator of this App and Admin
                        </h6>
                        <p class="proile-rating">RANKING : <span>8/10</span></p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                   aria-controls="home" aria-selected="true">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                   aria-controls="profile" aria-selected="false">Timeline</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                        <p>WORK LINK</p>
                        <a href="">Website Link</a><br/>
                        <a href="">Bootsnipp Profile</a><br/>
                        <a href="">Bootply Profile</a>
                        <p>SKILLS</p>
                        <a href="">Web Designer</a><br/>
                        <a href="">Web Developer</a><br/>
                        <a href="">SQL</a><br/>
                        <a href="">Java, Spring framework</a><br/>
                        <a href="">HTML, CSS, JS</a><br/>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Id</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.id}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Username</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${user.username}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Name</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Erzhan Almasov</p>
                                </div>
                            </div>
                            <c:if test="${not empty user.email}">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Email</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>${user.email}</p>
                                    </div>
                                </div>
                            </c:if>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p>8 (778) 464 7073</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Profession</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Java developer</p>
                                </div>
                            </div>
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
                            <div class="row">
                                <div class="col-md-12 mt-5">
                                    <label>Your Bio</label><br/>
                                    <p>Hello everyone! I'm Erzhan. I'm known as the creator of this web-application.</p>
                                    <p>A luttle bit about myself. I'm a student. Now I study in KSTU. My speciality is a
                                        programmer. I want to became a good professional at the programming. I use the Java
                                        programm language, which I used to create this application.About my Hobbies: I very
                                        like footbal. I support AC Milan football club from Italy,
                                        Milano. Also i like reading. My favourite book is a Game of Thrones. And as you can
                                        guess i like to create websites.
                                        A luttle bit about myself. I'm a student. Now I study in KSTU. My speciality is a
                                        programmer. I want to became a good professional at the programming. I use the Java
                                        programm language, which I used to create this application.About my Hobbies: I very
                                        like footbal. I support AC Milan football club from Italy,
                                        Milano. Also i like reading. My favourite book is a Game of Thrones. And as you can
                                        guess i like to create websites.A luttle bit about myself. I'm a student. Now I
                                        study in KSTU. My speciality is a
                                        programmer. I want to became a good professional at the programming. I use the Java
                                        programm language, which I used to create this application.About my Hobbies: I very
                                        like footbal. I support AC Milan football club from Italy,
                                        Milano. Also i like reading. My favourite book is a Game of Thrones. And as you can
                                        guess i like to create websites.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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
    <link rel="stylesheet" href="<c:url value="/resources/css/create_toi_style.css"/>">
</head>
<body>

<tag:navbar/>

<div class="container px-4 pt-4">

    <div class="row justify-content-center mt-4">
        <h4 class="page-title"><spring:message code="page.title.tamada.reviews"/></h4>
    </div>

    <div class="row justify-content-center mt-2">
        <a href="/user/${tamada.user.id}" class="link-center red-link ml-2 link-big">${tamada.user.username}</a>
    </div>

    <c:if test="${empty reviews}">
        <h5 class="page-title"><spring:message code="there.is.no.review"/></h5>
    </c:if>

    <c:if test="${not empty reviews}">

        <div class="row">

            <div class="container">

                <h2 class="font-weight-light text-center text-lg-left mt-4 mb-0">Reviews</h2>

                <hr class="mt-2 mb-4">

                <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

                <div class="row text-center text-lg-left">

                    <c:forEach items="${reviews}" var="review">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <a href="/user/${review.userId.id}"
                                   class="card-header card-header-white">${review.userId.username}</a>
                                <div class="card-body">
                                    <h6 class="review_date">${review.date}</h6>
                                    <h5 class="card-title">mark: ${review.rating}/10</h5>
                                    <h5 class="card-title">${review.headline}</h5>
                                    <p class="card-text">${review.text}</p>
                                </div>
                                <c:if test="${review.userId.id == authenticatedUserId}">
                                    <div class="card-footer">
                                        <div class="row justify-content-center">
                                            <form:form method="get" action="/tamada/editReview">
                                                <input type="hidden" name="reviewId" value="${review.id}">
                                                <button type="submit" class="btn custmom-btn light-btn">edit</button>
                                            </form:form>

                                            <form:form method="post" action="/tamada/deleteReview">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="hidden" name="reviewId" value="${review.id}">
                                                <button type="submit" class="btn custmom-btn red-btn ml-5">delete
                                                </button>
                                            </form:form>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

            </div>
            <!-- /.container -->
        </div>

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

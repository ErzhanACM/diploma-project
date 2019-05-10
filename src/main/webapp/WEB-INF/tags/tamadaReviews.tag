<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="tamada" required="true" type="kz.kstu.almasov.diplomaproject.entity.user.Tamada" %>
<%@ attribute name="reviews" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="row">

    <div class="container">

        <h2 class="font-weight-light text-center text-lg-left mt-4 mb-0">Reviews</h2>

        <hr class="mt-2 mb-4">

        <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

        <div class="row text-center text-lg-left">

            <c:forEach items="${reviews}" var="review">
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <h5 class="card-header card-header-white">${review.userId.username}</h5>
                        <div class="card-body">
                            <h5 class="card-title">mark: ${review.rating}/10</h5>
                            <h5 class="card-title">${review.headline}</h5>
                            <p class="card-text">${review.text}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <tag:pagination url="${url}" page="${page}" body="${body}" querySymbol="${querySymbol}"/>

    </div>
    <!-- /.container -->
</div>
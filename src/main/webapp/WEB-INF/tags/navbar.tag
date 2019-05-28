<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark pl-4">
    <a class="navbar-brand mr-3 logo_nuvbar" href="/"><img class="img"
                                                           src="<c:url value="/resources/img/logo_nuvbar.png"/>"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto">

            <security:authorize access="isAuthenticated()">

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.toi"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="/toi/createToi"><spring:message
                                code="navbar.item.toi.create"/></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/toi/toiList"><spring:message code="navbar.item.toi.list"/></a>
                        <a class="dropdown-item" href="/toi/favoriteToisOfUser"><spring:message
                                code="navbar.item.favorites.tois.list"/> <span
                                class="nav-item-span update"><spring:message code="update"/> !</span></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item"
                           href="/toi/toiListOfUser?user=<security:authentication property="principal.id"/>">
                            <spring:message code="navbar.item.toi.my.tois"/> </a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.tamada"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="/tamada/tamadaList"><spring:message
                                code="navbar.item.tamada.list"/></a>
                        <a class="dropdown-item" href="/tamada/favoriteTamadasOfUser"><spring:message
                                code="navbar.item.favorites.tamada.list"/> <span
                                class="nav-item-span update"><spring:message code="update"/> !</span></a>
                        <security:authorize access="hasAuthority('TAMADA')">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item"
                               href="/tamada/reviewList/<security:authentication property="principal.id"/>"><spring:message
                                    code="navbar.item.tamada.reviews"/></a>
                        </security:authorize>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.restaurant"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="/restaurant/restaurantList"><spring:message
                                code="navbar.item.restaurant.list"/></a>
                        <a class="dropdown-item" href="/restaurant/restaurantAdminList"><spring:message
                                code="navbar.item.restaurant.admin.list"/></a>
                        <a class="dropdown-item" href="/restaurant/favoriteRestaurantOfUser"><spring:message
                                code="navbar.item.favorites.restaurant.list"/> <span
                                class="nav-item-span update"><spring:message code="update"/> !</span></a>
                        <security:authorize access="hasAnyAuthority('ADMIN', 'RESTAURANT')">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/restaurant/registrate"><spring:message
                                    code="navbar.item.restaurant.registrate"/></a>
                            <a class="dropdown-item"
                               href="/restaurant/restaurantListOfUser?user=<security:authentication property="principal.id"/>"><spring:message
                                    code="navbar.item.my.restaurants"/></a>
                        </security:authorize>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.guest.list"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.create.guest.list"/></a>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.my.guest.lists"/></a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.additional.information"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.guide"/> <span
                                class="nav-item-span new"><spring:message code="new"/> !</span></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.articles"/></a>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.add.article"/></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.about.us"/></a>
                    </div>
                </li>

                <security:authorize access="hasAuthority('ADMIN')">
                    <li class="nav-item dropdown mx-1">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="true"
                           aria-expanded="false"><spring:message code="navbar.item.admin"/></a>
                        <div class="dropdown-menu dropdown-menu-dark">
                            <a class="dropdown-item" href="/user/userList"><spring:message
                                    code="navbar.item.admin.user.list"/></a>
                            <a class="dropdown-item" href="#"><spring:message
                                    code="navbar.item.admin.articles.for.publish"/></a>
                        </div>
                    </li>
                </security:authorize>

            </security:authorize>

        </ul>

        <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown mx-1">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="true"
                   aria-expanded="false"><spring:message code="language"/></a>
                <div class="dropdown-menu dropdown-menu-dark">
                    <a class="dropdown-item" href="?lang=en"><spring:message code="english"/></a>
                    <a class="dropdown-item" href="?lang=ru"><spring:message code="russian"/></a>
                    <a class="dropdown-item" href="?lang=kz"><spring:message code="kazakh"/></a>
                </div>
            </li>

            <security:authorize access="isAuthenticated()">

                <li class="nav-item  mr-3">
                    <a class="nav-link" href="/user/<security:authentication property="principal.id" />"><i
                            class="fa fa-user-circle"></i> <spring:message code="navbar.item.my.page"/></a>
                </li>

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn nuv-btn-sign-out" type="submit"><spring:message
                                    code="button.sign.out"/> <i
                                    class="fa fa-sign-out"></i></button>
                        </form>
                    </div>
                </li>

            </security:authorize>

            <security:authorize access="!isAuthenticated()">

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/login" method="get">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn nuv-btn-sign-in" type="submit"><spring:message
                                    code="button.sign.in"/> <i
                                    class="fa fa-sign-in"></i></button>
                        </form>
                    </div>
                </li>

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/registration" method="get">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn" type="submit"><spring:message
                                    code="button.sign.up"/> <i
                                    class="fa fa-user-plus"></i></button>
                        </form>
                    </div>
                </li>

            </security:authorize>

        </ul>

    </div>

</nav>
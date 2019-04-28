<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav class="navbar navbar-expand-lg navbar-dark pl-4">
    <a class="navbar-brand mr-3" href="/">Spring Boot App</a>
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
                        <a class="dropdown-item" href="/toi/createToi"><spring:message code="navbar.item.toi.create"/></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/toi/toiList"><spring:message code="navbar.item.toi.list"/></a>
                        <a class="dropdown-item" href="/toi/toiList/<security:authentication property="principal.id"/>"><spring:message code="navbar.item.toi.my.tois"/> </a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.restaurant"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.restaurant.list"/></a>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.favorites.restaurant.list"/></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.my.restaurants"/></a>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.restaurant.registrate"/></a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.tamada"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.tamada.list"/></a>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.favorites.tamada.list"/> <span
                                class="nav-item-span update">update !</span></a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.guest.list"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.create.guest.list"/></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.my.guest.lists"/></a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="navbar.item.additional.information"/></a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.guide"/></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><spring:message code="navbar.item.articles"/></a>
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
                            <a class="dropdown-item" href="/user/userList"><spring:message code="navbar.item.admin.user.list"/></a>
                            <a class="dropdown-item" href="#"><spring:message code="navbar.item.admin.add.article"/></a>
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
                    <a class="nav-link" href="/user/<security:authentication property="principal.id" />"><i class="fa fa-user-circle"></i> <spring:message code="navbar.item.my.page"/></a>
                </li>

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn nuv-btn-sign-out" type="submit"><spring:message code="button.sign.out"/> <i
                                    class="fa fa-sign-out"></i></button>
                        </form>
                    </div>
                </li>

            </security:authorize>

            <security:authorize access="!isAuthenticated()">

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/login" method="get">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn nuv-btn-sign-in" type="submit"><spring:message code="button.sign.in"/> <i
                                    class="fa fa-sign-in"></i></button>
                        </form>
                    </div>
                </li>

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/registration" method="get">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn" type="submit"><spring:message code="button.sign.up"/> <i
                                    class="fa fa-user-plus"></i></button>
                        </form>
                    </div>
                </li>

            </security:authorize>

        </ul>

    </div>

</nav>
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
                       aria-expanded="false">Toi</a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="/toi/createToi">Create toi</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/toi/toiList">Toi List</a>
                        <a class="dropdown-item" href="#">My Tois</a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">Restaurant</a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#">Restaurant List</a>
                        <a class="dropdown-item" href="#">Some option</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Registrate restaurant</a>
                    </div>
                </li>

                <li class="nav-item dropdown mx-1">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">Tamada</a>
                    <div class="dropdown-menu dropdown-menu-dark">
                        <a class="dropdown-item" href="#">Tamada List</a>
                        <a class="dropdown-item" href="#">Some new option<span
                                class="nav-item-span new">new !</span></a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Some another option <span
                                class="nav-item-span update">update !</span></a>
                    </div>
                </li>

                <security:authorize access="hasAuthority('ADMIN')">
                    <li class="nav-item dropdown mx-1">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="true"
                           aria-expanded="false">Admin</a>
                        <div class="dropdown-menu dropdown-menu-dark">
                            <a class="dropdown-item" href="/user/userList">User List</a>
                        </div>
                    </li>
                </security:authorize>

            </security:authorize>

        </ul>

        <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown mx-1">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="true"
                   aria-expanded="false">Language</a>
                <div class="dropdown-menu dropdown-menu-dark">
                    <a class="dropdown-item" href="?lang=en"><spring:message code="app.lang.english"/></a>
                    <a class="dropdown-item" href="?lang=ru"><spring:message code="app.lang.russian"/></a>
                    <a class="dropdown-item" href="?lang=kz"><spring:message code="app.lang.kazakh"/></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Registrate restaurant</a>
                </div>
            </li>

            <security:authorize access="isAuthenticated()">

                <li class="nav-item  mr-3">
                    <a class="nav-link" href="/user/<security:authentication property="principal.id" />"><i class="fa fa-user-circle"></i> My page</a>
                </li>

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn nuv-btn-sign-out" type="submit">Sign Out <i
                                    class="fa fa-sign-out"></i></button>
                        </form>
                    </div>
                </li>

            </security:authorize>

            <security:authorize access="!isAuthenticated()">

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/login" method="get">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn nuv-btn-sign-in" type="submit">Sign In <i
                                    class="fa fa-sign-in"></i></button>
                        </form>
                    </div>
                </li>

                <li class="nav-item">
                    <div class="mt-1">
                        <form class="form-inline" action="/registration" method="get">
                            <button class="btn btn-sm px-2 mr-4 nuv-btn" type="submit">Sign Up <i
                                    class="fa fa-user-plus"></i></button>
                        </form>
                    </div>
                </li>

            </security:authorize>

        </ul>

    </div>

</nav>
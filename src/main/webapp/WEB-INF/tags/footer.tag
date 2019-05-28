<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- Footer -->
<footer class="page-footer font-small stylish-color-dark mt-5 pt-4">

    <!-- Footer Links -->
    <div class="container text-center text-md-left">

        <!-- Grid row -->
        <div class="row">

            <!-- Grid column -->
            <div class="col-md-8 mx-auto">

                <!-- Content -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4"><spring:message code="app.name"/></h5>
                <p><spring:message code="app.name"/> <spring:message code="footer.p.first" /></p>
                <p><spring:message code="app.name"/> <spring:message code="footer.p.second" /></p>
                <p><spring:message code="app.name"/> <spring:message code="footer.p.third" /></p>

            </div>
            <!-- Grid column -->

            <security:authorize access="isAuthenticated()">

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-2 mx-auto">

                    <!-- Links -->
                    <h5 class="font-weight-bold text-uppercase my-3"><spring:message code="footer.for.users" /></h5>

                    <ul class="list-unstyled text-center">
                        <li>
                            <a href="/user/<security:authentication property="principal.id" />"><spring:message code="footer.button.my.page" /></a>
                        </li>
                        <li>
                            <a href="/user/editProfile"><spring:message code="footer.button.edit.profile" /></a>
                        </li>
                        <li>
                            <a href="/toi/createToi"><spring:message code="footer.button.create.toi" /></a>
                        </li>
                        <li>
                            <a href="/toi/toiListOfUser?user=<security:authentication property="principal.id"/>"><spring:message code="footer.button.my.tois" /></a>
                        </li>
                        <li>
                            <a href="#"><spring:message code="footer.button.help" /></a>
                        </li>
                    </ul>

                </div>
                <!-- Grid column -->

                <security:authorize access="hasAuthority('RESTAURANT')">

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-2 mx-auto">

                        <!-- Links -->
                        <h5 class="font-weight-bold text-uppercase my-3"><spring:message code="footer.for.restaurant.administrators" /></h5>

                        <ul class="list-unstyled text-center">
                            <li>
                                <a href="/restaurant/registrate"><spring:message code="footer.button.register.restaurant" /></a>
                            </li>
                            <li>
                                <a href="/restaurant/restaurantListOfUser?user=<security:authentication property="principal.id"/>"><spring:message code="footer.button.my.restaurants" /></a>
                            </li>
                        </ul>

                    </div>

                </security:authorize>
                <!-- Grid column -->

                <security:authorize access="hasAuthority('TAMADA')">

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-2 mx-auto">

                        <!-- Links -->
                        <h5 class="font-weight-bold text-uppercase my-3"><spring:message code="footer.for.tamada" /></h5>

                        <ul class="list-unstyled text-center">
                            <li>
                                <a href="/user/editProfile"><spring:message code="footer.button.edit.profile" /></a>
                            </li>
                            <li>
                                <a href="/toi/createToi"><spring:message code="footer.button.create.toi" /></a>
                            </li>
                        </ul>

                    </div>

                </security:authorize>
                <!-- Grid column -->

            </security:authorize>

        </div>
        <!-- Grid row -->

    </div>
    <!-- Footer Links -->

    <hr>

    <security:authorize access="!isAuthenticated()">
        <ul class="list-unstyled list-inline text-center py-2">
            <li class="list-inline-item">
                <h5 class="mb-1">Register for free</h5>
            </li>
            <li class="list-inline-item">
                <a href="/registration" class="btn custom-btn light-btn btn-rounded">Sign up!</a>
            </li>
        </ul>

        <hr>
    </security:authorize>

    <!-- Social buttons -->
    <ul class="list-unstyled list-inline text-center">
        <li class="list-inline-item">
            <a class="btn-social btn-floating btn-fb btn-lg custom-btn dark-btn" href="https://www.facebook.com"
               target="_blank">
                <i class="fa fa-facebook"> </i>
            </a>
        </li>
        <li class="list-inline-item">
            <a class="btn-floating btn-tw btn-lg custom-btn dark-btn" href="https://twitter.com/?lang=ru"
               target="_blank">
                <i class="fa fa-twitter"> </i>
            </a>
        </li>
        <li class="list-inline-item">
            <a class="btn-floating btn-tw btn-lg custom-btn dark-btn" href="https://www.instagram.com/erzhanacm/?hl=ru"
               target="_blank">
                <i class="fa fa-instagram"></i>
            </a>
        </li>
        <li class="list-inline-item">
            <a class="btn-floating btn-vk btn-lg custom-btn dark-btn" href="https://vk.com/ae_acm" target="_blank">
                <i class="fa fa-vk"></i>
            </a>
        </li>
    </ul>
    <!-- Social buttons -->

    <!-- Copyright -->
    <div class="footer-copyright text-center pb-5">© 2018 Copyright:
        <a href="/"> <spring:message code="app.name"/>.com</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
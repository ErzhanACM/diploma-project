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
            <div class="col-md-5 mx-auto">

                <!-- Content -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4"><spring:message code="app.name"/></h5>
                <p class="text-justify"><spring:message code="app.name"/> is the organization of events with pleasure</p>
                <p class="text-justify"><spring:message code="app.name"/> is a platform for collaboration, job searching</p>
                <p class="text-justify"><spring:message code="app.name"/> is a collection of all the useful information about planning
                    and organizing events</p>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase my-3">For users</h5>

                <ul class="list-unstyled text-center">
                    <li>
                        <a href="#">My page</a>
                    </li>
                    <li>
                        <a href="#">Edit profile</a>
                    </li>
                    <li>
                        <a href="#">Create Toi</a>
                    </li>
                    <li>
                        <a href="#">My Tois</a>
                    </li>
                    <li>
                        <a href="#">Help</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase my-3">For Resrtaurant Administrators</h5>

                <ul class="list-unstyled text-center">
                    <li>
                        <a href="#">Register restaurant</a>
                    </li>
                    <li>
                        <a href="#">My restaurants</a>
                    </li>
                    <li>
                        <a href="#">Find toi</a>
                    </li>
                    <li>
                        <a href="#">Help</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase my-3">For Tamadas</h5>

                <ul class="list-unstyled text-center">
                    <li>
                        <a href="#">Reviews</a>
                    </li>
                    <li>
                        <a href="#">Find toi</a>
                    </li>
                    <li>
                        <a href="#">Help</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

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
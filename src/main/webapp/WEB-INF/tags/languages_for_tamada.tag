<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ attribute name="tamada_languages" required="true" type="java.util.List" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="form-row">

    <div class="col mb-3">
        <label><spring:message code="label.language.proficiency"/></label>
        <br>
        <label class="checkbox-inline">
            <input class="pr-3" type="checkbox" name="english" value="" <c:if test="${tamada_languages.contains('english')}">checked</c:if>><spring:message code="english"/>
        </label>
        <label class="checkbox-inline">
            <input class="ml-2 pr-3" type="checkbox" name="russian" value="" <c:if test="${tamada_languages.contains('russian')}">checked</c:if>><spring:message code="russian"/>
        </label>
        <label class="checkbox-inline">
            <input class="ml-2 pr-3" type="checkbox" name="kazakh" value="" <c:if test="${tamada_languages.contains('kazakh')}">checked</c:if>><spring:message code="kazakh"/>
        </label>
        <label class="checkbox-inline">
            <input class="ml-2 pr-3" type="checkbox" name="french" value="" <c:if test="${tamada_languages.contains('french')}">checked</c:if>><spring:message code="french"/>
        </label>
        <label class="checkbox-inline">
            <input class="ml-2 pr-3" type="checkbox" name="italian" value="" <c:if test="${tamada_languages.contains('italian')}">checked</c:if>><spring:message code="italian"/>
        </label>
        <label class="checkbox-inline">
            <input class="ml-2 pr-3" type="checkbox" name="turkish" value="" <c:if test="${tamada_languages.contains('turkish')}">checked</c:if>><spring:message code="turkish"/>
        </label>
        <label class="checkbox-inline">
            <input class="ml-2 pr-3" type="checkbox" name="german" value="" <c:if test="${tamada_languages.contains('german')}">checked</c:if>><spring:message code="german"/>
        </label>


        <div class="invalid-feedback">
            SERVICES_PRICE_ERROR
        </div>
    </div>



</div>
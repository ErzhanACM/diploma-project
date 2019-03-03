<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tag:navbar/>

<form action="/user/userList" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Username: </label>
        <div class="col-sm-4">
            <input type="text" required name="username" placeholder="enter user's username" class="form-control"
                   value="${user.username}"/>
        </div>
    </div>

    <!--
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Roles: </label>
        <div class="col-sm-4">
            <#list roles as role>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="${role}"
                        ${user.roles?seq_contains(role)?string("checked", "")}>
                    <label class="form-check-label">
                    ${role}
                    </label>
                </div>
            </#list>
        </div>
    </div>
    -->

    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-dark btn-sm">Save</button>
</form>

<tag:footer/>
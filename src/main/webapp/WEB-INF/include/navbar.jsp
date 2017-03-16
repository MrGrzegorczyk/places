<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url value="/users" var="usersURL"/>
<c:url value="/create-user" var="createUserURL"/>
<c:url value="/logout" var="logoutURL"/>
<c:url value="/login" var="loginURL"/>
<c:url value="/register" var="registerURL"/>
<c:url value="/places" var="myPlacesUrl"/>
<c:url value="/place/create" var="createPlaceUrl"/>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">Places</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                Places <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a href="${createPlaceUrl}"><i class="fa fa-plus fa-fw"></i> New place</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${myPlacesUrl}"><i class="fa fa-list fa-fw"></i> My places</a>
                </li>
            </ul>
        </li>

        <sec:authorize access="hasRole('ADMIN')">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                Admin <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a href="${createUserURL}"><i class="fa fa-plus fa-fw"></i> Create user</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${usersURL}"><i class="fa fa-list fa-fw"></i> Show users</a>
                </li>
            </ul>
        </li>
        </sec:authorize>

        <c:if test="${not empty principal}">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <sec:authentication property="principal.username"/> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a href="${logoutURL}">Logout</a>
                </li>
            </ul>
        </li>
        </c:if>
        <c:if test="${empty principal}">
            <li><a href="${loginURL}">Sign In</a></li>
            <li><a href="${registerURL}">Sign Up</a></li>
        </c:if>

    </ul>
    <!-- /.navbar-top-links -->
</nav>
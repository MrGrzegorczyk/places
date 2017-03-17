<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ include file="/WEB-INF/include/navbar.jsp" %>

<c:url value="/create-user" var="createUserURL"/>

<div class="container">

    <div class="row">
        <div class="col-lg-12">
						<c:if test="${user.id == null}">
						      <h1 class="page-header">Create user</h1>
						</c:if>
						
						<c:if test="${user.id != null}">
						    <h1 class="page-header">Edit user</h1>
						</c:if>
        </div>
    </div>

    <div class="row">
        <form action="${createUserURL}" method="post" role="form" class="form-horizontal">
            <input type="hidden" value="${user.id}" name="id"/>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="firstName">Login:</label>
                <div class="col-sm-6">
                    <input value="${user.login}" name="login" type="text" class="form-control" placeholder="Enter login" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="firstName">First name:</label>
                <div class="col-sm-6">
                    <input value="${user.firstName}" name="firstName" type="text" class="form-control" placeholder="Enter first name" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="lastName">Last name:</label>
                <div class="col-sm-6">
                    <input value="${user.lastName}" name="lastName" type="text" id="lastName" class="form-control" placeholder="Enter last name">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-6">
                    <input value="${user.email}" name="email" type="email" id="email" class="form-control" placeholder="Enter email">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="password">Password:</label>
                <div class="col-sm-6">
                    <input value="${user.password}" name="password" type="password" id="password" class="form-control" placeholder="Enter password">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="/" class="btn btn-danger">Cancel</a>
                </div>
            </div>

        </form>
    </div>

</div>

<%@ include file="/WEB-INF/include/scripts.jsp" %>

<%@ include file="/WEB-INF/include/footer.jsp" %>
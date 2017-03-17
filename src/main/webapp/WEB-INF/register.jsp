<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>

<c:url value="/register" var="registerURL"/>
<c:url value="/login" var="loginURL"/>

<div class="container">

    <c:if test="${param.error != null}">
        <div class="alert alert-danger fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <p>Unable to register - error occured</p>
        </div>
    </c:if>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign Up</h3>
                </div>
                <div class="panel-body">
                    <form action="${registerURL}" method="post" role="form">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Login" name="login" type="text" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="First name" name="firstName" type="text" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Last name" name="lastName" type="text" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="E-mail" name="email" type="email" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" value="" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Repeat password" name="repeatedPassword" type="password" value="" required>
                            </div>
                            <button class="btn btn-lg btn-success btn-block" type="submit">Create</button>
                        </fieldset>
                    </form>
                    <div class="margin-bottom-10">
                        Already a member? <a href="${loginURL}" class="register">Sign In</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/include/scripts.jsp" %>
<%@ include file="/WEB-INF/include/footer.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>

<c:url value="/login" var="loginURL"/>
<c:url value="/register" var="registerURL"/>


<div class="container">

    <c:if test="${param.logout != null}">
        <div class="alert alert-success fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <p>You've logged out</p>
        </div>
    </c:if>

    <c:if test="${param.register != null}">
        <div class="alert alert-info fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <p>Register successful. You can log in now</p>
        </div>
    </c:if>

    <c:if test="${param.error != null}">
        <div class="alert alert-danger fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <p>Username or password is incorrect</p>
        </div>
    </c:if>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form action="${loginURL}" method="post" role="form">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="E-mail" name="email" type="email" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" value="" required>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>
                            <button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
                        </fieldset>
                    </form>
                    <div class="margin-bottom-10">
						            Don't have an account? <a href="${registerURL}" class="register">Create account</a>
						        </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/include/scripts.jsp" %>
<%@ include file="/WEB-INF/include/footer.jsp" %>
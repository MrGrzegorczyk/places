<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ include file="/WEB-INF/include/navbar.jsp" %>

<c:url value="/users/delete" var="deleteUserURL"/>
<c:url value="/users/edit" var="editUserURL"/>

<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">List of users</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-hover table-bordered">
                <thead>
                <tr>
                    <th class="text-center col-md-1">Id</th>
                    <th class="text-center">Login</th>
                    <th class="text-center">First Name</th>
                    <th class="text-center">Last Name</th>
                    <th class="text-center">Email</th>
                    <th class="text-center col-md-1">Edit</th>
                    <th class="text-center col-md-1">Delete</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${usersList}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td class="text-center">${user.login}</td>
                        <td class="text-center">${user.firstName}</td>
                        <td class="text-center">${user.lastName}</td>
                        <td class="text-center">${user.email}</td>
                        <td class="text-center"> <a href="${editUserURL}/${user.id}" class="btn btn-primary">Edit</a> </td>
                        <td class="text-center"> <a href="${deleteUserURL}/${user.id}" class="btn btn-danger">Delete</a> </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

<%@ include file="/WEB-INF/include/scripts.jsp" %>

<%@ include file="/WEB-INF/include/footer.jsp" %>


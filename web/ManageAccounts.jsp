<%-- 
    Document   : ManageAccounts
    Created on : Mar 1, 2022, 3:45:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"></c:import>
            <form action="mainController" method="post" class="formsearch">
                <input type="text" name="txtSearch" value="<%= (request.getParameter("txtSearch")==null)?"":request.getParameter("txtSearch")%>">
                <input type="submit" value="searchAccounts" name="action">
            </form>
            <h1></h1>
            <table class="order">
                <tr><th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Status</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            <c:forEach var="acc" items="${requestScope.accountList}">
                <tr><td><c:out value="${acc.getAccID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>  
                    <td><c:out value="${acc.getFullName()}"></c:out></td>
                    <td><c:choose>
                            <c:when test="${acc.getStatus() eq 1}">active</c:when>
                            <c:otherwise>inActive</c:otherwise>
                        </c:choose>   
                    </td>
                    <td><c:out value="${acc.getPhone()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getRole() eq 1}">admin</c:when>
                            <c:otherwise>user</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:if test="${acc.getRole() eq 0}"><!-- only block/unblock account of the user -->
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param> 
                            </c:url>
                            <a href="${mylink}">Block/UnBlock</a>
                        </c:if></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

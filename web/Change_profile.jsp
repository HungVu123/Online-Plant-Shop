<%-- 
    Document   : Change_profile
    Created on : Mar 6, 2022, 3:11:57 AM
    Author     : Admin
--%>

<%@page import="hung.dao.AccountDao"%>
<%@page import="hung.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <p></p>
<header>
            <%@include file="header.jsp" %>
        </header>  
        <section>
            <h3>Update Your Profile</h3>
            <form action="mainController" method="post">
                <div class="mb-3" >
                    <label for="formGroupExampleInput" class="form-label" >Full Name</label>
                    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Input Full Name" name="txtnewfullname" required="" value="<%= (request.getAttribute("txtnewfullname")==null)?"":request.getAttribute("txtnewfullname") %>" >
                </div>
                <div class="mb-3">
                    <label for="formGroupExampleInput2" class="form-label" >Phone</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Input Phone" name="txtnewphone" required="" value="<%= (request.getAttribute("txtnewphone") == null) ? "" : request.getAttribute("txtnewphone")%>"><%= (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%>
                </div>
                 <input type="submit" class="btn btn-primary" value="change" name="action">
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>

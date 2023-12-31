<%@ page import="vn.edu.iuh.fit.models.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.models.Role" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ListRoleAccount</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%
    Account acc = (Account) session.getAttribute("accountLogin");
    List<Role> listRole = (List<Role>) session.getAttribute("listRole");
    String grant_accessLogin = session.getAttribute("grant_accessLogin").toString();
%>
<h3 style="font-family: SansSerif,sans-serif; margin: 0 auto">Welcome: <%= acc.getFull_name() %> </h3>
<!-- Menu -->
<div class="menu">
    <ul>
        <li><a href="login?action=info">Information Account</a></li>
        <li><a href="insert_account.jsp">Add account</a></li>
        <% if(grant_accessLogin.equals("admin")){%>
            <li><a href="login?action=listAllAccount">List Account</a></li>
        <%}%>
        <li><a href="index.jsp">Log out</a></li>
    </ul>
</div>
<!-- Nội dung chính -->
<div class="container-dashboard">
    <h1>List Role Of Your Account</h1>
    <table>
        <thead>
        <tr>
            <th>Role ID</th>
            <th> Name </th>
            <th>Description</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(Role r : listRole){
        %>
        <tr>
            <td><%=r.getRole_id()%></td>
            <td><%=r.getRole_name()%></td>
            <td><%=r.getDescription()%></td>
            <td><%=r.getStatus()%></td>
        </tr>
        <%}%>

        </tbody>
    </table>
</div>
</body>
</html>

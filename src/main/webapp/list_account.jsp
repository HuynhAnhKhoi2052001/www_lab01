<%@ page import="vn.edu.iuh.fit.models.Account" %>
<%@ page import="vn.edu.iuh.fit.models.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.repositories.GrantAccessRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>ListGrantAccount</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <%
            Account acc = (Account) session.getAttribute("accountLogin");
            List<Account> listAccount = (List<Account>) session.getAttribute("listAccount");
            String grant_accessLogin = session.getAttribute("grant_accessLogin").toString();
        %>
        <h3 style="font-family: SansSerif,sans-serif; margin: 0 auto">Welcome: <%= acc.getFull_name() %> </h3>
        <!-- Menu -->
        <div class="menu">
            <ul>
                <li><a href="login?action=info">Information Account</a></li>
                <li><a href="insert_account.jsp">Add account</a></li>
                <li><a href="login?action=listRole">List role</a></li>
                <li><a href="index.jsp">Log out</a></li>
            </ul>
        </div>
        <!-- Nội dung chính -->
        <div class="container-dashboard">
            <h1>Manage All Account</h1>
            <table>
                <thead>

                <tr>
                    <th>ID</th>
                    <th>Full Name </th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Role</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(Account account : listAccount){
                %>
                <tr>
                    <% GrantAccessRepository grantAccessRepository= new GrantAccessRepository();
                        String roleacc = grantAccessRepository.getRoleOfGrantAccessLoginById(account.getAccount_id()) ;%>
                    <td><%=account.getAccount_id()%></td>
                    <td><%=account.getFull_name()%></td>
                    <td><%=account.getEmail()%></td>
                    <td><%=account.getPassword()%></td>
                    <td><%=account.getPhone()%></td>
                    <td><%=account.getStatus()%></td>
                    <td><%=roleacc%></td>
                    <td><a href="login?action=delete&id=<%=account.getAccount_id()%>">delete</a></td>
                    <td><a href="login?action=update&id=<%=account.getAccount_id()%>">update</a></td>
                    <td><a href="login?action=grantAccess&id=<%=account.getAccount_id()%>">access</a></td>
                </tr>
                <%}%>

                </tbody>
            </table>
        </div>
    </body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: vyosiki
  Date: 11/23/16
  Time: 3:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Current Project</title>
    <style>
        div{
            height: 300px;
            width: 800px;
            align-items: center;
            background: #cdf;
            margin-left: 420px;
            margin-top: 120px;
            padding: 12px;
        }
    </style>
</head>

<body>
<div>

<!--${allProjects.name}  ${allProjects.dueDate}  ${allProjects.description}-->
<table  border="1">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Due </th>
    </tr>
    <g:each in="${allProjects}" status="i" var="thisProject">
        <tr>
            <td>${thisProject.name}</td>
            <td>${thisProject.description}</td>
            <td>${thisProject.dueDate} </td>
        </tr>
    </g:each>


</table>

   <!-- <g:form>
        Project : <input type="text" size="40" name="project" value="${project}"/>
        <p> Due Date: <input type="text" name="date" value="${date}"/></p>
    </g:form> -->

</div>

</body>
</html>
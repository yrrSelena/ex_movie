<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <strong> welcome,${sessionScope.user.username}! </strong>

    <form action="${APP_PATH}/logout">
        <button type="submit">登出</button>
    </form>
</div>
</body>
</html>

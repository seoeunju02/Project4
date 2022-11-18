<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Post </h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
<table>
    <tr><td>Userid:</td><td><input type="text" name="userid"/></td></tr>
    <tr><td>Username:</td><td><input type="text" name="username"/></td></tr>
    <tr><td>Major:</td><td><input type="text" name="major"/></td></tr>
    <tr><td>Email:</td><td><input type="text" name="email"/></td></tr>
    <tr><td>PhoneNumber:</td><td><input type="text" name="phoneNumber"/></td></tr>
    <tr><td>Photo:</td><td><input type="file" name="photo"/></td></tr>
    <tr><td>RC:</td><td><input type="text" name="detail"/></td></tr>
<tr><td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
</table>
</form>

</body>
</html>mmp
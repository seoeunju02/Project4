<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.example.demo.dao.MemberDAO, com.example.demo.bean.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
</head>
<body>

<%
	//	MemberDAO boardDAO = new MemberDAO();
//	String id=request.getParameter("id");
//	MemberVO u=boardDAO.getOne(Integer.parseInt(id));

//	MemberDAO memberDAO = new MemberDAO();
//	String id=request.getParameter("id");
//	MemberVO u=memberDAO.getOne(Integer.parseInt(id));
//	request.setAttribute("vo",u);

//	MemberDAO memberDAO = new MemberDAO();
//	String id=request.getParameter("id");
//	MemberVO u = memberDAO.getOne(Integer.parseInt(id));
//	request.setAttribute("u", u);

	MemberDAO memberDAO = new MemberDAO();
	String id = request.getParameter("id");
	System.out.println((id));
	MemberVO u = memberDAO.getOne(Integer.parseInt(id));
	request.setAttribute("u", u);
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
	<table>
		<br><c:if test="${u.getPhoto() ne ''}"><br/><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo"></c:if>
		<tr><td>Userid:</td><td><input type="text" name="userid" value="<%= u.getUserid()%>"/></td></tr>
		<tr><td>Username:</td><td><input type="text" name="username" value="<%= u.getUsername()%>" /></td></tr>
		<tr><td>Major:</td><td><input type="text" name="major"value="<%= u.getMajor()%>"/></td></tr>
		<tr><td>Email:</td><td><input type="text" name="email" value="<%= u.getEmail()%>"/></td></tr>
		<tr><td>PhoneNumber:</td><td><input type="text" name="phoneNumber" value="<%= u.getPhoneNumber()%>"/></td></tr>
		<tr><td>Photo:</td><td><input file="text" name="photo" value="<%= u.getPhoto()%>"/></td></tr>
		        <tr><td><input type="file" name="photo" value="${vo.getPhoto()}" /></td></tr>
<%--		        <c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${u.getPhoto}"></c:if></td></tr>--%>
<%--		<c:if test="${u.getPhoto() ne ''}"><br /><img width="420" height="233" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}"></c:if>--%>
<%--					<br><c:if test="${u.getPhoto() ne ''}"><br/><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo"></c:if>--%>
<%--				<input type="file" name="photo" value="${u.getPhoto()}" /><c:if test="${u.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${u.getPhoto}"></c:if></td></tr>--%>
		<tr><td>RC:</td><td><input type="text" name="detail" value="<%= u.getDetail()%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="Edit Post"/>
			<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
	</table>
</form>

</body>
</html>
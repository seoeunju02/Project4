<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.demo.dao.MemberDAO"%>
<%@ page import="com.example.demo.common.FileUpload" %>
<%@ page import="com.example.demo.bean.MemberVO" %>
<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.demo.bean.MemberVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	MemberDAO memberDAO = new MemberDAO();
	FileUpload upload = new FileUpload();
	MemberVO u =upload.uploadPhoto(request);
	int i= memberDAO.updateMember(u);
	response.sendRedirect("posts.jsp");

%>
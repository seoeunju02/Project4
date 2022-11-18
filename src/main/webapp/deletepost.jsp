<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.demo.dao.MemberDAO, com.example.demo.bean.MemberVO, com.example.demo.common.FileUpload"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberVO u = new MemberVO();
		u.setSid(id);
		MemberDAO memberDAO = new MemberDAO();

		String filename =memberDAO.getPhotoFilename(id);
		if(filename!=null)
			FileUpload.deleteFile(request,filename);
		memberDAO.deleteMember(u);
	}
	response.sendRedirect("posts.jsp");
%>
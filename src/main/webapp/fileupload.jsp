<%--
  Created by IntelliJ IDEA.
  User: seoeunju
  Date: 2022/11/18
  Time: 6:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.example.demo.*,java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.sun.xml.internal.ws.api.ha.StickyFeature" %>

<%--파일명: <%=filename%><br/>--%>
<%--<img src="${pageContext.request.contextPath}/upload/<%=filename%>">--%>
<!DOCTYPE html>
<html>
<head>
    <title>파일업로드결과</title>
</head>
<body>
<%
    String filename="";
    int sizeLimit =15*1024*1024;

    String realPath =request.getServletContext().getRealPath("upload");
    File dir =new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest =null;
    multipartRequest = new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());

    filename=multipartRequest.getFilesystemName("photo");
%>
</body>
</html>

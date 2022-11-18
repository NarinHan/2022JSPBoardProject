<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>File Upload Result</title>
</head>
<body>
<%
    String filename = ""; // 업로드 되는 파일 이름 저장용
    int sizeLimit = 15 * 1024 * 1024; // 파일크기 15MB

    // 실제로 서버에 저장되는 경로를 "upload" 로 정함
    String realPath = request.getServletContext().getRealPath("upload");

    // 혹시 저장될 경로가 없으면 생성
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    // 파일 업로드 처리 과정
    // 파라미터 : request, 파일저장경로, 최대용량, 인코딩, 중복 파일명에 대한 정책
    // DefaultFileRenamePolicy() : 중복된 이름이 존재할 경우 처리방법 - 뒤에 숫자를 붙임
    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    // "photo" 라는 이름으로 전송되어 업로드된 파일 이름 가져옴
    filename = multipartRequest.getFilesystemName("photo");
%>
</body>
</html>

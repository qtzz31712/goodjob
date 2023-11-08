<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="EUC-KR">
<title>공지사항 작성</title>

<link href="<c:url value='/resources/css/admin/notice/notice_Form.css' />" rel="stylesheet" type="text/css">

</head>
<body>

<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>

	<h2>공지사항 작성</h2>
	<form action="<c:url value = '/admin/notice/createNotice' />" method="post" name="modify_notice_form">
	<input type="text" name="n_title" placeholder="제목"> <br>
	<textarea name="n_article" placeholder="내용" ></textarea>
	
	<input type="submit" value="작성완료" >
	<input type="reset" value="작성취소">
	
	</form>
	

<jsp:include page="../../include/footer.jsp" />


</body>
</html>
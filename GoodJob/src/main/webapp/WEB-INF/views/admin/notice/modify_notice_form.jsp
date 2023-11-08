<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>


<h2>공지사항 작성</h2>
	<form action="<c:url value = '/admin/notice/modifyNoticeFormConfirm' />" method="post" name="modify_notice_form">
	<input type="text" name="n_title" value="${noticeVo.n_title }"> <br>
	<input type="text" name="n_article" value="${noticeVo.n_article }"> <br>
	
	
	<input type="submit" value="작성완료">
	<input type="reset" value="작성취소">
	</form>


 <jsp:include page="../../include/footer.jsp" />
</body>
</html>
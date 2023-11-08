<%@ page import="team.pj.goodjob.user.member.UserMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>공지사항</h1>
	<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>
	<form action="<c:url value='/admin/notice/modifyNoticeFormConfirm'/>" name="notice_detail" method="post" >
	<input type="text" name="n_title" value="${noticeVo.n_title }" > <br>
	<input type="text" name="n_article" value="${noticeVo.n_article}" > <br>
	
	<c:if test="${loginedAdminMemberVo.u_id == 'admin'}">
	<input type="submit" value="수정하기" >
	<input type="reset" value="작성취소">
	</c:if>
	</form>

<jsp:include page="../../include/footer.jsp" />
</body>
</html>
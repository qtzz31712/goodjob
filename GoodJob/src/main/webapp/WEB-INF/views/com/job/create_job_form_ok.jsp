<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="team.pj.goodjob.com.member.ComMemberVo"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link href="<c:url value = '/resources/css/com/comcreateformok.css'/>"
		rel="stylesheet" type="text/css">
			<jsp:include page="../../include/header.jsp" />
	<div id="section_wrap">

		<div class="word">

			<h3>채용공고 작성완료</h3>

		</div>

		<%
		ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");
		%>


		<div class="others">
			<c:url value="/job/com/recruitlist" var="list_url">
				<c:param name="rec_c_no" value="${loginedComMemberVo.c_no}" />
			</c:url>
			<a href="${list_url}">리스트보기</a>

		</div>

	</div>
<jsp:include page="../../include/footer.jsp" />

</body>
</html>
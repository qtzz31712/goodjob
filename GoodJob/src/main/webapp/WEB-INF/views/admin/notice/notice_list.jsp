<%@ page import="team.pj.goodjob.user.member.UserMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항</title>

<link href="<c:url value='/resources/css/admin/notice/notice_list.css' />" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>
	

	<%
	UserMemberVo loginedUserMemberVo = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
	%>
<div class="real_body">
<h1>공지사항</h1>

 <c:if test="${loginedUserMemberVo.u_id == 'admin'}">
<a href="<c:url value='/admin/notice/goNoticeForm'/>">글쓰기</a>
</c:if>

<table class="type08" border="1">
	<thead>
	<tr>	
		<th scope="cols">제목</th>
		<th scope="cols">내용</th>
		<th scope="cols">작성일</th>
		<th scope="cols">보기</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${noticeVos }">
	<tr>
		<th scope="row">${item.n_title}</th>
		<td>${item.n_article}</td>
		<td>${item.n_date}</td>
		 <td>
        <c:url value="/admin/notice/noticeDetail" var="detail_url">
			<c:param name="n_no" value="${item.n_no}"/>
		</c:url>
			<a href="${detail_url}">자세히보기</a>
		</td>
	</tr>
	</c:forEach>
	</tbody>	
</table>

</div>



<jsp:include page="../../include/footer.jsp" />

</body>
</html>
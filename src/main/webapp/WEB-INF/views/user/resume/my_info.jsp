<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="team.pj.goodjob.user.member.UserMemberVo"%>
<link href="<c:url value='/resources/css/user/resume/my_info.css' />"
	rel="stylesheet" type="text/css">

<%
UserMemberVo loginedUserMemberVo = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
String userid = null;
if (loginedUserMemberVo != null) {
	String originalDate = loginedUserMemberVo.getU_bd(); // 원래 형식의 날짜 문자열
	String newDate = originalDate.substring(0, 4) + "." + originalDate.substring(4, 6) + "."
	+ originalDate.substring(6);
%>

<div id="my_info_wrap">
<h3>나의 정보</h3>
	<div class="my_info">
		<div class="info">
			<p class="name">${loginedUserMemberVo.u_name}</p>
			<p class="gender name_sub">
				<c:choose>
					<c:when test="${loginedUserMemberVo.u_gender eq 'M' }">남자</c:when>
					<c:when test="${loginedUserMemberVo.u_gender eq 'W' }">여자</c:when>
				</c:choose>
			</p>
			<p class="birthday name_sub"><%=newDate%></p>
		</div>
		<div class="info_sub_wrap">
			<div class="address info_sub">
				<h5>주소</h5>
				<p>${loginedUserMemberVo.u_addr}</p>
			</div>
			<div class="phone info_sub">
				<h5>휴대폰</h5>
				<p>${loginedUserMemberVo.u_ph}</p>
			</div>
			<div class="email info_sub">
			<h5>이메일</h5>
				<p>${loginedUserMemberVo.u_email}</p>
			</div>
		</div>
	</div>
</div>
<%
}
%>



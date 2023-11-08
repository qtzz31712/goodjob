
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team.pj.goodjob.user.member.UserMemberVo" %>
<%@ page import="team.pj.goodjob.com.member.ComMemberVo" %>

<script type="text/javascript">
	
</script>

<link href="<c:url value='/resources/css/common/nav.css' />" rel="stylesheet" type="text/css">

<nav>
	<div class="menu">
		   <%
	    	UserMemberVo loginedUserMemberVo  = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
		   ComMemberVo loginedComMemberVo  = (ComMemberVo) session.getAttribute("loginedComMemberVo");
	      	String userid=null;
	      	String comid=null;
	    	if (loginedUserMemberVo != null) {		    
	    %>
	<ul class="first">
		<li class="rcinfo"><a href="<c:url value='/job' />" class="job">채용정보</a>
        </li>
		<li class="user"><a href="<c:url value='#' />" class="">회원서비스(개인)</a>
			<ul class="second">
				<li><a href="<c:url value='/resume/createResumeForm' />">이력서등록</a></li>
				<li><c:url value="/resume/resume_list_ajax" var="list_url">
					<c:param name="r_u_no" value="${loginedUserMemberVo.u_no}" />
				</c:url>
			<a href="${list_url}">이력서리스트</a></li>
				<li><a href="<c:url value='#' />">지원현황</a></li>
				<li><a href="<c:url value='#' />">스크랩 공고</a></li>
			</ul>
		</li>
		<li class="ask"><a href="<c:url value='#' />" class="">고객센터</a>
			<ul class="second">
				<li><a href="<c:url value='/admin/notice/callNoticeList' />">공지사항</a></li>
				<li><a href="<c:url value='/user/ask/callAskList' />">문의/제안/신고</a></li>
			</ul>
        </li>
	</ul>
	<% } else if (loginedComMemberVo != null) { %>
	<ul class="first">
		<li class="rcinfo"><a href="<c:url value='/job' />" class="job">채용정보</a>
        </li>
		<li class="com"><a href="<c:url value='#' />" class="">회원서비스(기업)</a>
			<ul class="second">
				<li><a href="<c:url value='/job/createJob' />">공고등록</a></li>
				<li>
					<c:url value="/job/com/recruitlist" var="list_url">
					<c:param name="rec_c_no" value="${loginedComMemberVo.c_no}"/>
					</c:url> <a href="${list_url}">공고리스트</a> 
					</li>
				<li><a href="<c:url value='#' />">지원자현황</a></li>
			</ul>
		</li>
		<li class="ask"><a href="<c:url value='#' />" class="">고객센터</a>
			<ul class="second">
				<li><a href="<c:url value='/admin/notice/callNoticeList' />">공지사항</a></li>
				<li><a href="<c:url value='/user/ask/callAskList' />">문의/제안/신고</a></li>
			</ul>
        </li>
	</ul>
	<% } else {%>
	<ul class="first">
		<li class="rcinfo"><a href="<c:url value='/job' />" class="job">채용정보</a>
        </li>
		<li class="user"><a href="<c:url value='#' />" class="">회원서비스(개인)</a>
			<ul class="second">
				<li><a href="<c:url value='/user/member/loginForm' />">이력서등록</a></li>
				<li><a href="<c:url value='/user/member/loginForm' />">이력서관리</a></li>
				<li><a href="<c:url value='/user/member/loginForm' />">지원현황</a></li>
				<li><a href="<c:url value='/user/member/loginForm' />">스크랩 공고</a></li>
			</ul>
		</li>
		<li class="com"><a href="<c:url value='#' />" class="">회원서비스(기업)</a>
			<ul class="second">
				<li><a href="<c:url value='/user/member/loginForm' />">공고등록</a></li>
				<li><a href="<c:url value='/user/member/loginForm' />">공고관리</a></li>
				<li><a href="<c:url value='/user/member/loginForm' />">지원자현황</a></li>
			</ul>
		</li>
		<li class="ask"><a href="<c:url value='#' />" class="">고객센터</a>
			<ul class="second">
				<li><a href="<c:url value='/admin/notice/callNoticeList' />">공지사항</a></li>
				<li><a href="<c:url value='/user/ask/callAskList' />">문의/제안/신고</a></li>
			</ul>
        </li>
	</ul>
	<% } %>
	</div>
</nav>
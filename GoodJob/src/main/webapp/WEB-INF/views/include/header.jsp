<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="team.pj.goodjob.user.member.UserMemberVo"%>
<%@ page import="team.pj.goodjob.com.member.ComMemberVo"%>


<link href="<c:url value='/resources/css/common/header.css' />" rel="stylesheet" type="text/css">

<header>

	<!-- <p>헤더에는 로그인 여부와 회원타입을 확인한 후 적절한 메뉴 출력</p>  -->

	<div id="header_wrap">
		<div class="logo">
		<a href="<c:url value='/'/>" class="로고"><img 
			src="<c:url value='/resources/image/common/gj_final.png' />" alt="logo"></a>
			</div>
		<div class="checklogin">
			<%
	    	UserMemberVo loginedUserMemberVo  = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
	      	String userid=null;
	    	ComMemberVo loginedComMemberVo  = (ComMemberVo) session.getAttribute("loginedComMemberVo");
		    String comid=null;
	    	if (loginedUserMemberVo != null ) {
	    	  	userid =loginedUserMemberVo.getU_id();
	    		out.println(userid+"님 어서오세요 !");		    
	    %>

			<div class="checklogin">
				<ul>

					<li><a href="<c:url value='/user/member/logoutConfirm' />">로그아웃</a></li>
					<li><a href="<c:url value='/user/member/modifyAccountForm' />">정보수정</a></li>

				</ul>
			</div>
			<% 
			}else if (loginedComMemberVo != null) {
	    	  	comid =loginedComMemberVo.getC_id();
	    		out.println(comid+"님 어서오세요 !");
	    		%>
			<div class="checklogin">
				<ul>

					<li><a href="<c:url value='/com/member/logoutConfirm' />">로그아웃</a></li>
					<li><a href="<c:url value='/com/member/modifyAccountForm' />">정보수정</a></li>

				</ul>
			</div>
<% } else { %>
			<div class="checklogin">
				<ul>
					<li><a href="<c:url value='/user/member/loginForm' />">로그인</a></li>
					<li><a href="<c:url value='/join' />">회원가입</a></li>
				</ul>
			</div>
<% } %>
		</div>

	</div>
	
</header>
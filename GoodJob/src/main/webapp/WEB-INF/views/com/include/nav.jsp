<%@ page import="team.pj.goodjob.com.member.ComMemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	

</script>

<nav>
	<div id="nav_wrap">
	
	    <%
	    	ComMemberVo loginedComMemberVo  = (ComMemberVo) session.getAttribute("loginedComMemberVo");
	      	String comid=null;
	    	if (loginedComMemberVo != null) {
	    	 // 	comid =loginedComMemberVo.getC_id();
	    		//out.println(comid+"님 어서오세요 !");
	    		    
	    %>
	    
	    <div class="menu">
	    	${loginedComMemberVo.c_id}님 어서오세요.!!!<br>
			<ul>
				
				<li><a href="<c:url value='/com/member/logoutConfirm' />">로그아웃</a></li>
				<li><a href="<c:url value='/com/member/modifyAccountForm' />">정보수정</a></li>
				<li><a href="<c:url value='/book/user/enterBookshelf' />">나의책장</a></li>
			</ul>
		</div>
	    
	    <% 	   
	       } else {
	    %>
	    
	    <div class="menu">
			<ul>
				<li><a href="<c:url value='/com/member/loginForm' />">로그인</a></li>
				
				<li><a href="<c:url value='/join' />">회원가입</a></li>
			</ul>
		</div>  
	    
	    <%
	       }
	    %>
		
		
	</div>
</nav>
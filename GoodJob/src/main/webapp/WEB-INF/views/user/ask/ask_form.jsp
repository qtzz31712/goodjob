<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="team.pj.goodjob.user.member.UserMemberVo" %>
     <%@ page import="team.pj.goodjob.com.member.ComMemberVo"%>
     
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="<c:url value='/resources/css/user/ask/ask_form.css' />" rel="stylesheet" type="text/css">

</head>

<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>



<body>
    <%
    int a_u_no = 0;
    if (session.getAttribute("loginedComMemberVo")!=null){
    	ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");
		a_u_no = loginedComMemberVo.getC_no();
	} else if (session.getAttribute("loginedUserMemberVo")!=null) {
		UserMemberVo loginedUserMemberVo  = (UserMemberVo) session.getAttribute("loginedUserMemberVo");
		a_u_no = loginedUserMemberVo.getU_no();
	}
    	
         String a_u_type = (String) session.getAttribute("userType");
         System.out.println(a_u_no + "들어왔는가");
         System.out.println(a_u_type + "제대로 들어왔는가");
    %>

	
			<h1>기업			
			</h1>
			
		
			
    		<div class="container">
    	 	<form action="<c:url value='/user/ask/insertAskForm'/>" name="create_ask_form" method="post" enctype="multipart/form-data">
  
        	<input type="hidden" name="a_u_no" value="<%= a_u_no %>">
    		<input type="hidden" name="a_u_type" value="<%= a_u_type %>" >
    
    		 
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="fname">이메일</label>
    	    </div>
    	    <div class="col-75">
    	      <input type="text" id="fname" name="a_email" placeholder="이메일을 작성하시오">
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="lname">전화번호</label>
    	    </div>
    	    <div class="col-75">
    	      <input type="text" id="lname" name="a_phone" placeholder="전화번호를 입력하시오">
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="country">문의유형</label>
    	    </div>
    	    <div class="col-75">
    	      <select id="country" name="a_part">
    	        <option value="회원정보">회원정보</option>
    	        <option value="이력서관리">이력서관리</option>
    	        <option value="구직활동관리">구직활동관리</option>
    	        <option value="공고등록관리">공고등록관리</option>
    	      </select>
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="subject">문의내용</label>
    	    </div>
    	    <div class="col-75">
    	      <textarea id="subject" name="a_article" placeholder="내용을작성하시오" style="height:200px"></textarea>
    	    </div>
    	  </div>
    	  <br>
    	  <div class="row submit_button">
    	    <input type="submit" value="Submit">
    	    <input type="reset"  value="reset">
    	  </div>
    	  </form>
    	</div>
    	   

	<jsp:include page="../../include/footer.jsp" />
</body>
</html>
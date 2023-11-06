<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import="team.pj.goodjob.user.member.UserMemberVo" %>
      <%@ page import="team.pj.goodjob.admin.ask.AskVo" %>
       <%@ page import="team.pj.goodjob.com.member.ComMemberVo"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/user/ask/ask_form.css' />" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>
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



		<div class="container">
    	 <form>
    		 
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="fname">이메일</label>
    	    </div>
    	    <div class="col-75">
    	      <input type="text" id="fname" name="a_email" value="${askVos.a_article }" readonly>
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="lname">전화번호</label>
    	    </div>
    	    <div class="col-75">
    	      <input type="text" id="lname" name="a_phone" value="${askVos.a_phone }" readonly>
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="country">문의유형</label>
    	    </div>
    	    <div class="col-75">
    	      <select id="country" name="a_part"  value="${askVos.a_part}" readonly>
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
    	      <textarea id="subject" name="a_article" value="${askVos.a_article }" readonly style="height:200px"></textarea>
    	    </div>
    	  </div>
    	  <br>
    	    <p>askVos.a_u_no 값: ${askVos.a_u_no}</p>
			<p>a_u_no 값: ${a_u_no}</p>
			<p>askVos.a_u_type 값: ${askVos.a_u_type}</p>
			<p>a_u_type 값: ${a_u_type}</p>
    	 
    	 	<c:if test="${askVos.a_u_no == loginedUserMemberVo.getU_no()}">     
    	 
					<div>
       				 <c:url value="/user/ask/askModify" var="detail_url">
         				   <c:param name="a_no" value="${askVos.a_no}"/>
       				 </c:url>
      					  <a class="row submit_button" href="${detail_url}">수정하기</a>
   		 </div>
			</c:if>

			<c:if test="${askVos.a_u_no == loginedComMemberVo.getU_no()}">     
				<div>
        			<c:url value="/user/ask/askModify" var="detail_url">
           					 <c:param name="a_no" value="${askVos.a_no}"/>
       				 </c:url>
       						 <a class="row submit_button" href="${detail_url}">수정하기</a>
   				 </div>
			</c:if>
    	 
    	 
    	  </form>
    	</div>
    	   
	
	

<jsp:include page="../../include/footer.jsp" />


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/user/ask/ask_form.css' />" rel="stylesheet" type="text/css">

</head>
<body>

<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>


		<div class="container">
		
    	<form action="<c:url value='/user/ask/askModifyConfirm'/>" name="modify_ask_form" method="post" enctype="multipart/form-data"> 	  		 
    	    <input type="hidden" name="a_no" value="${askVo.a_no }"/>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="fname">이메일</label>
    	    </div>
    	    <div class="col-75">
    	      <input type="text" id="fname" name="a_email"  value="${askVo.a_email }">
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="lname">전화번호</label>
    	    </div>
    	    <div class="col-75">
    	      <input type="text" id="lname" name="a_phone"  value="${askVo.a_phone }">
    	    </div>
    	  </div>
    	  <div class="row">
    	    <div class="col-25">
    	      <label for="country">문의유형</label>
    	    </div>
    	    <div class="col-75">
    	      <select id="country" name="a_part" value="${askVo.a_part }">
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
    	      <textarea id="subject" name="a_article" value="${askVo.a_article}" style="height:200px"></textarea>
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
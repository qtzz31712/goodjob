<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/com/create_account_result.css' />" rel="stylesheet" type="text/css">

</head>
<body>

	 <jsp:include page="../../include/header.jsp" /> 
	

	
	<section>
		
		<div id="section_wrap">
		
			<div class="word">
			
				<h3>계정 생성이 불가능합니다.</h3>
				
			</div>
			
			<div class="others">
				
				<a href="<c:url value='/com/member/createAccountForm' />">회원가입</a>
				<a href="<c:url value='/com/member/loginForm' />">로그인</a>
				
			</div>
		
		</div>
		
	</section>
	
	 <jsp:include page="../../include/footer.jsp" />
	
</body>
</html>
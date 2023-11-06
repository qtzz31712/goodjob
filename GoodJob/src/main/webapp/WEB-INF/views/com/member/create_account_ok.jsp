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
	
	<%-- <jsp:include page="../../include/nav.jsp" /> --%>
	
	<section>
		
		<div id="section_wrap">
		
			<div class="word">
			
				<h3>회원이 되신것을 환영합니다.</h3>
				
			</div>
			
			<div class="others">
				
				<a href="<c:url value='/com/member/loginForm' />">로그인</a>
				
			</div>
		
		</div>
		
	</section>
	
	 <jsp:include page="../../include/footer.jsp" /> 
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/user/login_result.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function loginForm() {
		console.log('loginForm() CALLED!!');
		
		let form = document.login_form;
		
		if (form.u_m_id.value == '') {
			alert('INPUT USER ID.');
			form.u_m_id.focus();
			
		} else if (form.u_m_pw.value == '') {
			alert('INPUT USER PW.');
			form.u_m_pw.focus();
			
		} else {
			form.submit();
			
		}
		
	}

</script>

</head>
<body>

	<jsp:include page="../../include/header.jsp" />
	 
	
	
	<section>
		
		<div id="section_wrap">
		
			<div class="word">
			
				<h3>로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.</h3>
				
			</div>
			
			<div class="others">
				
				<a href="<c:url value='/join' />">회원가입</a>
				<a href="<c:url value='/com/member/loginForm' />">로그인</a>
				
			</div>
		
		</div>
		
	</section>
	
 	<jsp:include page="../../include/footer.jsp" /> 
	
</body>
</html>
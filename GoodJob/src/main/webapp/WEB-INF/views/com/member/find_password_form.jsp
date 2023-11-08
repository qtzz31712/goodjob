<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/com/find_password_form.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function findPasswordForm() {
		console.log('findPasswordForm() CALLED!!');
		
		let form = document.find_password_form;
		
		if (form.c_id.value == '') {
			alert('아이디를 입력하세요.');
			form.c_id.focus();
			
		} else if (form.c_comname.value == '') {
			alert('회사명을 입력하세요.');
			form.c_comname.focus();
			
		} else if (form.c_email.value == '') {
			alert('이메일을 입력하세요.');
			form.c_email.focus();
			
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
			
				<h3>비밀번호 찾기</h3>
				
			</div>
			
			<div class="find_password_form">
			
				<form action="<c:url value='/com/member/findPasswordConfirm' />" name="find_password_form" method="post">
					
					<div class="select_id">
						<a class="userid" href="<c:url value='/user/member/findPasswordForm'/>">개인회원</a>
						<a class="comid" href="<c:url value='/com/member/findPasswordForm'/>">기업회원</a> 
					</div>
					<div class="findbox">
					<div><span>아이디</span><input type="text" name="c_id" placeholder="아이디를 입력하세요."> <br></div>
					<div><span>이름</span><input type="text" name="c_comname" placeholder="회사명을 입력하세요."> <br></div>
					<div><span>이메일</span><input type="text" name="c_email" placeholder="회사메일을 입력하세요."> <br></div>
					</div>
					<input class="find_btn" type="button" value="비밀번호 찾기" onclick="findPasswordForm();"> 
					
				
				<!-- 	<input type="reset" value="reset"> -->
					
				</form>
				
			</div>
			
			<div class="create_account_login">
				
				<a href="<c:url value='/com/member/createAccountForm' />">회원 가입</a>
				<a href="<c:url value='/com/member/loginForm' />">로그인</a>
				
			</div>
		
		</div>
		
	</section>
	
	<jsp:include page="../../include/footer.jsp" />
	
</body>
</html>
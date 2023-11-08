<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/user/login_form.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function loginForm() {
		console.log('loginForm() CALLED!!');
		
		let form = document.login_form;
		
		if (form.u_id.value == '') {
			alert('아이디를 입력하세요.');
			form.u_id.focus();
			
		} else if (form.u_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.u_pw.focus();
			
		} else {
			form.submit();
			
		}
		
	}

</script>
</head>


	<!-- <h1>로그인 폼</h1>
	<pre>
        [기능명세서]
        1. 입력받은 회원타입, 아이디, 비밀번호를 DB와 비교해 회원임을 확인한다.
        	1-1. 아이디와 비밀번호를 모두 입력했을 때에만 로그인폼을 전송한다.
        2. 로그인 성공 시, 회원타입과 회원번호를 세션에 저장하고 홈화면으로 이동한다.
    </pre> -->

<body>
	<jsp:include page="../../include/header.jsp" />
	
	<section>
		<div id="section_wrap">
			<div class="login_form">
			
				<a href="<c:url value='/'/>" class="로고"><img 
				src="<c:url value='/resources/image/common/gj_final.png' />" alt="logo"></a>
				<form action="<c:url value='/user/member/loginConfirm' />" name="login_form" method="post">
				<div class="select_id">
					
					<a class="userid" href="<c:url value='/user/member/loginForm'/>">개인회원</a>
					<a class="comid" href="<c:url value='/com/member/loginForm'/>">기업회원</a> 
				</div>
				<div class=idbox>
				<input type="hidden"	name="loginType" value="">
				<div>
				<input type="text"		name="u_id" 		placeholder="아이디를 입력하세요."> <br>
				<input type="password"	name="u_pw" 		placeholder="비밀번호를 입력하세요."> <br>
				</div>
				<input type="button"	value="로그인" onclick="loginForm();">
				</div>
				</form>
			</div>
			<div class="find_join">
				<a href="<c:url value='/findIdForm' />">아이디 찾기</a>
				<a href="<c:url value='/user/member/findPasswordForm' />">비밀번호 찾기</a>
				<a href="<c:url value='/join' />">회원가입</a>
			</div>
		</div>

	</section>
	<jsp:include page="../../include/footer.jsp" />
</body>
</html>
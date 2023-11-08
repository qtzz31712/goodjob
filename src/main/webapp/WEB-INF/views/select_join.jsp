<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css'/>"rel="stylesheet"type="html">
<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/common/select_join.css' />" rel="stylesheet" type="text/css">

<title>title</title>
</head>
<body>

<!-- 	<h1>회원가입 유형 선택 페이지</h1>
	<pre>
        [기능명세서]
        1. 회원가입 유형을 선택하게 한다.
    </pre> -->
    <jsp:include page="./include/header.jsp" />
    <h2>알바몬·잡코리아 통합 회원가입을 환영합니다.</h2>
<section>

	<div id="section_wrap">
		<div class="select_join_form">
		<ul class="imgBox">
			<li>
				<ul>
					<li><p>이력서를 등록하고 알바를 찾아보세요.</p></li>
					<li><img src="<c:url value='/resources/image/user/join_member.jpg' />"></li>
				
				
					<li><a class="user_account" href="<c:url value='/user/member/createAccountForm' />">개인회원 가입</a></li>
				</ul>
			</li>
			<li>
				<ul>
					<li><p>공고를 등록하고 인재를 찾아보세요.</p></li>
					<li><img src="<c:url value='/resources/image/user/join_corp.jpg' />"></li>
				
				
					<li><a class="com_account"href="<c:url value='/com/member/createAccountForm' />">기업회원 가입</a></li>
				</ul>
			</li>
			
			
		</ul>
		</div>
	</div>

</section>
	 <jsp:include page="./include/footer.jsp" />
</body>
</html>
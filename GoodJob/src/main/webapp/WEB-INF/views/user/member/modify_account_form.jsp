<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/user/modify_account_form.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function modifyAccountForm() {
		console.log('modifyAccountForm() CALLED!!');
		
		let form = document.modify_account_form;
		
		if (form.u_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.u_pw.focus();
			
		} else if (form.u_name.value == '') {
			alert('이름을 입력하세요.');
			form.u_name.focus();
			
		} else if (form.u_email.value == '') {
			alert('이메일을 입력하세요.');
			form.u_email.focus();
			
		} else if (form.u_addr.value == '') {
			alert('주소를 입력하세요.');
			form.u_addr.focus();
			
		} else if (form.u_ph.value == '') {
			alert('INPUT USER NAME.');
			form.u_ph.focus();
			
		} else if (form.u_bd.value == '') {
			alert('생년월일을 입력하세요.');
			form.u_bd.focus();
			
		} else if (form.u_gender.value == '') {
			alert('성별을 입력해주세요.');
			form.u_gender.focus();
			
		} else if (form.u_focus_com.value == '') {
			alert('관심회사를 입력하세요.');
			form.u_focus_com.focus();
			
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
			
				<h3>회원정보 수정</h3>
				
			</div>
			<div class="info">
			
				<h3>필수정보</h3>
				
			</div>
			<div class="modify_account_form">
				
				<form action="<c:url value='/user/member/modifyAccountConfirm' />" name="modify_account_form" method="post">
					<div class="inputBox">
					<input type="hidden" name="u_no" value="${loginedUserMemberVo.u_no}">
					
					<div><label>아이디</label><input type="text" name="u_id" value="${loginedUserMemberVo.u_id}" readonly disabled> <br></div>
					<div><label>비밀번호</label><input type="password" name="u_pw" value=""> <br></div>
					<div><label>이름</label><input type="text" name="u_name" value="${loginedUserMemberVo.u_name}" placeholder="이름을 입력하세요."> <br></div>
					<div><label>주민등록 번호</label><input type="text" name="u_rn" value="${loginedUserMemberVo.u_rn}" readonly disabled> <br></div>
					<div><label>이메일</label><input type="email"	name="u_email" value="${loginedUserMemberVo.u_email}" placeholder="이메일을 입력하세요." ><br></div>
					<div><label>주소</label><input type="text" name="u_addr" value="${loginedUserMemberVo.u_addr}" placeholder="주소를 입력하세요."> <br></div>
					<div><label>휴대폰 번호</label><input type="text" name="u_ph"	value="${loginedUserMemberVo.u_ph}" placeholder="휴대폰 번호 '-'제외하고 입력하세요."> <br></div>
					<div><label>생년 월일</label><input type="text" name="u_bd"	value="${loginedUserMemberVo.u_bd}" placeholder="생년월일을 입력하세요."> <br></div>
					<div><label>성별</label><select name="u_gender">
						<option value="">성별을 입력하세요</option>
						<option value="M" <c:if test="${loginedUserMemberVo.u_gender eq 'M'}"> selected </c:if> >Man</option>
						<option value="W" <c:if test="${loginedUserMemberVo.u_gender eq 'W'}"> selected</c:if> >Woman</option>
						
					</select> <br></div>
					
					<div><label>관심 회사</label><input type="text" name="u_focus_com"	value="${loginedUserMemberVo.u_focus_com}" placeholder="관심회사를 입력하세요."> <br></div>
					
					</div>
					<div class="btn"><input type="button" value="정보 수정" onclick="modifyAccountForm();"> 
					<input type="reset" value="다시 작성하기"></div>
					
				</form>
				
			</div>
		
		</div>
		
	</section>
	
	<jsp:include page="../../include/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/com/modify_account_form.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function modifyAccountForm() {
		console.log('modifyAccountForm() CALLED!!');
		
		let form = document.modify_account_form;
		
		if (form.c_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.c_pw.focus();
			
		} else if (form.c_comname.value == '') {
			alert('회사명을 입력하세요.');
			form.c_name.focus();
			
		} else if (form.c_rn.value == '') {
			alert('사업자번호를 입력하세요.');
			form.c_rn.focus();
			
		} else if (form.c_email.value == '') {
			alert('이메일을 입력하세요.');
			form.c_email.focus();
			
		} else if (form.c_addr.value == '') {
			alert('주소를 입력하세요.');
			form.c_addr.focus();
			
		} else if (form.c_comph.value == '') {
			alert('대표 번호를 '-'제외하고 입력하세요.');
			form.c_comph.focus();
			
		} else if (form.c_hrname.value == '') {
			alert('인사담당자이름을 입력하세요.');
			form.c_hrname.focus();
			
		} else if (form.c_ceo_name.value == '') {
			alert('회사 대표를 입력하세요.');
			form.c_ceo_name.focus();
			
		}else {
			form.submit();
			
		}
		
	}

</script>
</head>
<body>
<h1>기업 회원정보 수정 페이지</h1>

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
				
				<form action="<c:url value='/com/member/modifyAccountConfirm' />" name="modify_account_form" method="post">
					<div class="inputBox">
					<input type="hidden" name="c_no" value="${loginedComMemberVo.c_no}">
					
					<div><label>아이디</label><input type="text" name="c_id" value="${loginedComMemberVo.c_id}" readonly disabled> <br></div>
					<div><label>비밀번호</label><input type="password" name="c_pw" value=""> <br></div>
					<div><label>회사명</label><input type="text" name="c_comname" value="${loginedComMemberVo.c_comname}" placeholder="회사명을 입력하세요."> <br></div>
					<div><label>사업자등록 번호</label><input type="text" name="c_rn" value="${loginedComMemberVo.c_rn}" readonly disabled> <br></div>
					<div><label>이메일</label><input type="email"	name="c_email" value="${loginedComMemberVo.c_email}" placeholder="이메일을 입력하세요." ><br></div>
					<div><label>주소</label><input type="text" name="c_addr" value="${loginedComMemberVo.c_addr}" placeholder="주소를 입력하세요."> <br></div>
					<div><label>회사 번호</label><input type="text" name="c_comph"	value="${loginedComMemberVo.c_comph}" placeholder="대표 번호를 '-'제외하고 입력하세요."> <br></div>
					<div><label>인사담당자 이름</label><input type="text" name="c_hrname"	value="${loginedComMemberVo.c_hrname}" placeholder="인사담당자이름을 입력하세요."> <br></div>
					<div><label>회사 대표</label><input type="text" name="c_ceo_name"	value="${loginedComMemberVo.c_ceo_name}" placeholder="회사 대표를 입력하세요."> <br></div>
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